class PostShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    @notifier = Motion::Blitz
    self
  end

  def loadView
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    view.delegate = self
  end

  def viewDidLoad
    super
    self.title = "Post"
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/#{@title}").request_and_load # cache and headers
  end

  def webViewDidStartLoad(webview)
    @notifier.show('')
    UIApplication.sharedApplication.networkActivityIndicatorVisible = true
  end

  def webViewDidFinishLoad(webview)
    @notifier.dismiss
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false
  end

end
