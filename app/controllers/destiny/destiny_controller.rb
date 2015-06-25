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
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    add_load_label
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = "Destiny"
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/destiny").request_and_load # cache and headers
  end

  def add_load_label
    @load_label = AddLoadLabel.alloc.initWithOwner(self).generate_label
    self.view.addSubview(@load_label)
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'main')
  end

end
