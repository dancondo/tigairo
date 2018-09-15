# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
changeFormTarget = (trigger) ->

  closeReply = (anchor) ->
    form = anchor.closest('form')
    form.attr('action', defaultPath)
    anchor.closest('.comment-reply').remove()

  prependForm = (target, path) ->
    target.attr('action', "comments/#{formTargetId}/comments")
    target.prepend("<div class='comment-reply'><div>Replying to <span>#{user}</span></div><div class='close-reply'><a data-default=#{path}>x</a></div></div>")

  if $('.close-reply').length > 0
    defaultPath = $('.close-reply').children('a').attr('data-default')
  else
    defaultPath = null
  $('.comment-reply').remove()
  container = trigger.closest('.comments-container')
  form = container.children('form')
  formTargetId = trigger.attr('data-id')
  user = trigger.attr('data-user')
  if defaultPath == null
    defaultPath = form.attr('action')
  prependForm(form, defaultPath)

  $('.close-reply').click -> closeReply($(this))

$('.comment-toggler').click -> changeFormTarget($(this))
