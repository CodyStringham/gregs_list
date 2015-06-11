class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_bar_controller
    @window.makeKeyAndVisible

    # Sets colors for the icons
    UITabBarItem.appearance.setTitleTextAttributes({
      NSForegroundColorAttributeName => "fff".to_color
    }, forState: UIControlStateNormal)

    UITabBarItem.appearance.setTitleTextAttributes({
      NSForegroundColorAttributeName => "ffa000".to_color
    }, forState: UIControlStateSelected)

    true
  end

  private

  def tab_bar_controller

    # wtf - does this do?
    Dispatch.once do
      @tab_bar_controller = UITabBarController.new
      @tab_bar_controller.setViewControllers([
        PS4ViewController.create("One", image: "one", tag: 0),
        PS4ViewController.create("Two", image: "two", tag: 1),
        # PS4ViewController.create(UITabBarSystemItemFavorites, image: nil, tag: 2),
        PS4ViewController.create("Favorites", image: "favorite", tag: 1),
        PS4ViewController.create("Three", image: "three", tag: 3),
        PS4ViewController.create("Four", image: "four", tag: 4)
      ], animated: false)
      @tab_bar_controller.selectedIndex = 2

      # Sets colors for the nav bar
      @tab_bar_controller.tabBar.tap do |tab_bar|
        tab_bar.barTintColor = "#0d47a1".to_color
        tab_bar.tintColor = "000".to_color
        tab_bar.selectedImageTintColor = "ffa000".to_color

      end
    end

    # Must return the object
    @tab_bar_controller
  end
end
