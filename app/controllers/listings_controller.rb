class ListingsController < UITableViewController
  def viewDidLoad
    # get the listings

    @listings = ['Condominium in Makati', 'Serendra', 'One McKinley Place']
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
    cell.textLabel.text = @listings[path.row]
    cell.detailTextLabel.text = "listing id: #{path.row}"
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator

    cell
  end

  # when an item/row is selected
  def tableView tableView, didSelectRowAtIndexPath:path

    # TODO: update fields in the information/right pane
    ListingInformationController.update_info path.row do |s|
      tableView.deselectRowAtIndexPath path, animated: true


      p 'someting'
    end
  end
end
