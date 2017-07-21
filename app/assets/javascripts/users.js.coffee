# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(->
  ava = ''
  $(document).on 'click', '.avatar-thumb', ->
    ava = $(this)
    $('#avatar').hide().html($(this).data('big')).slideDown(300)
  $(document).on 'click', '.avatar-medium', ->
    $('#avatar').hide().html(ava).slideDown(300)
)