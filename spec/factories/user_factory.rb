require 'faker'

FactoryBot.define do
  factory :user do
    sequence(:username) { |n| Faker::Name.name + "#{n}" }
    sequence(:email) { |n| "user-#{n}@email.com" }
    sequence(:avatar) { Faker::Avatar.image }
    sequence(:phone) { Faker::PhoneNumber.phone_number }
  end
end