
FactoryGirl.define do
  factory :code do
    level Faker::Lorem.words(1).join("")
    question Faker::Lorem.paragraph
    correctCode Faker::Lorem.paragraph
    wrongCode Faker::Lorem.paragraph
    hint Faker::Lorem.paragraph
  end
end