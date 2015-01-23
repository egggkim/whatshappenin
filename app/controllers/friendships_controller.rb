class FriendshipsController < ApplicationController
  def create
    # @friendship = Friendship.new({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    @friendship = current_user.friendships.build({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    if @friendship.save
      redirect_to users_path
    else
      redirect_to users_path
    end

  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @friendship.destroy
    redirect_to users_path
  end
end
