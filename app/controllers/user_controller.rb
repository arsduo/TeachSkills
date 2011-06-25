class UserController < ApplicationController

  skip_before_filter :check_facebook_cookies, :only => :signup  
  before_filter :authenticate_user!, :except => :signup
  before_filter :ensure_unauthenticated!, :only => :signup
  
  def profile
    @user = User.find(params[:id])
  end
  
  def signup
    # create a new user 
    if @fb_info
      # create a new user via Facebook
      user = User.create(
        :facebook_id => @fb_info["uid"]
      )
      
      sign_in(user)
      redirect_to :action => :welcome
    end
  end
  
  def welcome
  end

  private
  
  def ensure_unauthenticated!
    redirect_to root_path if current_user
  end
end
