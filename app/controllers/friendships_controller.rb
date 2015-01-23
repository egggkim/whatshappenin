class FriendshipsController < ApplicationController
  def create
    @friendship = Friendship.new({:friendee_id => params[:friendee_id], :friender_id => current_user.id})
    # friendee = User.find(params[:friendee_id])
    # @friendship = current_user.friends.push(friendee)
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
