class PostShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    add_load_label
    view.delegate = self
  end

  def viewDidLoad
    super
    self.title = "Post"
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/#{@title}").request_and_load # cache and headers
  end

  def add_load_label
    @load_label = AddLoadLabel.alloc.initWithOwner(self).generate_label
    self.view.addSubview(@load_label)
  end

  def webViewDidStartLoad(webview)
    @load_label.hidden = false
    UIApplication.sharedApplication.networkActivityIndicatorVisible = true
  end

  def webViewDidFinishLoad(webview)
    @load_label.hidden = true
    UIApplication.sharedApplication.networkActivityIndicatorVisible = false
  end

end
