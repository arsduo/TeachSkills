class ApplicationController < ActionController::Base
  protect_from_forgery

  # two before_filters since we may skip the latter (the redirect) sometimes
  before_filter :set_facebook_cookies
  before_filter :check_facebook_cookies
  
  before_filter :set_default_page_info
  
  private
  
  def set_facebook_cookies
    oauth = Koala::Facebook::OAuth.new
    @fb_info = oauth.get_user_info_from_cookie(cookies)
  end
  
  def check_facebook_cookies
    if @fb_info && !flash[:logout]
      Rails.logger.debug("Got Facebook user: #{@fb_info["uid"].inspect}")
      if user = User.where(:facebook_id => @fb_info["uid"]).first
        puts "Got user: #{user.inspect}"
        sign_in(user)
      else
        redirect_to :controller => :user, :action => :signup
      end
    end
  end
  
  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    flash[:logout] = true
    root_path
  end

  def set_default_page_info
    @page_title ||= "CloseGuru.com"
    @og_tags = {
      :title => @page_title,
      :url => "http://www.closeguru.com",
      :site_name => "Closeguru",
      :description => "Because it's fun!"
    }.merge(@og_tags || {})
  end

  helper_method :url_for_classroom
  def url_for_classroom(classroom)
    url_for(:controller => :classes, :action => :show, :id => classroom._id)
  end

end
