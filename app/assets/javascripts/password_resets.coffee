password_reset = ->
  $('#password-reset').on('ajax:error', (event, xhr) ->
    $('#error-explanation').removeClass('hide').show()
    errors = JSON.parse(xhr.responseText).errors
    $.each(errors, (k, v) ->
      $('#error-explanation p').append(v)
      $('.reset-email').addClass('has-error')
    )
  )
  .on('ajax:success', ->
    $('#error-explanation').hide()
    $('#error-explanation p').empty()
    $('.reset-email').removeClass('has-error')
  )
  .on('ajax:before', ->
    $('#error-explanation').hide()
    $('#error-explanation p').empty()
    $('.reset-email').removeClass('has-error')
  )

$(document).ready(password_reset)
$(document).on('page:load', password_reset)
