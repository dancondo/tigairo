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

  if $(trigger).hasClass('post-collapse')

    container = $(trigger.closest('.post-container'))
    container.toggleClass('focus-container')

    contentBox = container.children('.content-box')
    contentBox.toggleClass('plain')

$('.collapsable').click -> Collapser(this)
