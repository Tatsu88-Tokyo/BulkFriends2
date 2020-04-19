$(function() {
  //クリックしたときのファンクションをまとめて指定
  $('.tab li').click(function() {
      let index = $('.tab li').index(this);
      $('.content li').css('display','none');
      $('.content li').eq(index).css('display','block');
      $('.tab li').removeClass('select');
      $(this).addClass('select')
  });
});


