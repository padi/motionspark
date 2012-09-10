class Listing
  # PROPERTIES = [:id, :list_price :public_remarks, :state, :city, :street_name, :list_office_phone, :list_office_email, :postal_code]
  PROPERTIES = [:ListingId, :PublicRemarks, :ListAgentFirstName, :ListAgentLastName]
  PROPERTIES.each { |prop|
    attr_accessor prop
  }

  def initialize hash={}
    hash.each { |key, value|
      if PROPERTIES.member? key.to_sym
        puts "assigning... #{key}: #{value} \n"
        self.send key.to_s + "=", value
      end
    }
  end

  def self.all
    response = BW::JSON.parse(SparkMock.get '/listings')
    listings = []
    if response["D"]["Success"]
      response["D"]["Results"].each do |listing_data|
        listing = Listing.new listing_data["StandardFields"]
        listings << listing
      end
    end

    listings
  end
end
