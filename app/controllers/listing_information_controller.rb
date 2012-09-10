class ListingInformationController < UIViewController
  attr_accessor :listing_id, :public_remarks, :agent_name

  stylesheet :listing_info

  layout :root do
    self.listing_id = subview UILabel, :listing_id
    self.public_remarks = subview UILabel, :public_remarks
    self.agent_name = subview UILabel, :agent_name

    view.backgroundColor = UIColor.blackColor
    navigationItem.title = 'Information'
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    autorotateToOrientation(orientation)
  end

  def self.update_info(listing, &block)
    information_controller = UIApplication.sharedApplication.delegate.ivget('@listing_information_controller')

    # TODO: KVO should be applied here
    information_controller.listing_id.text = "Listing ID: #{listing.ListingId}"
    information_controller.public_remarks.text = "Public Remarks: #{listing.PublicRemarks}"
    information_controller.agent_name.text = "Agent Name: #{listing.ListAgentFirstName} #{listing.ListAgentLastName}"
    
    information_controller.listing_id.sizeToFit
    information_controller.public_remarks.sizeToFit
    information_controller.agent_name.sizeToFit
    block.call nil
  end
end
