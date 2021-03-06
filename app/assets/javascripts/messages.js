$(function(){
  let reloadMessages = function(){
    if (location.href.match(/\/user\/\d+\/messages/)){
      let last_message_id = $('.message:last').data('message-id');
      console.log(last_message_id);
    $.ajax({
      url:'api/messages',
      type:'get',
      dataType:'json',
      data: {last_id: last_message_id}
    })
    .done(function (messages){
      let insertHTML = '';
      messages.forEach(function (message){
      insertHTML = buildHTML(message);
      $('.contents').append(insertHTML);
      })
      $('.messages__main__contents').animate({scrollTop: $('.contents')[0].scrollHeight});
    })
    .fail(function(){
      alert('自動更新,失敗')
    });
    }
  };

setInterval(reloadMessages, 5000);
// setTimeout(function () {
//     location.reload();
// }, 30000);

  function buildHTML(message){
    let image = message.image ? `<img class="lower-message__image" src=${message.image}>` : ``

    let html = `<div class="message" data-message-id = ${message.id}>
                <div class="upper-message">
                <div class="upper-message__user-name">
                ${message.name}
                </div>
                <div class="upper-message__date">
                ${message.created_at}
                </div>
                </div>
                <div class="lower-message">
                <p class="lower-message__content">
                ${message.content}
                </p>
                ${image}
                </div>
                </div>`;
      return html
    }
  $('#new_message').on('submit',function(e){
    e.preventDefault();
    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type:"POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType:false
    })
    .done(function(message){
      let html = buildHTML(message)
      $('.contents').append(html);
      $('.messages__main__contents').animate({scrollTop: $('.contents')[0].scrollHeight});
      $('#new_message')[0].reset();
      $('.form__submit').prop('disabled',false);
    })
    .fail(function(){
      alert('error!');
    })
  })
});