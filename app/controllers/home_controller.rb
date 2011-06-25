class HomeController < ApplicationController
  def index
    @classrooms = Classroom.all
  end

end
