class ChangeColumnName < ActiveRecord::Migration
  def change
    rename_column :friendships, :friender_id, :user_id
  end
end
