require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

# ============== index action tests ==============
  describe "GET #index" do
    it "returns http success code for users index action" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "renders the user index view" do
      get :index
      expect(response).to render_template("index")
    end
  end

# ============== show action tests ==============
  describe "GET #show" do
  
    it "returns http success code for users show action" do
      user = FactoryGirl.create(:user, :email => "h0@h.com")
      get :show, :id => user.id
      expect(response).to have_http_status(:success)
    end

    it "renders the user show view" do
      user = FactoryGirl.create(:user, :email => "h1@h.com")
      get :show, :id => user.id
      expect(response).to render_template("show")
    end

    it "shows the user" do
      user = FactoryGirl.create(:user, :email => "h2@h.com")
      get :show, :id => user.id
      expect(assigns(:user)).to match(user)
    end
  end

# ============== edit action tests ==============
  describe "GET #edit" do
    it "returns http success code for users edit action" do
      user = FactoryGirl.create(:user, :email => "h3@h.com")
      get :edit, :id => user.id
      expect(response).to have_http_status(:success)
      expect(response).to render_template("edit")
    end
  end

# # ============== destroy action tests ==============
  describe "GET #destroy" do
    it "returns http success code for users destroy action" do
      user = FactoryGirl.create(:user, :email => "h4@h.com")
      get :destroy, :id => user.id
      expect(response).to have_http_status(302)
    end
  end

end