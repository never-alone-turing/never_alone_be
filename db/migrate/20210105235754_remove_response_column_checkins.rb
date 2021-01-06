class RemoveResponseColumnCheckins < ActiveRecord::Migration[6.0]
  def change
    remove_column :checkins, :response
  end
end
