class Api::MessagesController < ApplicationController
  def index
    user = User.find(params[:id])
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_message_id = params[:id].to_i
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = user.messages.includes(:user).where("id > ?", last_message_id)
  end
end

# def index
#   # user = User.find(params[:id])
#   @message = Message.where(user_id:current_user,receive_user_id:params[:id])
#   # ajaxで送られてくる最後のメッセージのid番号を変数に代入
#   last_message_id = @message.ids.last
#   # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
#   @messages = user.messages.includes(:user).where("id > ?", last_message_id)
# end