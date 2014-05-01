$(document).ready(function () {
  $('.typeahead').typeahead({ prefetch: '/munis.json' });

  $('#start-planning').on('click', function () {
    $('html, body').animate({ scrollTop: 0 }, 'slow');
    $('input').focus();
  });
})