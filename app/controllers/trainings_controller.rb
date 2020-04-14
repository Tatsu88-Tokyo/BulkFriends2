class TrainingsController < ApplicationController
  before_action :set_user
  def index
    @trainings = current_user.trainings
  end

  def show
    @training = current_user.trainings.find(params[:id])
  end

  def new
    @trainings = current_user.trainings
  end

  def create
    @training = current_user.trainings.new(training_memo)
    if @training.save
      redirect_to trainings_path(@user.id)
    else
      redirect_to new_training_path
    end
  end

  def destroy
    @trainings = current_user.trainings.find(params[:id])
    @trainings.destroy
    redirect_to trainings_path(@user.id)
  end


  private
  def training_memo
    params.permit(:start_time,:title, :content,:user_id)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
