class AppDelegate

  def application(application, didFinishLaunchingWithOptions:launchOptions)
    window.makeKeyAndVisible
    true
  end

  def window
    @window ||= begin
      w = UIWindow.alloc.initWithFrame UIScreen.mainScreen.bounds
      w.rootViewController = split_view_controller
      w
    end
  end

  def split_view_controller
    @split_view_controller ||= begin
      s = UISplitViewController.alloc.init
      s.viewControllers = [left_pane_controller, right_pane_controller]
      s.delegate = self
      s
    end
  end

  def left_pane_controller
    @left_pane_controller ||= begin
      @listings_controller = ListingsController.new
      @left_pane_controller = UINavigationController.alloc.initWithRootViewController @listings_controller
      @left_pane_controller
    end
  end

  def right_pane_controller
    @right_pane_controller ||= begin
       @blue_controller = BlueController.new
       @right_pane_controller = UINavigationController.alloc.initWithRootViewController @blue_controller
       @right_pane_controller
     end
  end

  def splitViewController(sc, shouldHideController:c, inOrientation:o)
    NSLog "splitViewController: #{c}, #{o}"
    false
  end

end
