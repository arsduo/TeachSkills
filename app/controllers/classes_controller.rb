class ClassesController < ApplicationController
  before_filter :authenticate_user!, :only => [:take, :offer, :edit, :delete]
  before_filter :set_classroom, :only => [:show, :take, :edit, :delete]

  def offer
    @classes = Classroom.create
  end

  def browse
  end

  def search
  end
  
  def show
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
  
  def new
  end
  
  def edit
  end
  
  def delete
  end

  private
  
  def set_classroom
    if @classroom = Classroom.where(:_id => params[:id]).first
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
