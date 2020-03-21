class UserController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: [:show, :edit,:profile,:profile_update,:logout]
#     before_action :set_address, only: [:edit, :update]

def show
  @relationship = Relationship.new
end

def edit
end

def logout
end


def profile_update
  if @user.update(user_params)
    redirect_to user_path(@user.id)
  else
    render :profile
  end
end


private

def set_user
  @user = User.find(params[:id])
end

def user_params
  params.require(:user).permit(
    :nickname,
    :email,
    :password,
    :avatar,
    :introduction,
  )
end

end
