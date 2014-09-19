require 'rails_helper'

RSpec.describe User, :type => :model do

	subject {FactoryGirl.create(:user)}

	it "should create a new user" do
		expect(subject).to be_valid
	end

end
