class User < ActiveRecord::Base
  rolify
  after_create :assingn_default_role
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
 def assingn_default_role
   self.add_role(:newuser) if self.roles.blank?
 end

has_many :posts
end
