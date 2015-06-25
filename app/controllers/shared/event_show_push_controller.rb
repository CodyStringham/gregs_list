class EventShowPushController < UIViewController

  def initWithTitle(title)
    self.init
    @title = title
    self
  end

  def loadView
    self.view = UIWebView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    add_load_label
    view.delegate = web_view_delegate
  end

  def viewDidLoad
    super
    self.title = @title.gsub("destiny/", "").gsub("bloodborne/", "").gsub("-", " ").capitalize
    LoadWebView.new(self, "https://ps4-lfg.herokuapp.com/#{@title}").request_and_load # cache and headers
  end

  def add_load_label
    @load_label = AddLoadLabel.alloc.initWithOwner(self).generate_label
    self.view.addSubview(@load_label)
  end

  private

  def web_view_delegate
    @web_view_delegate = WebResponseDelegate.alloc.initWithOwner(self, 'event')
  end

end

