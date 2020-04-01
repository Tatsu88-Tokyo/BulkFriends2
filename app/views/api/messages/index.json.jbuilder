json.array! @messages do |message|
  json.content message.content
  json.name user.nickname
  json.image message.image.url
  json.created_at message.created_at.strftime("%Y年%m月%d日 %H時%M分")
  json.id message.id
end