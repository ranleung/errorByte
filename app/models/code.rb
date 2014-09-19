class Code < ActiveRecord::Base
	has_many :completes
	has_many :users, :through => :completes
end
