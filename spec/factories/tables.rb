require 'faker'
FactoryGirl.define do
  factory :table do
    sequence :number
    notes Faker::Lorem.sentence
  end
end
