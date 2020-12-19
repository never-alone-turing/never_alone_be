class User < ApplicationRecord
  validates :username, uniqueness: true, presence: true
  validates :email, uniqueness: true, presence: true
  validates :avatar, presence: true
  validates :phone, uniqueness: true, presence: true

  enum role: ['caretaker', 'lone_ranger']
end
