class User < ActiveRecord::Base
	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create
	validates_presence_of :email, on: :create
	validates :email, uniqueness: { case_sensitive: false }
	
	has_many :favorites
	has_many :hacks

	# checks if a user is an admin
  def admin?
		self.admin
	end
end
