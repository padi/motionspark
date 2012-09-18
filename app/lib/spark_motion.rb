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

    attr_accessor *VALID_OPTION_KEYS
    attr_accessor *ACCESS_KEYS

    DEFAULT = {
      api_key: nil,
      api_secret: nil,
      api_user: nil,
      endpoint: 'https://api.sparkapi.com',
      auth_endpoint: 'https://sparkplatform.com/oauth2',  # Ignored for Spark API Auth
      version: 'v1',
      user_agent: "Spark API RubyMotion Gem #{VERSION}",
      ssl: true
    }

    X_SPARK_API_USER_AGENT = "X-SparkApi-User-Agent"

    def initialize opts={}
      puts "#{self} initializing..."
      VALID_OPTION_KEYS.each do |key|
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
    end

    def authorize
      # do a post request containing code..
      # expect values to be assigned to ACCESS_KEYS attributes
      # also add extra setup here
    end

    def get # Future TODO: post, put
      # authorize if not authorized
      # do get request via BW or Cocoa # check which is better
    end
  end
end