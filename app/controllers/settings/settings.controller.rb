class SettingsController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Settings"

    selected = UIImage.imageNamed("settings-on.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    unselected = UIImage.imageNamed("settings.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    self.tabBarItem.setFinishedSelectedImage(selected, withFinishedUnselectedImage: unselected)

    self
  end

  def viewDidLoad
    super
    self.title = "Settings"
    self.view.backgroundColor = "#e1e1e1".to_color
    add_clear_cache_button
  end

  def add_clear_cache_button
    @theButton = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @theButton.setTitle('Clear Cache', forState:UIControlStateNormal)
    # @theButton.setTitleColor(BW.rgb_color(255, 255, 255), forState:UIControlStateNormal)
    @theButton.backgroundColor = BW.rgb_color(255, 255, 255)
    # @theButton.layer.borderColor = BW.rgb_color(255, 255, 255)
    # @theButton.layer.borderWidth = 0.5
    @theButton.layer.cornerRadius = 10
    @theButton.frame = [[((self.view.frame.size.width  / 2 ) - 100), (self.view.frame.size.height - 200)], [200,50]] #[[x-axis, y-axis], [width, height]]
    # @theButton.setTitle('Stop', forState:UIControlStateSelected)

    # Add an event for the button when touched
    # 'self' refers to the handler class for the action in which the callback is defined
    # buttonClicked is the method that will be called when the event happens
    # forControlEvents will take the event name
    @theButton.addTarget(self, action:'clear_all_web_view_cache', forControlEvents:UIControlEventTouchUpInside)

    self.view.addSubview(@theButton)
  end

  def clear_all_web_view_cache
    NSURLCache.sharedURLCache.removeAllCachedResponses
  end

end
