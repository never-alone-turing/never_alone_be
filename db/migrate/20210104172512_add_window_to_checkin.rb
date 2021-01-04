class AddWindowToCheckin < ActiveRecord::Migration[6.0]
  def change
    add_column :checkins, :window, :datetime
  end
end
