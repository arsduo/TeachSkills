class Classroom
  include Mongoid::Document
  include Mongoid::Timestamps

  # FIELDS
  field :name
  field :category_id
  field :summary
  field :description
  field :teacher_skills
  field :image_url
  field :start_time, :type => DateTime
  field :end_time, :type => DateTime
  
  # location fields
  field :location_name
  field :address
  field :address2
  field :geo, :type => Array

  # participation
  field :cost, :type => Integer
  field :class_size, :type => Integer
  
  # indices
  index [[ :geo, Mongo::GEO2D ]], min: 200, max: 200
  

  def individual_class?
    class_size == 1
  end
end


