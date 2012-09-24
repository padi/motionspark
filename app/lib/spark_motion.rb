# As a 3rd party developer
# To establish access with the Spark API
# I should be able to do the ff:
# - connection
# - authentication
# - request
module SparkMotion
  VERSION = "0.1.0"

  class OAuth2Client
    include BW::KVO

    @@instances = []

    def self.instances
      @@instances ||= []
    end

    def self.first
      self.instances.first
    end

    VALID_OPTION_KEYS = [
      :api_key,
      :api_secret,
      :api_user,
      :endpoint,
      :auth_endpoint,
      :auth_grant_url,
      :callback,
      :user_agent,
      :version,
      :ssl
    ]

    # keys that are usually updated from Spark in order to access their API
    ACCESS_KEYS = [
      :authorization_code,
      :access_token,
      :refresh_token,
      :expires_in
    ]

    attr_accessor *VALID_OPTION_KEYS
    attr_accessor :authorized
    attr_accessor *ACCESS_KEYS

    DEBUGGER = [:d1, :d2]
    attr_accessor *DEBUGGER

    DEFAULT = {
      api_key: "e8cd72745paowh67h1lygapif",
      api_secret: "2d692kqxipv0o9yxovyp6s98bt",
      api_user: nil,
      callback: "https://sparkredirect.herokuapp.com",
      endpoint: "https://developers.sparkapi.com", # change to https://api.developers.sparkapi.com for production
      auth_endpoint: "https://sparkplatform.com/oauth2",  # Ignored for Spark API Auth
      auth_grant_url: "https://api.sparkapi.com/v1/oauth2/grant",
      version: "v1",
      user_agent: "Spark API RubyMotion Gem #{VERSION}",
      ssl: true,

      authorization_code: nil,
      access_token: nil,
      refresh_token: nil,
      expires_in: 0
    }

    X_SPARK_API_USER_AGENT = "X-SparkApi-User-Agent"

    def initialize opts={}
      puts "#{self} initializing..."
      @@instances << self
      (VALID_OPTION_KEYS + ACCESS_KEYS).each do |key|
        send("#{key.to_s}=", DEFAULT[key])
        puts "sent #{key.to_s} a default value"
      end
    end

    # Sample Usage:
    # client = SparkMotion::OAuth2Client.new
    # client.configure do |config|
    #   config.api_key      = "e8cd72745paowh67h1lygapif"
    #   config.api_secret   = "2d692kqxipv0o9yxovyp6s98b"
    #   config.callback     = "https://sparkplatform.com/oauth2/callback"
    #   config.auth_endpoint = "https://sparkplatform.com/oauth2" # different for hybrid
    #   config.endpoint   = 'https://developers.sparkapi.com'
    # end
    def configure
      yield self
      self
    end

    def get_user_permission &block
      # app opens Mobile Safari and waits for a callback?code=<authorization_code>
      # <authorization_code> is then assigned to client.authorization_code

      url = "https://sparkplatform.com/oauth2?response_type=code&client_id=yi5wkz6h79htk8lgqf9727iq&redirect_uri=https://sparkredirect.herokuapp.com"
      UIApplication.sharedApplication.openURL NSURL.URLWithString url

      # AppDelegate#application:handleOpenURL will assign the new authorization code
      # from this moment, `authorize` will trigger every time authorization_code changes
      observe(self, "authorization_code") do |old_value, new_value|
        self.authorize &block
      end

      return # so that authorization_code will not be printed in output
    end

    def authorize &block
      callback = auth_response_handler
      options = {payload: setup_payload, headers: setup_headers}

      block ||= -> { puts "SparkMotion: default callback."}
      BW::HTTP.post(auth_grant_url, options) do |response|
        callback.call response, block
      end
    end

    alias_method :refresh, :authorize

    # Usage:
    # client.get(url, options <Hash>)
    # url<String>
    #   - url without the Spark API endpoint e.g. '/listings', '/my/listings'
    #   - endpoint can be configured in `configure` method
    # options<Hash>
    #   - options used for the query
    #     :payload<String>   - data to pass to a POST, PUT, DELETE query. Additional parameters to
    #     :headers<Hash>     - headers send with the request
    #   - for more info in options, see BW::HTTP.get method in https://github.com/rubymotion/BubbleWrap/blob/master/motion/http.rb
    #
    # Example:
    # if client = SparkMotion::OAuth2Client.new
    #
    # for GET request https://developers.sparkapi.com/v1/listings?_limit=1
    # client.get '/listings', {:payload => {:"_limit" => 1}}
    #
    # for GET request https://developers.sparkapi.com/v1/listings?_limit=1&_filter=PropertyType%20Eq%20'A'
    # client.get '/listings', {:payload => {:_limit => 1, :_filter => "PropertyType Eq 'A'"}}
    def get(spark_url, options={}, &block) # Future TODO: post, put
      request = lambda {
        headers = {
          :"User-Agent" => "MotionSpark RubyMotion Sample App",
          :"X-SparkApi-User-Agent" => "MotionSpark RubyMotion Sample App",
          :"Authorization" => "OAuth #{self.access_token}"
        }

        opts={}
        opts.merge!(options)
        opts.merge!({:headers => headers})

        # https://<spark_endpoint>/<api version>/<spark resource>
        complete_url = self.endpoint + "/#{version}" + spark_url
        BW::HTTP.get(complete_url, opts) do |response|
          puts "SparkMotion: [status code response.status_code] [#{spark_url}]"

          response_body = response.body ? response.body.to_str : ""
          block ||= lambda { |returned| puts("SparkMotion: [status code #{response.status_code}] - Result:\n #{returned.inspect}") }
          block.call(response_body)
        end
      }

      if self.authorized
        puts 'SparkMotion: Authorization confirmed. Requesting...'
        request.call
      elsif !self.authorized
        puts 'SparkMotion: Authorization required. Falling back to authorization before requesting...'
        # TODO: get user permission first before trying #authorize...
        self.get_user_permission(&request)
      end
    end


    def previously_authorized?
      # a string is truthy, but this should not return the refresh token
      self.refresh_token && self.authorized ? true : false
    end

    private

    # payload common to `authorize` and `refresh`
    def setup_payload
      payload = {
        client_id: self.api_key,
        client_secret:  self.api_secret,
        redirect_uri: self.callback,
      }

      if previously_authorized?
        puts "SparkMotion: Previously authorized. Refreshing..."
        payload[:refresh_token] = self.refresh_token
        payload[:grant_type] = "refresh_token"
      elsif self.authorization_code
        puts "SparkMotion: Not previously authorized. Seeking authorization..."
        payload[:code] = self.authorization_code
        payload[:grant_type] = "authorization_code"
      end

      payload
    end

    def setup_headers
      # http://sparkplatform.com/docs/api_services/read_first
      # These headers are required when requesting from the API
      # otherwise the request will return an error response.
      headers = {
        :"User-Agent" => "MotionSpark RubyMotion Sample App",
        :"X-SparkApi-User-Agent" => "MotionSpark RubyMotion Sample App"
      }
    end

    def auth_response_handler
      lambda { |response, block|
        response_json = response.body ? response.body.to_str : ""
        response_body = BW::JSON.parse(response_json)
        if response.status_code == 200 # success
          # usual response:
          # {"expires_in":86400,"refresh_token":"bkaj4hxnyrcp4jizv6epmrmin","access_token":"41924s8kb4ot8cy238doi8mbv"}"

          self.access_token = response_body["access_token"]
          self.refresh_token = response_body["refresh_token"]
          self.expires_in = response_body["expires_in"]
          puts "SparkMotion: [status code 200] - Client is now authorized to make requests."

          self.authorized = true

          block.call if block && block.respond_to?(:call)
        else
          # usual response:
          # {"error_description":"The access grant you supplied is invalid","error":"invalid_grant"}

          # TODO: handle error in requests better.
          # - there should be a fallback strategy
          # - try to authorize again? (without going through a loop)
          # - SparkMotion::Error module
          puts "SparkMotion: ERROR [status code #{response.status_code}] - Authorization Unsuccessful - response body: #{response_body["error_description"]}"
          self.authorized = false
        end
      }
    end
  end
end

# handle url from safari to get authorization_code during OAuth2Client#get_user_permission
class AppDelegate
  def application(app, handleOpenURL:url)
    query = url.query_to_hash
    client = SparkMotion::OAuth2Client.first
    client.authorization_code = query["code"]
    return
  end

  private

  def queries_from_url url #Takes NSURL
    query_arr = url.query.split(/&|=/)
    query = Hash[*query_arr] # turns [key1,value1,key2,value2] to {key1=>value1, key2=>value2}
  end
end

class NSURL
  def query_to_hash
    query_arr = self.query.split(/&|=/)
    query = Hash[*query_arr] # turns [key1,value1,key2,value2] to {key1=>value1, key2=>value2}
  end
end