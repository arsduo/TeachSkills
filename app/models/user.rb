class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :registerable, :recoverable, :rememberable, :trackable

  field :name
  field :facebook_id # no type, since we mostly use this as string
  field :email

  mount_uploader :image, ImageUploader

  validates :name, :presence => true, :unless => :fb?
  validates :facebook_id, :uniqueness => {:case_sensitive => false}, :allow_nil => true
  validates :email, :uniqueness => {:case_sensitive => false}, :presence => true, :unless => :fb?
  
  # associations
  has_and_belongs_to_many :classrooms

  def fb?
    !facebook_id.blank?
  end
  
  def update_with_password(*args)
    update_attributes(*args)
  end
end
