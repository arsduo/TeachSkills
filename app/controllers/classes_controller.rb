class ClassesController < ApplicationController
  before_filter :authenticate_user!, :only => [:take, :offer, :edit, :delete]
  before_filter :set_classroom
  before_filter :require_classroom!, :only => [:show, :take, :update, :delete]

  # find
  def browse
    Rails.logger.debug(flash.inspect)
  end

  def search
  end
  
  # participate  
  def show
    @is_new = flash[:new_class]
  end

  def take
    if @classroom.owner_id == current_user._id
      flash[:warning] = "You can't sign up for your own class!"
    elsif @classroom.users.include?(current_user)
      flash[:warning] = "You're already signed up for this class!"
    end
    redirect_to :action => :browse and return if flash[:warning]
    
    @classroom.users << current_user
    @classroom.save

    flash[:success] = "You've been enrolled in this class!"
    redirect_to :action => :show, :id => @classroom._id
  end
  
  # create and manage
  def offer
    @classroom ||= Classroom.new
    Rails.logger.debug(@classroom.inspect)
  end

  def create
    @classroom = Classroom.new(params[:classroom].merge(:owner_id => current_user._id))
    if @classroom.save
      flash[:success] = "Your course has been created!"
      flash[:new_class] = true
      redirect_to :action => :show, :id => @classroom._id
    else
      render :template => "classes/offer"
    end
  end

  def update
    if !@classroom.owned_by?(current_user)
      flash[:warning] = "Diese Kurs gehoert dir nicht!"
      redirect_to :action => :show, :id => @classroom._id
    elsif @classroom.update_attributes(params[:classroom])
      redirect_to :action => :show, :id => @classroom._id
    else
      render :template => "classes/offer"
    end
  end
  
  def delete
  end

  private
  
  def set_classroom
    @classroom = Classroom.where(:_id => params[:id]).first
  end
  
  def require_classroom!
    if @classroom 
      set_page_info_for_class(@classroom)
    else
      flash[:warning] = "We couldn't find that class!"
      redirect_to :action => :browse and return
    end
  end
  
  def set_page_info_for_class(classroom)
    @page_title = "#{classroom.name} | Class | CloseGuru.com"
    @og_tags = {
      :title => classroom.name,
      :url => url_for_classroom(classroom),
      :site_name => "Closeguru",
      :description => classroom.description
    }.merge(@og_tags || {})
  end
  
end
