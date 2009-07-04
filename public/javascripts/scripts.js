$('a[href=#new_spot]').click( function() {
  Zealot.Map.toggleNewSpotMode();
  $('#new_spot').toggle();
  return false;
});

$('#new_spot').submit( function() {
  Zealot.Map.saveNewSpot( function() {
    console.log(arguments);
    $('#new_spot').hide();
  })
  
  return false;
});

$('#new_spot input[type=reset]').click( function() {
  $('#new_spot').hide();
  Zealot.Map.unsetNewSpotMode();
})

$('#search_form').submit( function() {
  var term = document.getElementById('search_string').value;

  $.getJSON('/spots/search', "q="+term, function(data) {
    var matches = '';
    $.each(data, function(i, item) {
      matches += '<li><a href="#">' + item.spot.name + '</a>' + item.spot.rating + '</li>';
      matches += item.spot.latitude + ' - ' + item.spot.longitude;
    })

    $('#matches').html(matches);
  })
  return false;
});
