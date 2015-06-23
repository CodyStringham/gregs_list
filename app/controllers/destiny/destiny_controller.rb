class DestinyController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Destiny"
    self.tabBarItem.setFinishedSelectedImage(UIImage.imageNamed("destiny.png"), withFinishedUnselectedImage:UIImage.imageNamed("destiny.png"))
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = "Destiny"
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/destiny").request_and_load # cache and headers
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'main')
  end

end
