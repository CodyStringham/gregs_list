class LoadWebView

  def initialize(owner, path)
    @owner = owner
    @path = path
  end

  def request_and_load

    if App::Persistence['authToken'].nil? || App::Persistence['userEmail'].nil?
      show_welcome_controller
      return false
    end

    view_url = NSURL.URLWithString(@path)

    # Define cach settings
    cache = NSURLCache.sharedURLCache
    cache.setMemoryCapacity(4 * 1024 * 1024)
    cache.setDiskCapacity(512*1024)

    # Request with cache and headers
    request = NSMutableURLRequest.alloc.initWithURL(view_url, cachePolicy:NSURLRequestUseProtocolCachePolicy, timeoutInterval: 60.0)
    request.setValue("false", forHTTPHeaderField:"navigation")
    request.setValue(App::Persistence['authToken'], forHTTPHeaderField:"user_token")
    request.setValue(App::Persistence['userEmail'], forHTTPHeaderField:"user_email")

    @owner.view.loadRequest(request)
  end

  private

  def show_welcome_controller
    controller = WelcomeScreen.alloc.init
    controller.original_owner = @owner
    @owner.presentViewController(
      UINavigationController.alloc.initWithRootViewController(controller),
      animated:true,
      completion: lambda {}
    )
  end

end
