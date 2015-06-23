class BloodborneController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Bloodborne"
    self.tabBarItem.setFinishedSelectedImage(UIImage.imageNamed("bloodborne.png"), withFinishedUnselectedImage:UIImage.imageNamed("bloodborne.png"))
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = "Bloodborne"

    # To set a control, this isn't cached
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/bloodborne"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'main')
  end

end
