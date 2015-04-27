# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).on 'shown.bs.modal', ->
  $('.datetime-picker').datetimepicker({
    showTodayButton: true,
    sideBySide: true,
    format: 'MMMM Do, h:mm A'
  })