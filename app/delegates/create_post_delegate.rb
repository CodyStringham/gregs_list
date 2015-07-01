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

      alert_post_created
      @owner.navigationController.popViewControllerAnimated(true)
      @original_owner.reload_fresh_data

      return false
    end
    return true
  end

  def alert_post_created
    App.alert("Post Created!", {
      cancel_button_title: "Ok",
      message: "Now everyone can see what you're up to, buddy."
    })
  end


end
