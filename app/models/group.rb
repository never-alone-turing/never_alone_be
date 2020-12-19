class Group < ApplicationRecord
  validates :name, :description, presence: true
end