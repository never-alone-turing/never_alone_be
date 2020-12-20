class Group < ApplicationRecord
  validates :name, :description, presence: true

  has_many :checkins
end
