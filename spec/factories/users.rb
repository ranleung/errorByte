# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
  	username Faker::Lorem.words(2).join("")
  	pswrd = Faker::Lorem.words(4).join("")
  	password pswrd
  end
end
