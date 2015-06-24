class DestinyController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Destiny"

    selected = UIImage.imageNamed("destiny-on.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    unselected = UIImage.imageNamed("destiny.png").imageWithRenderingMode(UIImageRenderingModeAlwaysOriginal)
    self.tabBarItem.setFinishedSelectedImage(selected, withFinishedUnselectedImage: unselected)

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

  def preferredStatusBarStyle
    UIStatusBarStyleLightContent
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'main')
  end

end
