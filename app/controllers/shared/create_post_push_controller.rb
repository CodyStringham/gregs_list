class CreatePostPushController < UIViewController
  attr_accessor :original_owner

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
    self.title = "New Post"
    LoadWebView.new(self, "#{AppDelegate::WEB_APPLICATION_URL}/#{@title}/posts/new").request_and_load # cache and headers
  end

  private

  def web_view_delegate
    @web_view_delegate = CreatePostDelegate.alloc.initWithOwner(self, self.original_owner)
  end

end
