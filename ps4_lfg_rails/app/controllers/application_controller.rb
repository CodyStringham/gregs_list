class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :set_browser_type
  # before_action :look_at_headers

  private

  def set_browser_type
    request.variant = :phone if browser.mobile?
    request.variant = :tablet if browser.tablet?
  end

  # def look_at_headers
  #   @hide_navigation = if request.headers['Navigation'] == 'false'
  # end
end
