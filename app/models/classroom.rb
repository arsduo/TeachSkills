class Classroom
  include Mongoid::Document
  include Mongoid::Timestamps

  # FIELDS
  field :name
  field :category_id
  field :summary
  field :description
  field :teacher_skills
  mount_uploader :image, ImageUploader
  field :start_time, :type => DateTime
  field :end_time, :type => DateTime
  field :owner_id
  
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
  
  # relationships
  has_and_belongs_to_many :users

  # validation
  validate do
    errors.add(:owner, "Must be owned by a valid active user!") unless self.owner
  end

  # alias to students for clarity
  def students
    users
  end

  def individual_class?
    class_size == 1
  end
  
  def owner
    User.where(:_id => owner_id).first
  end
end


