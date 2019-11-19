$(document).on('turbolinks:load', function() {

  $(".top-box__bottom--left").on("click", ".top-box__bottom--left--nogood", function(){
    $(".top-box__bottom--left--nogood").toggle();
    $(".top-box__bottom--left--good").toggle();
  });
  $(".top-box__bottom--left").on("click", ".top-box__bottom--left--good", function(){
    $(".top-box__bottom--left--nogood").toggle();
    $(".top-box__bottom--left--good").toggle();
  });

});