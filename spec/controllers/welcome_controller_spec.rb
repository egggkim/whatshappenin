require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

# ============== homepage tests ==============
  describe "GET index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
      expect(response).to render_template("index")
    end
  end

# ============== about page tests ==============
  describe "GET about" do
    it "returns http success" do
      get :about
      expect(response).to have_http_status(:success)
      expect(response).to render_template("about")
    end
  end

# ============== contact page tests ==============
  describe "GET contact" do
    it "returns http success" do
      get :contact
      expect(response).to have_http_status(:success)
      expect(response).to render_template("contact")
    end
  end

# ============== developers page tests ==============
  describe "GET developers" do
    it "returns http success" do
      get :developers
      expect(response).to have_http_status(:success)
      expect(response).to render_template("developers")
    end
  end

end
