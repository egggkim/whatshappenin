class CreateFriendshipRequests < ActiveRecord::Migration
  def change
    create_table :friendship_requests do |t|
      t.references :user, index: true
      t.references :friendee, references: :user, index: true

      t.timestamps
    end
  end
end
