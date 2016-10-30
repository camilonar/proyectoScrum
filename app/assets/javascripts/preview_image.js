function chooseFile(){
  if ($("#proyecto_photo").length)
     $("#proyecto_photo").click();
  else if ($("#user_photo").length)
     $("#user_photo").click();
}
      function readURL(input) {
        if (input.files && input.files[0]) {
          var reader = new FileReader();

          reader.onload = function (e) {
            $('#img_prev')
              .attr('src', e.target.result);
          };

          reader.readAsDataURL(input.files[0]);
        }
      }