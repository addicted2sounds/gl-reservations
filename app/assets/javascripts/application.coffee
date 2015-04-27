#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require moment
#= require bootstrap-datetimepicker
#= require bootstrap.modal-form.js
#= require_tree .
# require turbolinks
$(document).on 'ready', ->
  $('#ajax-modal').modalForm()
  console.log('1')
  $(document).off('page:change')

