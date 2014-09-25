class User < ActiveRecord::Base
	# has_secure_password
	
	has_many :completes
	has_many :codes, :through => :completes


	def set_password_reset
		self.code = SecureRandom.urlsafe_base64
		self.expires_at = 4.hours.from_now
		self.save!
	end

	def self.authenticate username, password
		User.find_by_username(username).try(:authenticate,password)
	end

end
