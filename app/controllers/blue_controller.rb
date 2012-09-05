class BlueController < UIViewController
  def viewDidLoad
    view.backgroundColor = UIColor.blueColor
    navigationItem.title = 'Information'
  end

  def shouldAutorotateToInterfaceOrientation(o)
    true
  end
end
