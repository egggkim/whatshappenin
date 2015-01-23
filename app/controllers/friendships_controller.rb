class FriendshipsController < ApplicationController
  def create
    # @friendship = Friendship.new({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    @friendship = current_user.friendships.build({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    if @friendship.save
      flash[:notice] = "added friend"
      redirect_to users_path
    else
      flash[:notice] = "not able to add"
      redirect_to users_path
    end

  end

  def destroy
  end
end
