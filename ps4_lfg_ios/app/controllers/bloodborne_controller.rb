class BloodborneController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Bloodborne"
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidLoad
    super
    self.title = "Bloodborne"
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("http://ps4-lfg-rails.dev/bloodborne"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end
