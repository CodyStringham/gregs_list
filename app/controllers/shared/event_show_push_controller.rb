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
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/#{@title}").request_and_load # cache and headers
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'event')
  end

end

