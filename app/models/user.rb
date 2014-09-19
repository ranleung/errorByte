class User < ActiveRecord::Base
	has_secure_password
	
	has_many :completes
	has_many :codes, :through => :completes
end
