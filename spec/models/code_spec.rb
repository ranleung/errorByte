require 'rails_helper'

RSpec.describe Code, :type => :model do

	subject { FactoryGirl.create(:code) }

	it "should create level, question, correctCode, wrongCode, and hint" do
		expect(subject).to be_valid
	end

end
