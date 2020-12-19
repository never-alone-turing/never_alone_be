class Checkin < ApplicationRecord

  validates_presence_of :checkin_type, :time, :response

  # belongs_to :user
  # belongs_to :pack

  enum checkin_type: %w(wellness medication)

end
