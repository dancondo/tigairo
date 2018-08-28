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

