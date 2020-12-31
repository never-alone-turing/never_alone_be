class User < ApplicationRecord
  validates :username, :email, :phone, uniqueness: true, presence: true
  validates :avatar, presence: true
  has_many :group_users
  has_many :groups, through: :group_users
  has_many :checkins

  enum role: ['caretaker', 'lone_ranger']
end
