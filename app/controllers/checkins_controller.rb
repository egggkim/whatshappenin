class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.all 
  end

  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = current_user.checkins.build({ :user_id => current_user.id })
    if @checkin.save
      redirect_to users_path
    else
      render :new
    end
  end

  def destroy
    @checkin = Checkin.find(params[:id])
    if @checkin.destroy
      redirect_to users_path
    end
  end

  
end
