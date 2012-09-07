class ListingInformationController < UIViewController
  def viewDidLoad
    @listing_id_label = UILabel.new
    @listing_id_label.frame = [[10, 10], [200, 50]]
    @listing_id_label.text = 'listing id: '
    @listing_id_label.backgroundColor = UIColor.blackColor
    @listing_id_label.textColor = UIColor.whiteColor
    view.addSubview(@listing_id_label)

    # @search = UITextField.new
    # @search.frame = [[10, 70], [200, 50]]
    # @search.placeholder = 'name'
    # @search.textColor = UIColor.redColor
    # view.addSubview(@search)

    view.backgroundColor = UIColor.blackColor
    navigationItem.title = 'Information'
  end

  def shouldAutorotateToInterfaceOrientation(o)
    true
  end

  def self.update_info(listing_id, &block)
    # TODO:
    # - get first the appropriate listing based on id
    # - update the view with the information given in by the found listing

    puts "Listing.update_info with #{listing_id} parameter (displays path.row for now)"

    app_delegate = UIApplication.sharedApplication.delegate
    information_controller = app_delegate.ivget('@listing_information_controller')
    information_controller.ivget('@listing_id_label').text = "listing id: #{listing_id}"
    block.call nil
  end
end
