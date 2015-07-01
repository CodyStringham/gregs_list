class EventShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = @title.gsub("destiny/", "").gsub("bloodborne/", "").gsub("-", " ").capitalize
    right_button = UIBarButtonItem.alloc.initWithTitle("New Post",
      style: UIBarButtonItemStyleBordered,
      target:self,
      action:'create_post'
    )
    self.navigationItem.rightBarButtonItem = right_button
    LoadWebView.new(self, request_url).request_and_load # cache and headers
  end

  def request_url
    "#{AppDelegate::WEB_APPLICATION_URL}/#{@title}"
  end

  # Reload reqquest ignoring cached data
  def reload_fresh_data
    view_url = NSURL.URLWithString(request_url)
    request = NSMutableURLRequest.alloc.initWithURL(view_url, cachePolicy:NSURLRequestReloadIgnoringCacheData)
    request.setValue("false", forHTTPHeaderField:"navigation")
    request.setValue(App::Persistence['authToken'], forHTTPHeaderField:"User-Token")
    request.setValue(App::Persistence['userEmail'], forHTTPHeaderField:"User-Email")
    self.view.loadRequest(request)
    self.view.reload
  end

  private

  def create_post
    controller = CreatePostPushController.alloc.initWithTitle(@title)
    controller.original_owner = self
    self.navigationController.pushViewController(controller, animated: true)
  end

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'event')
  end

end

