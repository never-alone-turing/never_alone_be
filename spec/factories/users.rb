FactoryBot.define do
  factory :user do
    username { Faker::Name.name }
    email { Faker::Internet.unique.email }
    phone { Faker::PhoneNumber.cell_phone }
    avatar { Faker::Avatar.image }
  end
end
