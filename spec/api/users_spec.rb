require "rails_helper"

# ============== API users tests ==============
  describe "Users API", :type => :request do
    let(:request_headers) do 
        { "Accept" => "application/json", "Content-type" => "application/json" }
      end

    it "returns a list of user data" do
      user1 = FactoryGirl.create(:user, :email => "api1@test.com")
      user2 = FactoryGirl.create(:user, :email => "api2@test.com")

      get "/api/users"

      expect(response).to have_http_status 200
      users = JSON.parse(response.body)
      expect(users.count).to eq(2)
    end

    it "returns a specific user" do
      user = FactoryGirl.create(:user, :email => "api3@test.com")

      get "/api/users/#{user.id}"

      expect(response).to have_http_status 200
      expect(response.body).to eq(user.to_json)
    end
  end
