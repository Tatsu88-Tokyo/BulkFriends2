class TrainingsController < ApplicationController
  def index
    @trainings = Training.all
  end

  def show
    @trainings = Training.all
  end

  def create
  end

  def destroy
    @trainings = Training.all
  end
  private
  def traing_memo
    params.require(:traing).permit(:title, :content, :start_time)
  end
end
