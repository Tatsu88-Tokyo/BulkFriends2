class MessagesController < ApplicationController
  before_action :set_user
  before_action :set_friend

def index
  send_ids = current_user.messages.where(receive_user_id: @user.id).pluck(:id)
  receive_ids = @user.messages.where(receive_user_id: current_user.id).pluck(:id)
  @message=Message.new
  @messages = Message.where(id: send_ids + receive_ids).order(created_at: :asc)
end

def create
  @message = current_user.messages.new(message_params)
  @message.receive_user_id = @user.id
  if @message.save
    respond_to do |format|
      # format.html{ redirect_to messages_path(@user)}
      format.json
    end
  else
    @messages = @user.messages.includes(:user)
    flash.now[:alert] = 'メッセージを入力してください。'
    redirect_to messages_path(@user)
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
