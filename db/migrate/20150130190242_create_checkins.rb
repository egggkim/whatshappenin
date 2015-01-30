class CreateCheckins < ActiveRecord::Migration
  def change
    create_table :checkins do |t|
      t.string :user
      t.string :name
      t.string :formatted_address
      t.string :longitude
      t.string :latitude
      t.string :types
      t.string :status

      t.timestamps
    end
  end
end
