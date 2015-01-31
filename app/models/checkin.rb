class Checkin < ActiveRecord::Base
  # save business types as array in db

  has_and_belongs_to_many :users
  mount_uploader :photo, PhotoUploader

  validates :status, presence: true
end
