class AddNameToCheckins < ActiveRecord::Migration[6.0]
  def change
    add_column :checkins, :name, :string
  end
end
