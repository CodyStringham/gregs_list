class WebResponseDelegate
  attr_accessor :controller_delegate

  def webView(web_view, shouldStartLoadWithRequest: request, navigationType: nav_type)
    url = request.URL.absoluteString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    if url.include? 'link://hybrid/'

      if new_path = url.gsub('link://hybrid/', '')
        self.controller_delegate.public_send(:init_new_push_controller, new_path)
      end

      return false
    end
    return true
  end

end
