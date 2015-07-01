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
      # NSURLCache.sharedURLCache.removeAllCachedResponses
      # @original_owner.performSelector('reload_fresh_data', withObject:nil, afterDelay:0.5)
      @original_owner.reload_fresh_data
      @owner.navigationController.popViewControllerAnimated(true)

      App.alert("Post Created!", {
        cancel_button_title: "Ok",
        message: "Now everyone can see what you're up to, buddy."
      })

      return false
    end
    return true
  end


end
