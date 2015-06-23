class PostShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.init
  end

  def viewDidLoad
    super
    self.title = "Post"
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/#{@title}").request_and_load # cache and headers
  end

end
