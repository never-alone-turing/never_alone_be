class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :checkins, :checkin_type, :category
  end
end
