class DestinyController < UIViewController

  def init
    super
    self.tabBarItem = UITabBarItem.alloc.init
    self.tabBarItem.title = "Destiny"
    self
  end

  def loadView
    @destiny_controller = self
    self.view = UIWebView.alloc.init
    view.delegate = web_view_delegate
  end

  def viewDidAppear(anitmated)
    super
    self.title = "Destiny"
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("http://ps4-lfg-rails.dev/destiny"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

  def init_new_controller(path)
    controller = DestinyShowEventController.alloc.initWithTitle(path)
    self.navigationController.pushViewController(controller, animated: true)
  end

  private

  def web_view_delegate
    @web_view_delegate ||= DestinyWebViewDelegate.new(self)
  end

end

class DestinyShowEventController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidAppear(anitmated)
    super
    self.title = @title.gsub("destiny/", "").gsub("-", " ").capitalize
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("http://ps4-lfg-rails.dev/#{@title}"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end
