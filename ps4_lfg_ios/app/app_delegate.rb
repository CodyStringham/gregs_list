class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = tab_bar_controller
    @window.makeKeyAndVisible

    # Sets colors for the icons
    # UITabBarItem.appearance.setTitleTextAttributes({
    #   NSForegroundColorAttributeName => UIColor.orangeColor
    # }, forState: UIControlStateNormal)

    # UITabBarItem.appearance.setTitleTextAttributes({
    #   NSForegroundColorAttributeName => UIColor.greenColor
    # }, forState: UIControlStateSelected)


    true
  end

  private

  def tab_bar_controller

    # wtf - does this do?
    Dispatch.once do
      @tab_bar_controller = UITabBarController.new
      @tab_bar_controller.setViewControllers([
        MyViewController.create("One", image: "one", tag: 0),
        MyViewController.create("Two", image: "two", tag: 1),
        # MyViewController.create(UITabBarSystemItemFavorites, image: nil, tag: 2),
        MyViewController.create("Favorites", image: "favorite", tag: 1),
        MyViewController.create("Three", image: "three", tag: 3),
        MyViewController.create("Four", image: "four", tag: 4)
      ], animated: false)
      @tab_bar_controller.selectedIndex = 2

      # Sets colors for the nav bar
      # @tab_bar_controller.tabBar.tap do |tab_bar|
      #   tab_bar.barTintColor = UIColor.purpleColor
      #   tab_bar.tintColor = UIColor.orangeColor
      #   tab_bar.selectedImageTintColor = UIColor.greenColor
      # end
    end

    # Must return the object
    @tab_bar_controller
  end
end
