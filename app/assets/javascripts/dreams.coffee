dream = ->
  $('.dream-btn').on('click', ->
    value = $('#dream-box-home-timeline').html()
    $('#content-param').val(value);
  )

$(document).ready(dream)
$(document).on('page:load', dream)
