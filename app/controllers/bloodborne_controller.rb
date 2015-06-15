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

  def viewDidAppear(anitmated)
    super
    self.title = "Bloodborne"
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/bloodborne"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

  def init_new_push_controller(path)
    controller = EventShowPushController.alloc.initWithTitle(path)
    self.navigationController.pushViewController(controller, animated: true)
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.init

    # letting us link the two
    @web_view_delegate.controller_delegate = self
    @web_view_delegate
  end

end
