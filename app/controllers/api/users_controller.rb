module API
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session
    respond_to :json

    def index
      users = User.all

      respond_with users
    end

  end
end