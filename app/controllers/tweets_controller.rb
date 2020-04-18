class TweetsController < ApplicationController
  before_action :set_user
  def index
    @gym=current_user.mygym
  end


  private
  def set_user
    @user = User.find(params[:id])
  end
end