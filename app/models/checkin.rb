class Checkin < ApplicationRecord

  validates_presence_of :checkin_type, :time, :response, :user_id, :group_id

  belongs_to :user
  belongs_to :group

  enum checkin_type: %w(wellness medication)

end
