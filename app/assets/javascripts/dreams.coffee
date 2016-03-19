dream = ->
  $('.dream-btn').on('click', ->
    value = $('#dream-box-home-timeline').html()
    $('#content-param').val(value)
  )

  $('.navbar-dream-btn').on('click', ->
    $(this).blur()
    if($('#modal-overlay')[0])
      return false
    $('body').append('<div id="modal-overlay"></div>')
    $('#modal-overlay').fadeIn('slow')
    $('.modal-content').fadeIn('slow')
  )

  $(document).on('click', '#modal-close, #modal-overlay', ->
    $('#modal-overlay').fadeOut('slow')
    $('.modal-content').fadeOut('slow')
    $('#modal-overlay').remove()
  )

#  centeringModalSyncer = ->
#    w = $(window).width()
#    h = window.innerHeight
#    cw = $('.modal-content').outerWidth({margin: true})
#    ch = $('.modal-content').outerHeight({margin: true})
#    pxleft = ((w - cw) / 2)
#    pxtop = ((h - ch) / 2)
#    $('.modal-content').css({"left": pxleft + "px"})
#    $('.modal-content').css({"top": pxtop + "px"})
#
#  $(window).resize(centeringModalSyncer)

$(document).ready(dream)
$(document).on('page:load', dream)