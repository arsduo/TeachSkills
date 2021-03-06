class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable

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
  
  def formatted_name
    fb? ? "<fb:name uid=\"#{facebook_id}\"></fb:name>".html_safe : name
  end
  
  # work around devise weirdness with passwords
  # remove when we implement passwords
  alias_method :update_with_password, :update_attributes  
  def valid_password?
    fb? ? true : super
  end
end
