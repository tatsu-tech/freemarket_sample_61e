$(document).on('turbolinks:load', function() {
    $(function(){
      
      $('.price-box__group__right__input__box').keyup(function(){

        var salesPrice = $(this).val();
        var salesFee = Math.floor(salesPrice * 0.1);
        var selesPriceFix = Math.floor(salesPrice - salesFee);

        if (salesPrice > 299 && salesPrice < 10000000) {
          $('#salesFee').text("¥" + salesFee.toLocaleString())
          $('#selesPriceFix').text("¥" + selesPriceFix.toLocaleString())
        } else {
          $('#salesFee').text("-")
          $('#selesPriceFix').text("-")
        }
      });
    });
});
