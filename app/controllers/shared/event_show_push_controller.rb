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
    send_request_and_load
  end

  def request_url
    "#{AppDelegate::WEB_APPLICATION_URL}/#{@title}"
  end

  def send_request_and_load
    LoadWebView.new(self, request_url).request_and_load # cache and headers
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

