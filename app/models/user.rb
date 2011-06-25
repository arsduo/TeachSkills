class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

   field :name
   field :facebook_id, :type => BigDecimal
   
   mount_uploader :image, ImageUploader
   
   validates_presence_of :name
   validates_uniqueness_of :name, :email, :case_sensitive => false
   attr_accessible :name, :email, :password, :password_confirmation, :remember_me

   # associations
   has_and_belongs_to_many :classrooms

end
