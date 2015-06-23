class EventShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = @title.gsub("destiny/", "").gsub("bloodborne/", "").gsub("-", " ").capitalize

    view_url = NSURL.URLWithString("https://ps4-lfg.herokuapp.com/#{@title}")
    cache = NSURLCache.sharedURLCache
    cache.setMemoryCapacity(4 * 1024 * 1024)
    cache.setDiskCapacity(512*1024)
    request = NSURLRequest.requestWithURL(view_url, cachePolicy:NSURLRequestReturnCacheDataElseLoad, timeoutInterval:10.0)

    # request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/#{@title}"))
    # request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

  def init_new_push_controller(path)
    controller = PostShowPushController.alloc.initWithTitle(path)
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

