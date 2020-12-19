class CreateCheckins < ActiveRecord::Migration[6.0]
  def change
    create_table :checkins do |t|
      t.integer :checkin_type
      t.datetime :time
      t.boolean :response, default: nil

      t.timestamps
    end
  end
end
