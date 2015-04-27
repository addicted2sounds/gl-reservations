#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require turbolinks
#= require moment
#= require bootstrap-datetimepicker
#= require bootstrap.modal-form.js
#= require_tree .
$(document).on 'ready', ->
  $('#ajax-modal').modalForm()