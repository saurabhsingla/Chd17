class User < ActiveRecord::Base
  
	#before_filter :authenticate_user!

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username,
   :profile_pic
  # attr_accessible :title, :body

  validates :username, :presence => true, :uniqueness => true

  has_attached_file :profile_pic, :styles => {:small=> "100X100>", 
    :thumb => "40X40>"}, :default_url => 'assets/default_profilepic_#{size}.png'

  	# Virtual attribute for authenticating by either username or email
	# This is in addition to a real persisted field like 'username'
	attr_accessor :login

	attr_accessible :login

	def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", 
          { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end

end
