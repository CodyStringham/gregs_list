class LoadWebView

  def initialize(owner, path)
    @owner = owner
    @path = path
  end

  def request_and_load

    if App::Persistence['authToken'].nil? || App::Persistence['userEmail'].nil?
      # Fixes: Unbalanced calls to begin/end appearance transitions
      self.performSelector('present_welcome_controller', withObject:nil, afterDelay:0.1)

      # Prevents web view from loading on login
      return false
    end

    view_url = NSURL.URLWithString(@path)

    # Request with cache and headers
    # Define cach settings
    cache = NSURLCache.sharedURLCache
    cache.setMemoryCapacity(4 * 1024 * 1024)
    cache.setDiskCapacity(512*1024)

    request = NSMutableURLRequest.alloc.initWithURL(
      view_url,
      cachePolicy:NSURLRequestUseProtocolCachePolicy,
      timeoutInterval: 60.0
    )
    request.setValue(
      "false",
      forHTTPHeaderField:"navigation"
    )
    request.setValue(
      App::Persistence['authToken'],
      forHTTPHeaderField:"User-Token"
    )
    request.setValue(
      App::Persistence['userEmail'],
      forHTTPHeaderField:"User-Email"
    )

    @owner.view.loadRequest(request)
  end

  private

  def present_welcome_controller
    controller = WelcomeController.alloc.initWithNibName(nil, bundle:nil)
    controller.original_owner = @owner

    root_view_controller = App.delegate.instance_variable_get('@window').rootViewController
    root_view_controller.presentViewController(
      UINavigationController.alloc.initWithRootViewController(controller),
      animated: true,
      completion: lambda {}
    )
  end

end
