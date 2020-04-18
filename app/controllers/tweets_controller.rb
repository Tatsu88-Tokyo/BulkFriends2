class TweetsController < ApplicationController
  def index
    @gym=current_user.mygym
    @tweets=Tweet.all
    # @tweets=Tweet.all.page(params[:page]).per(10).order("created_at DESC")
  end

  def show
    @tweet = current_user.tweets.find(params[:id])
  end

  def new
  end

  def edit
    @tweet = current_user.tweets.find(params[:id])
  end

  def update
    @tweet = current_user.tweets.find(params[:id])
    @tweet.update(update_params) if @tweet.user_id == current_user.id
    redirect_to tweets_path(current_user.id)
  end

  def create
    @tweet = current_user.tweets.new(tweet_params)
    if @tweet.save
      redirect_to tweets_path(current_user.id)
    else
      redirect_to new_tweet_path
    end
  end

  def destroy
    @tweet = current_user.tweets.find(params[:id])
    @tweet.destroy if @tweet.user_id == current_user.id
    redirect_to tweets_path(current_user.id)
  end



private
  def tweet_params
    params.permit(:content,:user_id)
  end

  def update_params
    params.require(:tweet).permit(:content,:user_id)
  end

end