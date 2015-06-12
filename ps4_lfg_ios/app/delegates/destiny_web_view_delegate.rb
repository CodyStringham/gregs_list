class DestinyWebViewDelegate

  def initialize(controller)
    @controller = controller
  end

  def webView(web_view, shouldStartLoadWithRequest: request, navigationType: nav_type)
    url = request.URL.absoluteString.stringByReplacingPercentEscapesUsingEncoding(NSUTF8StringEncoding)
    puts url
    if url.include? 'link://hybrid/'
      new_path = url.gsub('link://hybrid/', '')
      if new_path
        puts "The value from the web view is: #{new_path}"
        @controller.init_new_controller(new_path)
      end
      return false
    end
    return true
  end


end
