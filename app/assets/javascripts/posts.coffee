# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

imagePreview = (input) ->
  if input.files and input.files[0]
    filerd = new FileReader()
    image = $('#imgpreview')
    filerd.onload = (event) ->
      image.css('display', 'block')
      image.attr('src', event.target.result)
    filerd.readAsDataURL(input.files[0])

fileInput = $('.file-input').on "change", -> imagePreview(this)
