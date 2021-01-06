class AddResponseToCheckin < ActiveRecord::Migration[6.0]
  def change
    add_column :checkins, :response, :integer, default: 0
  end
end
