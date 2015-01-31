require 'rails_helper'

RSpec.describe Friendship, :type => :model do
  it "creates a new friendship" do 
    friendship = FactoryGirl.build(:friendship)
    expect{friendship.save!}.to change{Friendship.count}.by(1)
  end

  it "creates the inverse friendship" do 
    friendship = FactoryGirl.build(:friendship)
    inverse = FactoryGirl.build(:friendship, :user_id => 2, :friendee_id => 1)
    expect{inverse.save!}.to change{Friendship.count}.by(1)
  end
end
