class CreateCheckinsUsersJoinTable < ActiveRecord::Migration
  def change
    create_table :checkins_users do |t|
    t.integer :user_id
    t.integer :checkin_id

    t.timestamps
    end
  end
end
