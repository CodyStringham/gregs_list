class CreatePostDelegate

  def initWithOwner(owner, original_owner)
    self.init
    @owner = owner
    @original_owner = original_owner
    @notifier = Motion::Blitz
    self
  end

  def webView(web_view, shouldStartLoadWithRequest: request, navigationType: nav_type)
    url = request.URL.absoluteString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    if url.include? 'link://hybrid/'
      @owner.navigationController.popViewControllerAnimated(true)
      path = @original_owner.public_send(:request_url)
      view_url = NSURL.URLWithString(path)
      request = NSMutableURLRequest.alloc.initWithURL(view_url, cachePolicy:NSURLRequestUseProtocolCachePolicy, timeoutInterval: 60.0)
      NSURLCache.sharedURLCache.removeCachedResponseForRequest(request)
      @original_owner.performSelector('send_request_and_load', withObject:nil, afterDelay:2.0)
      return false
    end
    return true
  end


end
