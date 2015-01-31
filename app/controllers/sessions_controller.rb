class SessionsController < ApplicationController
  def create
    user = User.where(email: params[:login][:email]).first
    # [:login] defined in view as form for login
    if user && user.authenticate(params[:login][:password])
      session[:user_id] = user.id.to_s
      redirect_to root_path

    else
      flash[:notice] = "Error logging in. Please try again."
      redirect_to root_path
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
