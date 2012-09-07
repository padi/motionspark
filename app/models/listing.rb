class Listing
  # PROPERTIES = [:id, :list_price :public_remarks, :state, :city, :street_name, :list_office_phone, :list_office_email, :postal_code]
  PROPERTIES = [:id]
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
end
