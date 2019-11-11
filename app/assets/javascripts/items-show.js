$(document).on('turbolinks:load', function() {

  $("ul.top-box__detail--left--main-photo li:eq(0)").css("left", "0");
  $("ul.top-box__detail--left--main-photo li:eq(1)").css("left", "300px");
  $("ul.top-box__detail--left--main-photo li:eq(2)").css("left", "600px");
  $("ul.top-box__detail--left--main-photo li:eq(3)").css("left", "900px");
  $("ul.top-box__detail--left--main-photo li:eq(4)").css("left", "1200px");
  $("ul.top-box__detail--left--main-photo li:eq(5)").css("left", "1500px");
  $("ul.top-box__detail--left--main-photo li:eq(6)").css("left", "1800px");
  $("ul.top-box__detail--left--main-photo li:eq(7)").css("left", "2100px");
  $("ul.top-box__detail--left--main-photo li:eq(8)").css("left", "2400px");
  $("ul.top-box__detail--left--main-photo li:eq(9)").css("left", "2700px");


  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(0)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '0px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(1)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-300px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(2)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-600px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(3)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-900px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(4)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-1200px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(5)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-1500px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(6)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-1800px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(7)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-2100px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(8)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-2400px'}, 550);
  })
  $('.top-box__detail--left--sub-photo').on("mouseenter", "li:eq(9)", function() {
    $('.top-box__detail--left--main-photo').animate({'left': '-2700px'}, 550);
  })

});
