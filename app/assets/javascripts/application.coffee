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
#  $('[data-target="' + target + '"]').click (event)->
#    event.preventDefault()
##    xhr.setRequestHeader("X-Requested-With", "XMLHttpRequest")
#    url = $(this).data('href') || $(this).attr('href')
#    $.ajax
#      url: url,
#      dataType: 'script'