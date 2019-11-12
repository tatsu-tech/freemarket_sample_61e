$(document).on('turbolinks:load', function() {
  $(function(){

    // プレビューHTML
    function previewImage(imageUrl){
      const previewHtml = 
      `<li>
      <img class="sell-content__upload__wrap__preview__img" src=${imageUrl}></li>`
      return previewHtml
    }

    // 新規input-field
    function newInputField(){
      const newInputHtml = 
      `<div class="sell-content__upload__wrap__preview">
      <ul class="dflex" id="previewUpload">
      </ul>
      </div>
      <div class="sell-content__upload__wrap__box" onclick="$('#photo_upload').click()">
      <div class="sell-content__upload__wrap__box__inner-text">
      クリックしてファイルをアップロード
      </div>
      </div>`
      return newInputHtml
    }

        // 新規input
        function newInput(){
          const inputhtml = 
          `<input multiple="multiple" accept="image/jpg,image/png" id="photo_upload" class="hidden" type="file" name="item[images][]">`
          return inputhtml
        }

    // 画像を管理するための配列
    var file_array = [];

    $('#photo_upload').change(function(e){
      var files = e.target.files;
      e.preventDefault();
      var count_images = $('.sell-content__upload__wrap__preview__img').length; // 初期で表示されている画像の枚数をカウント
      if (count_images == 5){//写真が5枚の時はファイルフィールドを隠す
        $('.image-input-field').hide();
      } 
      if (count_images+files.length > 5) {
        alert("画像のアップロードは5個までです");
        $('#photo_upload').val(""); // アップロードされた中身をリセット
      }else if (count_images+files.length == 5){
          // files = e.dataTransfer.files;
          // 配列にして管理
          for (var i=0; i<files.length; i++) {
            file_array.push(files[i]);
            // ファイル読み込み
            const reader = new FileReader();
            reader.onload = function (e) {
            // URLを読み込み
            var imageUrl = e.target.result;
            $('#previewUpload').append(previewImage(imageUrl))
          };
          // フォールバック処理
          reader.readAsDataURL(files[i]);
          };
          $('.sell-content__upload__wrap__box').remove();
      }else{
        for (var i=0; i<files.length; i++) {
          file_array.push(files[i]);
          const reader = new FileReader();
          reader.onload = function (e) {
          var imageUrl = e.target.result;
          $('#previewUpload').append(previewImage(imageUrl))
        };
        reader.readAsDataURL(files[i]);
        };
        $('#photo_upload').hide();
        $('.image-input-field').prepend(newInput());
      }
    });

  // プレビューをリセット
  $('.preview-reset').on('click', function(){
    $('.sell-content__upload__wrap__preview').remove(); //プレビューをリセット
    $('.sell-content__upload__wrap__box').remove();
    $('#photo_upload').val("");//アップロードされた内容をリセット
    $('.sell-content__upload__wrap').append(newInputField());
    $('.image-input-field').prepend(newInput());
    $('#photo_upload').hide();
  });

  });
});
