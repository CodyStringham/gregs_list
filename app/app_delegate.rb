class AppDelegate < PM::Delegate

  # WEB_APPLICATION_URL = 'https://ps4-lfg.herokuapp.com'
  WEB_APPLICATION_URL = 'http://ps4-lfg-rails.dev'

  def application(application, didFinishLaunchingWithOptions:launchOptions)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = create_tab_controller
    @window.makeKeyAndVisible

    # Dimmed unselected tab bar text
    UITabBarItem.appearance.setTitleTextAttributes({
      NSForegroundColorAttributeName => "#84b6e1".to_color
    }, forState: UIControlStateNormal)

    # White selected tab bar text
    UITabBarItem.appearance.setTitleTextAttributes({
      NSForegroundColorAttributeName => "#fff".to_color
    }, forState: UIControlStateSelected)

    # Blue Background in tab bar
    UITabBar.appearance.setBarTintColor("#0d47a1".to_color)

    # Change navigation bar background color
    UINavigationBar.appearance.setBarTintColor("#0d47a1".to_color)

    # White navigation title text
    UINavigationBar.appearance.setTitleTextAttributes(
      NSForegroundColorAttributeName => "#fff".to_color
    )

    # White navigation button text
    UINavigationBar.appearance.setTintColor(UIColor.whiteColor)

    # if App::Persistence['authToken'].nil?
    #   @window.rootViewController.setSelectedIndex(3)
    #   show_welcome_controller
    # end

    true
  end

  private

  def create_tab_controller
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

    settings_controller = SettingsController.alloc.init
    settings_navigation_controller = UINavigationController.alloc.initWithRootViewController(settings_controller)

    [destiny_navigation_controller, bloodborne_navigation_controller, destiny_json_navigation_controller, settings_navigation_controller]
  end

end
