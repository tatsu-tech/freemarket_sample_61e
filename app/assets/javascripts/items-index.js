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

  $(function(){
    $(".header__body__foot--left").on("mouseenter", ".header__body__foot--left--category", function(){
      $(".header__body__foot--left--category--l").show();
    });
  });
  $(function(){
    $(".header__body__foot--left").on("mouseleave", ".header__body__foot--left--category", function(){
      $(".header__body__foot--left--category--l").hide();
    });
  });

  $(function(){
    $(".header__body__foot--left").on("mouseenter", ".header__body__foot--left--category--l", function(){
      $(".header__body__foot--left--category--l--m").show();
    });
  });
  $(function(){
    $(".header__body__foot--left--category").on("mouseleave",".header__body__foot--left--category--l", function(){
      $(".header__body__foot--left--category--l--m").hide();
    });
  });
    
  $(function(){
    $(".header__body__foot--left--category--l").on("mouseenter", ".header__body__foot--left--category--l--m", function(){
      $(".header__body__foot--left--category--l--m--s").show();
    });
  });
  $(function(){
    $(".header__body__foot--left--category--l").on("mouseleave",".header__body__foot--left--category--l--m", function(){
      $(".header__body__foot--left--category--l--m--s").hide();
    });
  });
    
  $(function(){
    $(".header__body__foot--left").on("mouseenter", ".header__body__foot--left--brand", function(){
      $(".header__body__foot--left--brand--l").show();
    });
  });
  $(function(){
    $(".header__body__foot--left").on("mouseleave", ".header__body__foot--left--brand", function(){
      $(".header__body__foot--left--brand--l").hide();
    });
  });

  $(function(){
    $(".header__body__foot--right").on("mouseenter", ".header__body__foot--right--notice", function(){
      $(".header__body__foot--right--notice--dropdwn").show();
    });
  });
  $(function(){
    $(".header__body__foot--right").on("mouseleave", ".header__body__foot--right--notice", function(){
      $(".header__body__foot--right--notice--dropdwn").hide();
    });
  })

  $(function(){
    $(".header__body__foot--right").on("mouseenter", ".header__body__foot--right--todo", function(){
      $(".header__body__foot--right--todo--dropdwn").show();
    });
  });
  $(function(){
    $(".header__body__foot--right").on("mouseleave", ".header__body__foot--right--todo", function(){
      $(".header__body__foot--right--todo--dropdwn").hide();
    });
  })

  $(function(){
    $(".header__body__foot--right").on("mouseenter", ".header__body__foot--right--mypage", function(){
      $(".header__body__foot--right--mypage--dropdwn").show();
    });
  });
  $(function(){
    $(".header__body__foot--right").on("mouseleave", ".header__body__foot--right--mypage", function(){
      $(".header__body__foot--right--mypage--dropdwn").hide();
    });
  })

  $('.header__body__foot--right--notice').hover(function(){
    $('.header__body__foot--right--notice').css('color', 'rgb(0, 149, 238)');
  },
  function() {
    $(this).css('color', '#000000')
  });

});