class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :parse_facebook_cookies
  
  private
  
  def parse_facebook_cookies
    oauth = Koala::Facebook::OAuth.new
    Rails.logger.debug("We have an OAuth object for #{oauth.app_id}")
    if fb_info = oauth.get_user_info_from_cookie(cookies)
      Rails.logger.debug("Facebook user: #{fb_info.inspect}")
    end
  end
end
