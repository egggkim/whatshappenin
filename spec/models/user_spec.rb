require 'rails_helper'

RSpec.describe User, :type => :model do

  it "has a name" do
    expect(subject).to respond_to(:name)
    expect(subject).to be_invalid
    expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
  end

  context 'when a user is instantiated without an email' do

    subject(:user){User.new(name:'tony')}

    it "has an email" do
      expect(subject).to respond_to(:email)
      expect(user).to be_invalid
      expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when a user is instantiated without a password' do

    subject(:user){User.new(name:'tony', email:'tony@example.com')}

    it "has a password" do
      expect(subject).to respond_to(:password)
      expect(user).to be_invalid
      expect{subject.save!}.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  context 'when a user is instantiated without a city' do

    subject(:user){User.new(name:'tony', email:'tony@example.com', password: 'password')}

    it "has a city" do
      expect(subject).to respond_to(:city)
      expect(user).to be_valid
      expect{subject.save!}.not_to raise_error
    end
  end

end
