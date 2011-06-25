class ApplicationController < ActionController::Base
  protect_from_forgery
  
  before_filter :check_facebook_cookies
  
  private
  
  def check_facebook_cookies
    oauth = Koala::Facebook::OAuth.new
    if fb_info = oauth.get_user_info_from_cookie(cookies)
      Rails.logger.debug("Got Facebook user: #{fb_info["uid"].inspect}")
      if user = User.where(:facebook_id => fb_info["uid"]).first
        sign_in(user)
      else
        redirect_to :controller => :users, :action => :signup
      end
    end
  end


end
