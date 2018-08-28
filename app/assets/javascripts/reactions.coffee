#### CloseDrop

$('html').click ->
  $(".reactions-container").hide()
  $('.trigger-buttons').css('opacity', '1')
$('.trigger-buttons').click (e) -> e.stopPropagation()

#### Dropup

DropUp = (trigger) ->
  dropContent = $($(trigger).data("target"))
  dropContent.show()
  toHideArea = dropContent.closest('.post-extras')
  toHideArea.children('.trigger-buttons').css('opacity', '0')

$('.reactions-toggler').on "click", -> DropUp(this)

