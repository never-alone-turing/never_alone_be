class User < ApplicationRecord
  validates :username, :email, :phone, uniqueness: true, presence: true
  validates :avatar, presence: true
  enum role: ['caretaker', 'lone_ranger']
end
