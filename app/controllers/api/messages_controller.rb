class Api::MessagesController < ApplicationController
  def index
    text = Message.where(user_id:current_user,receive_user_id:params[:id])
    # ajaxで送られてくる最後のメッセージのid番号を変数に代入
    last_message_id = params[:last_id]
    # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
    @messages = text.includes(:user).where("id > ?", last_message_id)
  end
end

