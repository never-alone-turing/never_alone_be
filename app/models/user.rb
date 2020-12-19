class User < ApplicationRecord
  validates :username, presence: true
  validates :email, uniqueness: true, presence: true
  validates :avatar
  validates :phone, uniqueness: true, presence: true
end
