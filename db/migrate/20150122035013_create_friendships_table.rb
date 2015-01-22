class CreateFriendshipsTable < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.references :friender, references: :user, index: true
      t.references :friendee, references: :user, index: true

      t.timestamps
    end
  end
end
