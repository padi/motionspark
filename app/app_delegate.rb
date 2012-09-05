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
      white_controller = WhiteController.new
      blue_controller = BlueController.new
      s.viewControllers = [UINavigationController.alloc.initWithRootViewController(white_controller), UINavigationController.alloc.initWithRootViewController(blue_controller)]
      s.delegate = self
      s
    end
  end

  def left_pane_controller
    left_pane_controller = WhiteController.new
    new_controller = UINavigationController.alloc.initWithRootViewController left_pane_controller
    new_controller
  end

  def right_pane_controller
    right_pane_controller = BlueController.new
    new_controller = UINavigationController.alloc.initWithRootViewController right_pane_controller
    new_controller
  end

  def splitViewController(sc, shouldHideController:c, inOrientation:o)
    NSLog "splitViewController: #{c}, #{o}"
    false
  end

end
