class FriendsController < ApplicationController
  before_action :set_friend, only: %i[ destroy ]

  def create
    if !current_user.follow?(params[:friend_id])
      @follow = Friend.create(user_id: current_user.id, friend_id: params[:friend_id])
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: @follow, status: :ok }
      end
    end
  end

  def destroy
    if current_user.follow?(params[:friend_id])
      @friend.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_friend
    @friend = Friend.find_by(user_id: current_user.id, friend_id: params[:friend_id])
  end

end
