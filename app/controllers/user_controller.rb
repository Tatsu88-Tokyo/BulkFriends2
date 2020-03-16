class UserController < ApplicationController
  before_action :set_user, only: [:show, :edit,:profile,:profile_update,:logout]
#     before_action :set_address, only: [:edit, :update]
  
def show
end
  
#     def edit
#     end
  
def logout
end
  
#     def update
#       if @address.update(address_params)
#         redirect_to edit_user_path(@address)
#       else
#         render :edit
#       end
#     end
#     def profile   
#     end
  
#     def profile_update
#       if @user.update(user_params)
#         redirect_to user_path
#       else
#         render :profile
#       end
#     end
#     def ready
#     end
  
  private
    def set_user
      @user = User.find(params[:id])
    end
end
