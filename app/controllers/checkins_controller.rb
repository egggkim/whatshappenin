class CheckinsController < ApplicationController
  def index
    @checkins = Checkin.all 
  end

  def new
    @checkin = Checkin.new
  end

  def create
    @checkin = Checkin.new(checkin_params)
    current_user.checkins << @checkin

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

  private
  def checkin_params
    params.require(:checkin).permit(:name, :formatted_address, :status, :longitude, :latitude, :types, :photo)
  end
  
end
