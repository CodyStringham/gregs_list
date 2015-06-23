class LoadWebView

  def initialize(owner, path)
    @owner = owner
    @path = path
  end

  def request_and_load
    view_url = NSURL.URLWithString(@path)

    # Define cach settings
    cache = NSURLCache.sharedURLCache
    cache.setMemoryCapacity(4 * 1024 * 1024)
    cache.setDiskCapacity(512*1024)

    # Request with cache and headers
    request = NSMutableURLRequest.alloc.initWithURL(view_url, cachePolicy:NSURLRequestReturnCacheDataElseLoad, timeoutInterval:10.0)
    request.setValue("false", forHTTPHeaderField:"navigation")

    @owner.view.loadRequest(request)
  end

end
