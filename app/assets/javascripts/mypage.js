$(document).on('turbolinks:load', function() {
  // パスの取得
  const pathName = location.pathname;

  // マイページのパスの時
  $(function() {
    if (pathName == ("/users/1/mypage")) {
      $("ul.mypage-nav__list li:eq(0) .arrow-right").css("color", "black");
      $("ul.mypage-nav__list li:eq(0)").css("background-color", "rgb(238, 238, 238)");
    
  // 出品した商品-出品中のパスの時
    } else if (pathName == ("/users/1/users/listing")) {
      $("ul.mypage-nav__list li:eq(5)").css("background-color", "rgb(238, 238, 238)");
      $("ul.mypage-nav__list li:eq(5) .arrow-right").css("color", "black");

  // 出品した商品-取引中のパスの時
    } else if (pathName == ("/users/1/users/in_progress")) {
      $("ul.mypage-nav__list li:eq(6)").css("background-color", "rgb(238, 238, 238)");
      $("ul.mypage-nav__list li:eq(6) .arrow-right").css("color", "black");

  // 出品した商品-売却済みのパスの時
    } else if (pathName == ("/users/1/users/completed")) {
      $("ul.mypage-nav__list li:eq(7)").css("background-color", "rgb(238, 238, 238)");
      $("ul.mypage-nav__list li:eq(7) .arrow-right").css("color", "black");

  // 購入した商品-取引中のパスの時
    } else if (pathName == ("/users/1/users/purchase")) {
      $("ul.mypage-nav__list li:eq(8)").css("background-color", "rgb(238, 238, 238)");
      $("ul.mypage-nav__list li:eq(8) .arrow-right").css("color", "black");

  // 購入した商品-過去の取引のパスの時
    } else if (pathName == ("/users/1/users/purchased")) {
      $("ul.mypage-nav__list li:eq(9)").css("background-color", "rgb(238, 238, 238)");
      $("ul.mypage-nav__list li:eq(9) .arrow-right").css("color", "black");

  // ログアウトのパスの時
    } else if (pathName.includes("/users/logout")) {
      $("ul.side-menu__config-ul li:eq(6)").css("background-color", "rgb(238, 238, 238)");
      $("ul.side-menu__config-ul li:eq(6) .arrow-right").css("color", "black");
    }
  });

});