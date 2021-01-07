class Checkin < ApplicationRecord

  validates_presence_of :name, :time, :response, :user_id, :group_id, :window

  belongs_to :user
  belongs_to :group

  enum category: %w(Wellness Medication)
  enum response: %w(Pending Answered None)

end
