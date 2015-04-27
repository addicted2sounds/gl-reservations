#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require moment
#= require bootstrap-datetimepicker
#= require bootstrap.modal-form.js
#= require turbolinks
#= require_tree .
$(document).on 'page:change', ->
  $('#ajax-modal').modalForm()
  $(document).off('page:change')

