password_reset = ->
  $('#password-reset').on('ajax:error', (event, xhr) ->
    $('#error-explanation').removeClass('hide').show()
    errors = JSON.parse(xhr.responseText).errors
    $('#error-explanation').append('<p>' + errors + '</p>')
    $('.reset-email').addClass('has-error')
  )
  .on('ajax:success', ->
    $('#error-explanation').hide()
    $('#error-explanation p').remove()
    $('.reset-email').removeClass('has-error')
  )
  .on('ajax:before', ->
    $('#error-explanation').hide()
    $('#error-explanation p').remove()
    $('.reset-email').removeClass('has-error')
  )

$(document).ready(password_reset)
$(document).on('page:load', password_reset)
