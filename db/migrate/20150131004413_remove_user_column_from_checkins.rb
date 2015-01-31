class RemoveUserColumnFromCheckins < ActiveRecord::Migration
  def change
    remove_column :checkins, :user
  end
end
