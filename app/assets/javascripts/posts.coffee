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

Collapser = (trigger) ->
  collapsableContent = $($(trigger).data("target"))
  collapsableContent.slideToggle('slow')

  container = $(trigger.closest('.post-container'))
  container.toggleClass('focus-container')

  contentBox = container.children('.content-box')
  contentBox.toggleClass('plain')

$('.collapsable').click -> Collapser(this)

#### CloseDrop

$('html').click ->
  $(".reactions-container").hide()
  $('.trigger-buttons').css('opacity', '1')
$('.post-extras').click (e) -> e.stopPropagation()

#### Dropup

DropUp = (trigger) ->
  dropContent = $($(trigger).data("target"))
  console.log(dropContent)
  dropContent.show()
  toHideArea = dropContent.closest('.post-extras')
  toHideArea.children('.trigger-buttons').css('opacity', '0')

$('.reactions-toggler').on "click", -> DropUp(this)

