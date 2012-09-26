class Listing
  # PROPERTIES = [:id, :list_price :public_remarks, :state, :city, :street_name, :list_office_phone, :list_office_email, :postal_code]
  PROPERTIES = [:ListingId, :PublicRemarks, :ListAgentFirstName, :ListAgentLastName, :ListPrice, :ListAgentEmail, :City]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize hash={}
    hash.each { |key, value|
      if PROPERTIES.member? key.to_sym
        self.send key.to_s + "=", value
      end
    }
  end

  def self.all &block
    # TODO: replace SparkMock.get '/listings' with a real http call to Spark API
    # - use oauth, private role
    # - get new token everytime a token expires (in 24 hours or 1 hour of inactivity)
    client = SparkMotion::OAuth2Client.instances.first || SparkMotion::OAuth2Client.new
    # client.get_user_permission
    client.get('/listings') do |response_body|
      response = BW::JSON.parse(response_body)

      # response = BW::JSON.parse(SparkMock.get '/listings')
      listings = []
      if response["D"]["Success"]
        response["D"]["Results"].each do |listing_data|
          listing = Listing.new listing_data["StandardFields"]
          listings << listing
        end
      end

      block.call(listings)
    end
  end

  def self.search text
    # TODO: this is a fake search result. replace with real search from API
    search_result = []
    search_result << self.all.first
    search_result
  end
end
