password_reset = ->
  $('#password-reset').on('ajax:error', (event, xhr) ->
    $('#new-error-message').removeClass('hide').show()
    errors = JSON.parse(xhr.responseText).errors
    $.each(errors, (k, v) ->
      $('#errors ul').append('<li>' + v + '</li>')
      $('#user_' + k).closest('.form-group').addClass('has-error')
    )
  )
  .on('ajax:success', ->
    $('#new-error-message').hide()
    $('#errors ul').empty()
    $('#new_user').find('.form-group').removeClass('has-error')
  )
  .on('ajax:before', ->
    $('#new-error-message').hide()
    $('#errors ul').empty()
    $('#new_user').find('.form-group').removeClass('has-error')
  )

$(document).ready(user)
$(document).on('page:load', user)
