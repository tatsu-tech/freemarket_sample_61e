$(document).on('turbolinks:load', function() {
  $(function(){

    // プレビューHTML
    function previewImage(imageUrl){
      const previewHtml = 
      `<li class="sell-content__upload__wrap__preview__box" id="previewUpload-one">
      <img class="sell-content__upload__wrap__preview__img" as="image" src=${imageUrl}>
      <span class="sell-content__upload__wrap__preview__delete-btn" id="imageDelete">削除</span>
      </li>`
      return previewHtml
    }

    // var file_array = [];  // 画像を管理するための配列
    var first_images = $('.sell-content__upload__wrap__preview__box:visible').length; // 初期で表示されている画像の枚数をカウント
    if (first_images == 10){ //写真が10枚の時はファイルフィールドを隠す
      $('.sell-content__upload__wrap__box').hide(); 
    } else if ( first_images == 0 || first_images == 5 ) {
      $('.sell-content__upload__wrap__box').css('width', '100%');
    } else if ( first_images == 1 || first_images == 6 ) {
      $('.sell-content__upload__wrap__box').css('width', '79%');
    } else if ( first_images == 2 || first_images == 7 ) {
      $('.sell-content__upload__wrap__box').css('width', '59%');
    } else if ( first_images == 3 || first_images == 8 ) {
      $('.sell-content__upload__wrap__box').css('width', '39%');
    } else if ( first_images == 4 || first_images == 9 ) {
      $('.sell-content__upload__wrap__box').css('width', '19%');
    } else {
      $('.sell-content__upload__wrap__box').css('width', '100%');
    }


    // プレビュー画像にあわせてinputフィールドのサイズを変更
    $('#previewUpload').change(function(e){
      var files = e.target.files;
      var alreadyImages = $('.sell-content__upload__wrap__preview__box:visible').length;
      var countImages = alreadyImages+files.length
      if ( countImages == 0 || countImages == 5 ) {
        $('.sell-content__upload__wrap__box').css('width', '100%');
      } else if ( countImages == 1 || countImages == 6 ) {
        $('.sell-content__upload__wrap__box').css('width', '79%');
      } else if ( countImages == 2 || countImages == 7 ) {
        $('.sell-content__upload__wrap__box').css('width', '59%');
      } else if ( countImages == 3 || countImages == 8 ) {
        $('.sell-content__upload__wrap__box').css('width', '39%');
      } else if ( countImages == 4 || countImages == 9 ) {
        $('.sell-content__upload__wrap__box').css('width', '19%');
      } else {
        $('.sell-content__upload__wrap__box').css('width', '100%');
      }
    });

    $('#previewUpload').change(function(e){
      e.preventDefault();
      var files = e.target.files;
      var alreadyImages = $('.sell-content__upload__wrap__preview__box:visible').length;
      var countImages = alreadyImages+files.length
      $('#photo_upload').clone().appendTo('.input-image-box').hide()
      if (countImages > 10) {
          alert("画像のアップロードは10個までです");
          } else if (countImages == 10) {
          for (var i=0; i<files.length; i++) {
            const reader = new FileReader();  // ファイル読み込み
            reader.onload = function (e) {
            var imageUrl = e.target.result;   // URLを読み込み
            $('.sell-content__upload__wrap__preview').prepend(previewImage(imageUrl))
            }
            reader.readAsDataURL(files[i]);};   // フォールバック処理
            $('.sell-content__upload__wrap__box').hide()
          } else if (countImages < 10) {
            for (var i=0; i<files.length; i++) {
              const reader = new FileReader();
              reader.onload = function (e) {
              var imageUrl = e.target.result;
              $('.sell-content__upload__wrap__preview').prepend(previewImage(imageUrl))
              };
              reader.readAsDataURL(files[i]);
          };
          // $('.input-image-box').hide()
          // $('#photo_upload').clone().appendTo('.input-image-box').hide()
        } else {
            alert("商品画像を登録してください");
        }
    });

        //写真の削除ボタンが押された時
        $('#previewUpload').on('click', '#imageDelete', function(){
          var index = $(".sell-content__upload__wrap__preview__box:visible").index(this);
          // // 配列から、削除すべき画像を特定し、削除する。
          // file_array.splice(index - 1, 1);
          //削除ボタンの押された写真の表示を消す
          $(this).parent().hide();
          //表示されている写真の合計枚数を数え、ファイルフィールドを復活させる
          afterImages = $('.sell-content__upload__wrap__preview__box:visible').length;
          if (afterImages < 10){
            $('.sell-content__upload__wrap__box').show();
          } //表示されている写真の合計枚数を数え、inputフィールドのサイズを変更する
          if ( afterImages == 0 || afterImages == 5 ) {
            $('.sell-content__upload__wrap__box').css('width', '100%');
          } else if ( afterImages == 1 || afterImages == 6 ) {
            $('.sell-content__upload__wrap__box').css('width', '79%');
          } else if ( afterImages == 2 || afterImages == 7 ) {
            $('.sell-content__upload__wrap__box').css('width', '59%');
          } else if ( afterImages == 3 || afterImages == 8 ) {
            $('.sell-content__upload__wrap__box').css('width', '39%');
          } else if ( afterImages == 4 || afterImages == 9 ) {
            $('.sell-content__upload__wrap__box').css('width', '19%');
          } else {
            $('.sell-content__upload__wrap__box').css('width', '100%');
          }
        });

        // $('#new-send-btn').on('click', function(e){
          // var images = file_array;
          // formData.append('images', images.files);

        //送信ボタンが押された時、一度submitを止め、データの成形を行う
        // $('#new_item').on('submit', function(e){
        //   e.preventDefault();
        //   var url = $(this).attr('action');
        //   var formData = new FormData();
        //   // console.log(url);

        //   $('#photo_upload').val(""); //アップロードされた内容をリセット

        //     e.preventDefault();

            // ドラッグアンドドロップで、取得したファイルをformDataに入れる。
            // file_array.forEach(function(file){
            // formData.append("item[images][]" , file)
            // });
            // $.ajax({
            //   url:         url,
            //   type:        "POST",
            //   data:        formData,
            //   contentType: false,
            //   processData: false,
            //   dataType:   'json'
            // })
            // .done(function(){
            //   alert('出品に成功しました！');
            // })
            // .fail(function(){
            //   alert('出品に失敗しました！');
            // });






          // $(".image-input-field").append(
          //   $('<input multiple="multiple" accept="image/jpg,image/png" id="photo_upload" class="hidden" type="file">').push("item[images][]", file_array)
          // ); 
          // var formData = new FormData($(this).get(0));  // そのほかのform情報を以下の記述でformDataに追加
          // 取得したファイルをformDataに入れる。

        //   formData.set('images', file_array);
        //   // formData.append('item[images][]', file_array);
        //   fetch(url, {
        //     method: 'POST',
        //     body: formData,
        //   })
        //   // .then(response => response.json())
        //   .then(response => alert('Success'))
        //   .catch(error => alert('Error'));

        //   $('#new_item').submit();
        // });



        //編集ページの送信ボタンが押された時
        $('#new-send-btn').on('click', function(e){
          e.preventDefault();
          //削除ボタンが押された写真のidを取得する
          $('#photo_upload').eq(-1).remove();
          
          $('#new_item').submit();
        });

        //編集ページの送信ボタンが押された時
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

// var formData = new FormData();
// var photos = document.querySelector("input[type='file'][multiple]");

// formData.append('title', 'My Vegas Vacation');
// formData.append('photos', photos.files);

// fetch('https://example.com/posts', {
//   method: 'POST',
//   body: formData
// })
// .then(response => response.json())
// .then(response => console.log('Success:', JSON.stringify(response)))
// .catch(error => console.error('Error:', error));


// $('#new_message').on('submit',function(e){
//   e.preventDefault();
//   var formData = new FormData(this);
//   var url = $(this).attr('action');
//   $.ajax({
//     url: url,
//     type: "POST",
//     data: formData,
//     dataType: 'json',
//     processData: false,
//     contentType: false
//   })
//   .done(function(message){
//     var html = buildMessage(message);
//     $('.main-container__messages').append(html)
//     $("form")[0].reset();
//     $('.submit-btn').prop('disabled', false);
//     $('.main-container__messages').removeAttr('disabled');
//     $('.main-container__messages').animate({ scrollTop: $('.main-container__messages')[0].scrollHeight});
//     return false
//   })
//   .fail(function(){
//     alert('エラー');
//   })

//     $('#photo_upload').change(function(e){
//       var files = e.target.files;
//       e.preventDefault();
//       var count_images = $('.sell-content__upload__wrap__preview__img').length; // 初期で表示されている画像の枚数をカウント
//       if (count_images == 5){//写真が5枚の時はファイルフィールドを隠す
//         $('.image-input-field').hide();
//       } 
//       if (count_images+files.length > 5) {
//         alert("画像のアップロードは5個までです");
//         $('#photo_upload').val(""); // アップロードされた中身をリセット
//       }else if (count_images+files.length == 5){
//           // files = e.dataTransfer.files;
//           // 配列にして管理
//           for (var i=0; i<files.length; i++) {
//             file_array.push(files[i]);
//             // ファイル読み込み
//             const reader = new FileReader();
//             reader.onload = function (e) {
//             // URLを読み込み
//             var imageUrl = e.target.result;
//             $('#previewUpload').append(previewImage(imageUrl))
//           };
//           // フォールバック処理
//           reader.readAsDataURL(files[i]);
//           };
//           $('.sell-content__upload__wrap__box').remove();
//       }else{
//         for (var i=0; i<files.length; i++) {
//           file_array.push(files[i]);
//           const reader = new FileReader();
//           reader.onload = function (e) {
//           var imageUrl = e.target.result;
//           $('#previewUpload').append(previewImage(imageUrl))
//         };
//         reader.readAsDataURL(files[i]);
//         };
//         $('#photo_upload').hide();
//         $('.image-input-field').prepend(newInput());
//       }
//     });
