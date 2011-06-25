class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  field :name
  field :facebook_id # no type, since we mostly use this as string
  field :email

  mount_uploader :image, ImageUploader

  validates_presence_of :name, :if => lambda { facebook_id.blank? }
  validates_uniqueness_of :facebook_id, :email, :case_sensitive => false

  # associations
  has_and_belongs_to_many :classrooms


  def fb?
    !facebook_id.blank?
  end
end
