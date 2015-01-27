class FriendshipRequestsController < ApplicationController
  def create
    
    @request = current_user.friendship_requests.build({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    if @request.save
      redirect_to users_path
    else 
      redirect_to users_path
    end
  end

  def destroy
    @request = current_user.friendships_requests.find(params[:id])
    @request.destroy
    redirect_to users_path
  end



end