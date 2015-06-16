class PostShowPushController < UIViewController

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
    self.title = "Post"
    request = NSMutableURLRequest.alloc.initWithURL(NSURL.URLWithString("https://ps4-lfg.herokuapp.com/#{@title}"))
    request.setValue("false", forHTTPHeaderField:"navigation")
    self.view.loadRequest(request)
  end

end
