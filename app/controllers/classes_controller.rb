class ClassesController < ApplicationController

  def offer
    @classes = Classroom.create
  end

  def browse
  end

  def search
  end

  def take
  end
  
  def show
    if @classroom = Classroom.where(:_id => params[:id]).first
      set_page_info_for_class(@classroom)
    end
  end
  
  def new
  end
  
  def edit
  end
  
  def delete
  end

  private
  
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
