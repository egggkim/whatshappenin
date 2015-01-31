class AddColumnPhotoToCheckins < ActiveRecord::Migration
  def change
    add_column :checkins, :photo, :string
  end
end
