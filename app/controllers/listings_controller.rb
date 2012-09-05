class ListingsController < UITableViewController
  def viewDidLoad
    @listings = ['Condominium in Makati', 'Serendra', 'One McKinley Place']
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
    cell = tableView.dequeueReusableCellWithIdentifier("cell") || UITableViewCell.alloc.initWithStyle(UITableViewCellStyleDefault, reuseIdentifier:"cell")
    cell.textLabel.text = @listings[path.row]
    cell
  end

  # when an item/row is selected
  def tableView tableView, didSelectRowAtIndexPath:path
    p "Selected: #{@listings[path.row]}"
  end
end
