password_reset = ->
  $('#password-reset').on('ajax:error', (event, xhr) ->
    $('#error-explanation').removeClass('hide').show()
    errors = JSON.parse(xhr.responseText).errors
#    errors = xhr.responseText.errors
#    $.each(errors, (k, v) ->
#      $('#error-explanation').append('<p>' + v + '</p>')
#      $('.reset-email').addClass('has-error')
#    )
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
