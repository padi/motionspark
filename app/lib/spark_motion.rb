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
      endpoint: "https://api.sparkapi.com",
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

      headers = {
        :"User-Agent" => "MotionSpark RubyMotion Sample App",
        :"X-SparkApi-User-Agent" => "MotionSpark RubyMotion Sample App"
      }

      BW::HTTP.post(auth_grant_url, payload: payload, headers: headers) do |response|
        self.d1 = response
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

    def get # Future TODO: post, put
      # authorize if not authorized
      # do get request via BW or Cocoa # check which is better
    end
  end
end