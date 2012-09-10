class ListingsController < UITableViewController
  def viewDidLoad
    # TODO:
    # - get the listings from the actual model
    # - parse the response using BW::JSON.parse
    # - puts the :Results value in the json response (from /listings) into @listings
    #   - otherwise @listings = []

    response = BW::JSON.parse(SparkMock.get '/listings')
    @listings = []
    if response["D"]["Success"]
      response["D"]["Results"].each do |listing_data|
        listing = Listing.new listing_data["StandardFields"]
        @listings << listing
      end
    end

    navigationItem.title = 'Listings'
  end

  def shouldAutorotateToInterfaceOrientation(*)
    true
  end

  # TODO: search docs for this
  #def numberOfSectionsInTableView tableView
    #1
  #end

  def tableView tableView, numberOfRowsInSection:section
    @listings.length
  end

  def tableView(tableView, cellForRowAtIndexPath:path)
    cid = "cell"
    # UITableViewCellStyleSubtitle - add addtl detailTextLabel property :)
    cell = tableView.dequeueReusableCellWithIdentifier(cid) || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleSubtitle, reuseIdentifier:cid)

    # Listing Title Description
    cell.textLabel.text = @listings[path.row].PublicRemarks
    cell.textLabel.font = UIFont.fontWithName "Arial", size: 12

    # List Agent Name
    listing = @listings[path.row]
    cell.detailTextLabel.text = "by #{listing.ListAgentFirstName} #{listing.ListAgentLastName}"
    cell.detailTextLabel.font = UIFont.fontWithName "Arial", size: 10
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell
  end

  # when an item/row is selected
  def tableView tableView, didSelectRowAtIndexPath:path
    # TODO: update fields in the information/right pane
    listing = @listings[path.row]
    ListingInformationController.update_info listing do |s|
      tableView.deselectRowAtIndexPath path, animated: true
    end
  end

  # TODO: custom change in height
  # def tableView(tableView, heightForRowAtIndexPath: path)
  #   path.row * 20
  # end
end
