class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_bar_controller
    @window.makeKeyAndVisible

    true
  end

  private

  def tab_bar_controller
    @tab_bar_controller = UITabBarController.alloc.init
    @tab_bar_controller.viewControllers = view_controllers
    @tab_bar_controller
  end

  def view_controllers
    destiny_controller = DestinyController.alloc.init
    destiny_navigation_controller = UINavigationController.alloc.initWithRootViewController(destiny_controller)

    bloodborne_controller = BloodborneController.alloc.init
    bloodborne_navigation_controller = UINavigationController.alloc.initWithRootViewController(bloodborne_controller)

    [destiny_navigation_controller, bloodborne_navigation_controller]
  end

end
