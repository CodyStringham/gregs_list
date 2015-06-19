class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_controller
    @window.makeKeyAndVisible
    true
  end

  private

  def tab_controller
    @tab_bar_controller = UITabBarController.alloc.init
    @tab_bar_controller.viewControllers = tab_view_controllers
    @tab_bar_controller
  end

  def tab_view_controllers
    destiny_controller = DestinyController.alloc.init
    destiny_navigation_controller = UINavigationController.alloc.initWithRootViewController(destiny_controller)

    bloodborne_controller = BloodborneController.alloc.init
    bloodborne_navigation_controller = UINavigationController.alloc.initWithRootViewController(bloodborne_controller)

    destiny_json_controller = DestinyJsonController.alloc.init
    destiny_json_navigation_controller = UINavigationController.alloc.initWithRootViewController(destiny_json_controller)

    [destiny_navigation_controller, bloodborne_navigation_controller, destiny_json_navigation_controller]
  end

end
