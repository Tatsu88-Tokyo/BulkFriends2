class HomeController < ApplicationController
  def top
    if user_signed_in?
      @user = current_user
      redirect_to user_path(@user.id)
    end
  end
end
