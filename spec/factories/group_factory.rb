require 'faker'

FactoryBot.define do
  factory :group do
    sequence(:name) { |n| Faker::Movies::HarryPotter.house }
    sequence(:description) { |n| Faker::Hipster.sentences }
  end
end
