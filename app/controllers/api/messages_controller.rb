class Api::MessagesController < ApplicationController
  def index
    @text = Message.where(user_id:current_user,receive_user_id:params[:id])
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_message_id = @text.ids.last
    @content = @text.find(last_message_id)
    user = User.find(@content.user_id)
    # user = User.find(params[:id])
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = user.messages.where("id > #{last_message_id}")
  end
end

