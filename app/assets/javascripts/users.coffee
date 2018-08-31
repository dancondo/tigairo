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
