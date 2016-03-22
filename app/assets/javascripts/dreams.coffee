dream = ->
  $('.dream-btn').on('click', ->
    value = $('#dream-box-home-timeline').html()
    $('#content-param').val(value)
  )

  $('#dream_content').autosize()
  $('.selectpicker').selectpicker()

  $('#dream_content').keyup( ->
    if !$(this).val()
      $('.btn-warning').prop('disabled', true)
    else
      $('.btn-warning').prop('disabled', false)
  )

  $('.dream-box').keyup( ->
    if !$('#dream-box-home-timeline').html()
      $('.dream-btn').prop('disabled', true)
    else
      $('.dream-btn').prop('disabled', false)
  )

$(document).ready(dream)
$(document).on('page:load', dream)
