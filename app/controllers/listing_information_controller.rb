class ListingInformationController < UIViewController
  def viewDidLoad
    @listing_id = UILabel.new
    @listing_id.frame = [[10, 10], [200, 30]]
    @listing_id.text = 'Listing ID:'
    @listing_id.sizeToFit
    @listing_id.backgroundColor = UIColor.redColor
    @listing_id.textColor = UIColor.whiteColor
    view.addSubview(@listing_id)

    @public_remarks = UILabel.new
    @public_remarks.frame = [[10, 50], [200, 30]]
    @public_remarks.text = 'Remarks:'
    @public_remarks.sizeToFit
    @public_remarks.backgroundColor = UIColor.redColor
    @public_remarks.textColor = UIColor.whiteColor
    view.addSubview(@public_remarks)

    @agent_name = UILabel.new
    @agent_name.frame = [[10, 90], [200, 30]]
    @agent_name.text = 'Agent Name:'
    @agent_name.sizeToFit
    @agent_name.backgroundColor = UIColor.redColor
    @agent_name.textColor = UIColor.whiteColor
    view.addSubview(@agent_name)

    # @search = UITextField.new
    # @search.frame = [[10, 70], [200, 30]]
    # @search.placeholder = 'name'
    # @search.textColor = UIColor.redColor
    # view.addSubview(@search)

    view.backgroundColor = UIColor.blackColor
    navigationItem.title = 'Information'
  end

  def shouldAutorotateToInterfaceOrientation(o)
    true
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
