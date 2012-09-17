module SparkMotion
  VERSION = "0.1.0"

  module Configuration
    VALID_OPTION_KEYS = [
      :api_key,
      :api_secret,
      :api_user,
      :endpoint,
      :auth_endpoint,
      :callback,
      :user_agent,
      :version,
      :ssl,
      :oauth2_provider,
      :authentication_mode
    ].freeze

    DEFAULT_API_KEY = nil
    DEFAULT_API_SECRET = nil
    DEFAULT_API_USER = nil
    DEFAULT_ENDPOINT = 'https://api.sparkapi.com'
    DEFAULT_AUTH_ENDPOINT = 'https://sparkplatform.com/openid'  # Ignored for Spark API Auth
    DEFAULT_VERSION = 'v1'
    DEFAULT_USER_AGENT = "Spark API RubyMotion Gem #{VERSION}"
    DEFAULT_SSL = true
    DEFAULT_OAUTH2 = nil

    X_SPARK_API_USER_AGENT = "X-SparkApi-User-Agent"

    attr_accessor *VALID_OPTION_KEYS

    def configure
      yield self
    end

    def reset_configuration
      self.api_key     = DEFAULT_API_KEY
      self.api_secret  = DEFAULT_API_SECRET
      self.api_user    = DEFAULT_API_USER
      self.authentication_mode = SparkApi::Authentication::ApiAuth
      self.auth_endpoint  = DEFAULT_AUTH_ENDPOINT
      self.endpoint    = DEFAULT_ENDPOINT
      self.oauth2_provider = DEFAULT_OAUTH2
      self.user_agent  = DEFAULT_USER_AGENT
      self.ssl         = DEFAULT_SSL
      self.version     = DEFAULT_VERSION
      self
    end
  end

  # this is the only way to authenticate for now
  # As a developer
  # To be able to authenticate this app to Spark API using OAuth2
  # I should be able to use OAuth2 module
  module OAuth2
  end

  # As a developer
  # To sustain a connection with the Spark API
  # I should be able use a Client module
  # - connection
  # - authentication
  # - request

  module Client
  end
end