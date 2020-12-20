class User < ApplicationRecord
  validates :username, :email, :phone, uniqueness: true, presence: true
  validates :avatar, presence: true
  has_many :checkins

  enum role: ['caretaker', 'lone_ranger']
end
