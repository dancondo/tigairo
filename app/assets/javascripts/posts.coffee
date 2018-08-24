# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#### Image Preview

imagePreview = (input) ->
  if input.files and input.files[0]
    filerd = new FileReader()
    image = $('#imgpreview')
    box = $('.image-upload-box')
    box.addClass('post-image-box')
    filerd.onload = (event) ->
      image.css('display', 'block')
      image.attr('src', event.target.result)
    filerd.readAsDataURL(input.files[0])

$('.file-input').on "change", -> imagePreview(this)

#### Collapser

## $background-gray: #F4F5F3;

Collapser = (trigger) ->
  collapsableContent = $($(trigger).data("target"))
  collapsableContent.toggleClass('show-content')
  container = $(trigger.closest('.post-container'))
  container.toggleClass('focus-container')

$('.collapsable').click -> Collapser(this)
