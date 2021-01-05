class Checkin < ApplicationRecord

  validates_presence_of :category, :time, :response, :user_id, :group_id, :window

  belongs_to :user
  belongs_to :group

  enum category: %w(wellness medication)

end
