require 'rails_helper'

RSpec.describe Checkin, :type => :model do

  it "has a valid factory" do
    expect(FactoryGirl.build(:checkin)).to be_valid
  end

# ============== checkin attribute validation tests ==============
  describe "GET /new" do
    it "has a name input by the user and pulled from google json request" do
      checkin = FactoryGirl.build(:checkin)
      expect(checkin.name).to_not be_nil
      expect(checkin.name).to_not be_empty
    end

    it "can be created with location name that already exists (multiple check ins)" do
      checkin = FactoryGirl.build(:checkin, name: "GA")
      checkin2 = FactoryGirl.build(:checkin, name: "GA")
      expect(checkin2).to be_valid
    end

    it "has a longitude pulled from google json request" do
      checkin = FactoryGirl.build(:checkin)
      expect(checkin.longitude).to_not be_nil
      expect(checkin.longitude).to_not be_empty
    end

    it "has a latitude from google json request" do 
      checkin = FactoryGirl.build(:checkin)
      expect(checkin.latitude).to_not be_nil
      expect(checkin.latitude).to_not be_empty
    end

    it "has a type pulled from google json request" do
      checkin = FactoryGirl.build(:checkin)
      expect(checkin.types).to_not be_nil
      expect(checkin.types).to_not be_empty
    end

    it "has a status input by the user" do
      checkin = FactoryGirl.build(:checkin)
      expect(checkin.status).to_not be_nil
      expect(checkin.status).to_not be_empty
    end

    it "returns the business type as a string" do
      checkin = FactoryGirl.build(:checkin)      
      expect(checkin.types).to be_an_instance_of(String)
    end

    it "is valid without a photo" do
      checkin = FactoryGirl.build(:checkin, photo: nil)
      expect(checkin).to be_valid
    end
  end
end