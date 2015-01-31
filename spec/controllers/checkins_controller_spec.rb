require 'rails_helper'

RSpec.describe CheckinsController, :type => :controller do

# ============== checkins show action tests ==============
  describe "GET #show" do
  
    it "returns http success code for checkins show action" do
      checkin = FactoryGirl.create(:checkin, :status=> "hello")
      get :show, :id => checkin.id
      expect(response).to have_http_status(:success)
    end

    it "renders the checkin show view" do
      checkin = FactoryGirl.create(:checkin)
      get :show, :id => checkin.id
      expect(response).to render_template("show")
    end

    it "shows the checkin" do
      checkin = FactoryGirl.create(:checkin)
      get :show, :id => checkin.id
      expect(assigns(:checkin)).to match(checkin)
    end
  end
end