class MygymsController < ApplicationController
  before_action :set_user
  def index
   if current_user.mygym.present?
    redirect_to tweets_path(@user.id)
   end
  end

  def edit
    @mygym=current_user.mygym
  end

  def update
    @mygym=current_user.mygym
    @mygym.update(update_params)
    redirect_to tweets_path(@user.id)
  end

  def create
    @mygym = Mygym.new(mygym_params)
    @mygym[:user_id]=current_user.id
    if @mygym.save
      redirect_to tweets_path(@user.id)
    else
      redirect_to mygyms_path
    end
  end

  def destroy
    @mygym=current_user.mygym
    @mygym.destroy
    redirect_to user_path(@user.id)
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def mygym_params
    params.permit(:gym,:user_id)
  end

  def update_params
    params.require(:mygym).permit(:gym,:user_id)
  end
end