class ListingInformationController < UIViewController
  include BW::KVO

  LABELS = %w(listing_id public_remarks list_agent_first_name list_agent_last_name list_price list_agent_email)
  LABELS.each { |prop|
    attr_accessor prop
  }
  attr_accessor :listing

  stylesheet :listing_info

  layout :root do
    LABELS.each { |prop|
      self.send("#{prop}=", subview(UILabel, prop.to_sym))
    }

    navigationItem.title = 'Information'

    self.listing = Listing.new

    Listing::PROPERTIES.map(&:to_s).each { |prop|
      puts prop
      observe(self.listing, prop) do |old_value, new_value|

        property_label = UIApplication.sharedApplication.delegate.ivget("@listing_information_controller").ivget "@#{prop.underscore}"
        if property_label
          description = prop.split(/(?=[A-Z])/).join(" ")
          property_label.text = "#{description}: #{new_value}"
          property_label.sizeToFit
        else
          puts "@#{prop.underscore} does not exist... yet. :)"
        end
      end
    }
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    autorotateToOrientation(orientation)
  end

  def self.update_info(listing, &block)
    information_controller = UIApplication.sharedApplication.delegate.ivget('@listing_information_controller')

    Listing::PROPERTIES.map(&:to_s).each { |prop|
      information_controller.listing.send("#{prop}=", listing.send("#{prop}"))
    }

    block.call nil
  end
end
