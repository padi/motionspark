class ListingsController < UIViewController
  def viewDidLoad
    navigationItem.title = 'Listings'

    # search container for a search bar and a search button
    @search_container = UISearchBar.alloc.initWithFrame [[0, 0], [320, 30]]
    @search_container.backgroundColor = UIColor.lightGrayColor
    @search_container.placeholder = 'Search...'
    view.addSubview @search_container

    table_frame = [[0, @search_container.frame.size.height],
                  [self.view.bounds.size.width, self.view.bounds.size.height - @search_container.frame.size.height - self.navigationController.navigationBar.frame.size.height]]
    @table_view = UITableView.alloc.initWithFrame(table_frame, style:UITableViewStylePlain)
    view.addSubview @table_view

    @listings = []
    @search_container.delegate = self
    @table_view.delegate = self
    @table_view.dataSource = self

    Listing.all do |listings|
      @listings = listings
      @table_view.reloadData
    end
  end

  def shouldAutorotateToInterfaceOrientation(*)
    true
  end

  # UITableView related methods

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
    listing = @listings[path.row]
    ListingInformationController.update_info listing do |s|
      tableView.deselectRowAtIndexPath path, animated: true
    end
  end

  def tableView(tableView, heightForRowAtIndexPath: path)
    60
  end

  # search related methods (UISearchBar and UISearchBarDelegate)

  def searchBar search_bar, textDidChange: text
    @listings = (text.length == 0) ? Listing.all : Listing.search(text)
    @table_view.reloadData
  end

  def searchBarSearchButtonClicked search_bar
    puts "searchBarSearchButtonClicked: #{search_bar.text}"
  end
end
