class LikesController < ApplicationController
  before_action :set_like, only: %i[ destroy ]
  before_action :set_tweet
  def create
    if !current_user.liked?(params[:tweet_id])
      @like = @tweet.likes.create(user_id: current_user.id)
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { render json: { count: @tweet.total_likes, like: current_user.liked?(params[:id]) } }
      end
    end
  end

  def destroy
    if current_user.liked?(params[:tweet_id])
      @like = Like.find(params[:id])
      @like.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

  private

  def set_like
    @like = Like.find(params[:id])
  end

  def set_tweet
    @tweet = Tweet.find(params[:tweet_id])
  end

end

