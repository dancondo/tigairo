# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#### Sidebar

toggleBar = (trigger) ->
  navbar = $($(trigger).data("target"))
  navbar.toggle('slide', { direction: 'right'})
  $('body').toggleClass('no-flow')
  $('.overlay').toggle()


$('#navbar-toggle').on "click", -> toggleBar(this)
$('#navbar-close').on "click", -> toggleBar(this)
