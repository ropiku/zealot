(function() {
  console.log('pulamea');
  var map = new YMap($('#map')[0]);
  map.setMapType(YAHOO_MAP_REG);
  map.drawZoomAndCenter("Bucharest", 3);
})();
