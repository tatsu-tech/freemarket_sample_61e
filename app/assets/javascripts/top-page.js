$(document).on('turbolinks:load', function() {

  $('.header__body__foot--left--category').hover(function(){
    $('.header__body__foot--left--category').css('color', 'rgb(0, 149, 238)');
  },
  function() {
    $(this).css('color', '#000000')
  });

  $('.header__body__foot--left--brand').hover(function(){
    $('.header__body__foot--left--brand').css('color', 'rgb(0, 149, 238)');
  },
  function() {
    $(this).css('color', '#000000')
  });

  $('.header__body__foot--right--login').hover(function(){
    $('.header__body__foot--right--login').css('color', 'white');
    $('.header__body__foot--right--login').css('background-color', 'rgb(0, 149, 238)');
  },
  function() {
    $(this).css('color', 'rgb(0, 149, 238)');
    $(this).css('background-color', 'white');
  });

  $('.app-store-s').hover(function(){
    $('.app-store-s').css('opacity', '0.7');
  },
  function() {
    $(this).css('opacity', '1');
  });
  
  $('.google-play-s').hover(function(){
    $('.google-play-s').css('opacity', '0.7');
  },
  function() {
    $(this).css('opacity', '1');
  });

  $('.mercari-logo-white').hover(function(){
    $('.mercari-logo-white').css('opacity', '0.7');
  },
  function() {
    $(this).css('opacity', '1');
  });

});