class WebResponseDelegate

  def initWithOwner(owner, owner_type)
    self.init
    @owner = owner
    @owner_type = owner_type
    self
  end

  def webView(web_view, shouldStartLoadWithRequest: request, navigationType: nav_type)
    url = request.URL.absoluteString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    if url.include? 'link://hybrid/'

      if new_path = url.gsub('link://hybrid/', '')
        new_controller = InitPushController.new(@owner,new_path)
        @owner_type == "main" ? new_controller.event_push : new_controller.post_push
      end

      return false
    end
    return true
  end

end
