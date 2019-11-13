$(document).on('turbolinks:load', function() { 
  $(function(){
    //画面がリロードされた時に商品に紐付く写真の枚数を数える
    var count_images = $('.sell-content__upload__wrap__preview__img').length; // 初期で表示されている画像の枚数をカウント
    if (count_images == 5){//写真が5枚の時はファイルフィールドを隠す
      $('.image-input-field').hide();
    } 
    //写真の削除ボタンが押された時
    $('#previewUpload').on('click', '#imageDelete', function(){
      //削除ボタンの押された写真の表示を消す
      $(this).parent().hide();
      count_images = $('.image-box:visible').length;
      //表示されている写真の合計枚数を数え、ファイルフィールドを復活させる
      if (count_images < 5){
        $('.image-input-field').show();
      }
    });
    //送信ボタンが押された時、一度submitを止め、データの成形を行う
    $('#edit-send-btn').on('click', function(e){
      e.preventDefault();
      //削除ボタンが押された写真のidを取得する
      var deletePhotoIds = [];
      $('.sell-content__upload__wrap__preview__box:hidden').each(function(){
        deletePhotoIds.push($(this).data('image'));
      });

      $("#imageDelete").append(
        $('<input type="hidden" name="delete_images">').val(deletePhotoIds)
      ); 
      $('#new_item').submit();
    });
  });
});
