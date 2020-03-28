class MessagesController < ApplicationController
  before_action :set_user
  before_action :set_friend

def index
  @message=Message.new
end

def create
  @message = @user.messages.new(message_params)
  if @message.save
    redirect_to messages_path(@user), notice: 'メッセージが送信されました'
  else
    @messages = @user.messages.includes(:user)
    flash.now[:alert] = 'メッセージを入力してください。'
    render :index
  end
end


private

def set_user
  @user = User.find(params[:id])
end

def set_friend
  @friends = current_user.matchers
end

def message_params
  params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
end

end
