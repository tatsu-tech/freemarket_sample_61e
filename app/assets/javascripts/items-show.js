$(document).on('turbolinks:load', function() {

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-imageT", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '0px'}, 700);
      $(".s-image1 , .s-image2 , .s-image3, .s-image4, .s-image5, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image1", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-300px'}, 700);
      $(".s-imageT , .s-image2 , .s-image3, .s-image4, .s-image5, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image2", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-600px'}, 700);
      $(".s-imageT , .s-image1 , .s-image3, .s-image4, .s-image5, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image3", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-900px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image4, .s-image5, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image4", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-1200px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image5, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })
    
    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image5", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-1500px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image4, .s-image6, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image6", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-1800px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image4, .s-image5, .s-image7, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image7", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-2100px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image4, .s-image5, .s-image6, .s-image8, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image8", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-2400px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image4, .s-image5, .s-image6, .s-image7, .s-image9").css("opacity", "0.4");
    })

    $('.top-box__detail--left--sub-photo--s').on("mouseenter", ".s-image9", function() {
      $(this).css("opacity", "1");
      $('.top-box__detail--left--main-photo--list').animate({'left': '-2700px'}, 700);
      $(".s-imageT , .s-image1 , .s-image2, .s-image3, .s-image4, .s-image5, .s-image6, .s-image7, .s-image8").css("opacity", "0.4");
    }) 
  });
