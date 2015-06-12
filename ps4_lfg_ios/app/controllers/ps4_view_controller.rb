class PS4ViewController < UIViewController
  def self.create(title_or_system_item, image: image, tag: tag)
    item = if title_or_system_item.is_a?(String)
      create_item(title_or_system_item, image, tag)
    else
      create_system_item(title_or_system_item, tag)
    end

    controller = PS4ViewController.new
    controller.tabBarItem = item

    controller
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidLoad
    super
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("http://ps4-lfg-rails.dev/destiny"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

  private

  def self.create_item(title, image, tag)
    off_image = UIImage.imageNamed("#{image}-on").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    # off_image = UIImage.imageNamed("#{image}-on")
    tab_bar_item = UITabBarItem.alloc.initWithTitle(title, image: off_image, tag: tag)
    tab_bar_item.selectedImage = UIImage.imageNamed("#{image}-on")
    tab_bar_item
  end

  def self.create_system_item(system_item, tag)
    UITabBarItem.alloc.initWithTabBarSystemItem(system_item, tag: tag)
  end
end
