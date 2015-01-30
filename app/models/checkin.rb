class Checkin < ActiveRecord::Base
  # save business types as array in db
  serialize :types, Array

  has_and_belongs_to_many :users
  
  validates :name, presence: true
  validates :status, presence: true
end
