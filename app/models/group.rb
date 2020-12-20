class Group < ApplicationRecord
  validates :name, :description, presence: true

  has_many :group_users
  has_many :users, through: :group_users
end