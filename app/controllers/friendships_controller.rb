class FriendshipsController < ApplicationController
  def create
    @friendship = current_user.friendships.build({:friendee_id => params[:friendee_id], :user_id => current_user.id})
    @inverse_friendship = current_user.friendships.build({:friendee_id => current_user.id, :user_id=> params[:friendee_id]})
    if @friendship.save && @inverse_friendship.save
      redirect_to users_path
    else
      redirect_to users_path
    end

  end

  def destroy
    @friendship = current_user.friendships.find(params[:id])
    @other_friendship = Friendship.where(user_id: @friendship.friendee, friendee_id: @friendship.user_id).first 
    # @inverse = @friendship.friendee.friendships
    # binding.pry
    @friendship.destroy
    @other_friendship.destroy
    redirect_to users_path
  end


end
