require 'rails_helper'

RSpec.describe User, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:user)).to be_valid
  end

# ============== users name validation tests ==============
  it "has a name" do
    user = FactoryGirl.build(:user, :name => nil)

    expect(user).to respond_to(:name)
    expect(user).to be_invalid
    expect{user.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

# ============== users email validation tests ==============
  context 'when a user is instantiated without an email' do
    user = FactoryGirl.build(:user)

    it "has an email" do
      expect(user).to respond_to(:email)
      expect(user.email).to_not be_nil
      expect(user.email).to_not be_empty
    end
  end

# ============== users password validation tests ==============
  context 'when a user is instantiated without a password' do
    user = FactoryGirl.build(:user)

    it "has a password" do
      expect(user.password).to_not be_nil
      expect(user.password).to_not be_empty
    end
  end

# ============== users city validation tests ==============
  context 'when a user is instantiated without a city' do
    user = FactoryGirl.build(:user, :city => nil)

    it "has a city" do
      expect(user).to respond_to(:city)
      expect(user).to be_valid
      expect{user.save!}.not_to raise_error
    end
  end

end
