class MygymsController < ApplicationController
  before_action :set_user
  def index
  end

  def show
    binding.pry
    @gym =current_user.gyms
  end

  def new

  end

  def edit
  end

  def update
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
  end


  private
  def set_user
    @user = User.find(params[:id])
  end

  def update_params
    params.require(:mygym).permit(:tweet,:gym,:user_id)
  end
end