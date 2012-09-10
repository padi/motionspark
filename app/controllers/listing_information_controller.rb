class ListingInformationController < UIViewController
  stylesheet :listing_info

  layout :root do
    @listing_id = subview UILabel, :listing_id
    @public_remarks = subview UILabel, :public_remarks
    @agent_name = subview UILabel, :agent_name
  end

  def shouldAutorotateToInterfaceOrientation(orientation)
    autorotateToOrientation(orientation)
  end

  def self.update_info(listing, &block)
    # TODO:
    # - get first the appropriate listing based on id
    # - update the view with the information given in by the found listing

    information_controller = UIApplication.sharedApplication.delegate.ivget('@listing_information_controller')

    information_controller.ivget('@listing_id').text = "Listing ID: #{listing.ListingId}"
    information_controller.ivget('@listing_id').sizeToFit
    information_controller.ivget('@public_remarks').text = "Public Remarks: #{listing.PublicRemarks}"
    information_controller.ivget('@public_remarks').sizeToFit
    information_controller.ivget('@agent_name').text = "Agent Name: #{listing.ListAgentFirstName} #{listing.ListAgentLastName}"
    information_controller.ivget('@agent_name').sizeToFit
    block.call nil
  end
end
