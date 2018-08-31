# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#### Select2 in Form

$(".select2-tags").select2({
  language: "ja",
  placeholder: "留学先の国"
});

#### Profile Picture Submit

Submit = (input) ->
  input.closest('form').submit()

$('#user_photo').on "change", -> Submit(this)

#### Image Cropper

class Cropper
  constructor: (image) ->
    image.Jcrop
      aspectRatio: 1
      setSelect: [0, 0, 300, 300]
      onSelect: @update
      onChange: @update

  update: (coords) =>
    $('#user_crop_x').val(coords.x)
    $('#user_crop_y').val(coords.y)
    $('#user_crop_w').val(coords.w)
    $('#user_crop_h').val(coords.h)

new Cropper($('#cropbox'))
