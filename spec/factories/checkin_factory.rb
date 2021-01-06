require 'faker'

FactoryBot.define do
  factory :checkin do
    category {rand(0..2)}
    response {rand(0..2)}
    time { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    window { Faker::Time.between(from: DateTime.now - 1, to: DateTime.now) }
    user_id {rand(1..20)}
    group_id {rand(1..20)}
  end
end
