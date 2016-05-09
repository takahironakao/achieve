$ ->
  $(window).scroll ->
    element = $('#page2-top-btn')
    visible = element.is(':visible')
    height = $(window).scrollTop()
    if height > 400
      element.fadeIn() if !visible
    else
      element.fadeOut()
  $('#move2-page-top').click ->
    $('html, body').animate({ scrollTop: 0 }, '1000')