# class Api::MessagesController < ApplicationController
#   def index
#     @user = User.find(params[:id])
#     last_message_id = params[:id].to_i
#     # 取得したグループでのメッセージ達から、idがlast_message_idよりも新しい(大きい)メッセージ達のみを取得
#     @messages = @user.messages.where("id > ?", last_message_id)
#   end
# end
