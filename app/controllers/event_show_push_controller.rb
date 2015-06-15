class EventShowPushController < UIViewController

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
    self.title = @title.gsub("destiny/", "").gsub("bloodborne/", "").gsub("-", " ").capitalize
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("http://ps4-lfg-rails.dev/#{@title}"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end
