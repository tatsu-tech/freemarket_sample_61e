$(document).on('turbolinks:load', function() {

  $(".top-box__bottom--left").on("click", ".top-box__bottom--left--nogood", function(){
    console.log('ok')
    $(".top-box__bottom--left--nogood").toggle();
    $(".top-box__bottom--left--good").toggle();
  });
  $(".top-box__bottom--left").on("click", ".top-box__bottom--left--good", function(){
    console.log('ok')
    $(".top-box__bottom--left--nogood").toggle();
    $(".top-box__bottom--left--good").toggle();
  });


});