# As a 3rd party developer
# To establish access with the Spark API
# I should be able to do the ff:
# - connection
# - authentication
# - request
module SparkMotion
  VERSION = "0.1.0"

  class OAuth2Client
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
      :access_code,
      :access_token,
      :refresh_token,
      :expires_in
    ]

    DEBUGGER = [:d1, :d2]

    attr_accessor *VALID_OPTION_KEYS
    attr_accessor *ACCESS_KEYS
    attr_accessor *DEBUGGER

    DEFAULT = {
      api_key: "e8cd72745paowh67h1lygapif",
      api_secret: "2d692kqxipv0o9yxovyp6s98b",
      api_user: nil,
      callback: "https://sparkplatform.com/oauth2/callback",
      endpoint: "https://developers.sparkapi.com", # change to https://api.developers.sparkapi.com for production
      auth_endpoint: "https://sparkplatform.com/oauth2",  # Ignored for Spark API Auth
      auth_grant_url: "https://api.sparkapi.com/v1/oauth2/grant",
      version: "v1",
      user_agent: "Spark API RubyMotion Gem #{VERSION}",
      ssl: true,

      access_code: nil,
      access_token: nil,
      refresh_token: nil,
      expires_in: 0
    }

    X_SPARK_API_USER_AGENT = "X-SparkApi-User-Agent"

    def initialize opts={}
      puts "#{self} initializing..."
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

    def get_user_permission
      # app opens safari and waits for a callback?code=<access_code>
      # <access_code> is then assigned to client.access_code

      self.access_code = "coufw6jtxsthsjquxl7zykwmq"
      return # so that access_code will not be printed in output
    end

    def authorize
      # do a post request containing code..
      # expect values to be assigned to ACCESS_KEYS attributes

      payload = {
        client_id: self.api_key,
        client_secret:  self.api_secret,
        grant_type: "authorization_code",
        redirect_uri: self.callback,
        code: self.access_code # access code returned together with callback
      }

      # http://sparkplatform.com/docs/api_services/read_first
      # These headers are required when requesting from the API
      # otherwise the request will return an error response.
      headers = {
        :"User-Agent" => "MotionSpark RubyMotion Sample App",
        :"X-SparkApi-User-Agent" => "MotionSpark RubyMotion Sample App"
      }

      BW::HTTP.post(auth_grant_url, payload: payload, headers: headers) do |response|
        response_body = BW::JSON.parse(response.body.to_str)
        if response.status_code == 200 # success
          # usual response:
          # {"expires_in":86400,"refresh_token":"bkaj4hxnyrcp4jizv6epmrmin","access_token":"41924s8kb4ot8cy238doi8mbv"}"

          self.access_token = response_body["access_token"]
          self.refresh_token = response_body["refresh_token"]
          self.expires_in = response_body["expires_in"]
          puts "SparkMotion: [status code 200] - Client is now authorized to make requests."
        else
          # usual response:
          # {"error_description":"The access grant you supplied is invalid","error":"invalid_grant"}

          # TODO: handle error in requests better.
          # - there should be a fallback strategy
          # - try to authorize again? (without going through a loop)
          # - SparkMotion::Error module
          puts "SparkMotion: ERROR [status code #{response.status_code}] - #{response_body["error_description"]}"
        end
      end
      # Also add extra setup here if needed

      # NOTE:
      # puts 'This line will run even before the post request ends'
      return
    end

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
    def get spark_url, options={} # Future TODO: post, put
      # authorize if not authorized
      headers = {
        :"User-Agent" => "MotionSpark RubyMotion Sample App",
        :"X-SparkApi-User-Agent" => "MotionSpark RubyMotion Sample App",
        :"Authorization" => "OAuth #{self.access_token}"
      }

      opts={}
      opts.merge!(options)
      opts.merge!({:headers => headers})

      # debug values
      puts 'debug info saved in d1 and d2'

      # https://<spark_endpoint>/<api version>/<spark resource>
      complete_url = self.endpoint + "/#{version}" + spark_url
      self.d2 = complete_url
      BW::HTTP.get(complete_url, opts) do |response|
        puts 'SparkMotion: [status code response.status_code] - response:'
        puts response.body.to_str
        self.d1 = BW::JSON.parse response.body.to_str
      end
    end

    def refresh_token

    end
  end
end