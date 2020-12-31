class AddUserToCheckins < ActiveRecord::Migration[6.0]
  def change
    add_reference :checkins, :user, foreign_key: true
    add_reference :checkins, :group, foreign_key: true
  end
end
