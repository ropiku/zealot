(function() {
  var map = new YMap($('#map')[0]);
  map.setMapType(YAHOO_MAP_REG);
  map.drawZoomAndCenter("Bucharest", 3);
  map.addZoomLong();  
  map.addPanControl();  


  function createCustomMarkerImage(){
    var myImage = new YImage();
    myImage.src = '/images/default.jpg';
    myImage.size = new YSize(25,25);
    myImage.offsetSmartWindow = new YCoordPoint(12,25);
    return myImage;
  }

  function addMarker(geoPoint) {
    var newMarker = new YMarker(geoPoint, createCustomMarkerImage());
    newMarker.addAutoExpand("Add a Label to a Marker for this Effect");
    var markerMarkup = "<b>You can add markup this</b>";
    markerMarkup += "<i> easy</i>";

    map.addOverlay(newMarker);
    console.log(geoPoint);
  }


  function createMarkerCallback(_e, _c){  
    var mapCoordCenter = map.convertLatLonXY(map.getCenterLatLon());  
    currentGeoPoint = new YGeoPoint( _c.Lat, _c.Lon);  
    addMarker(currentGeoPoint);  
  }

  function addSpots(spots) {
    var latlng;
    for ( spot in spots ) {
      latlng = new YGeoPoint(spot.latitude, spot.longitude);
      addMarker(latlng);
    }
  }

  YEvent.Capture(map, EventsList.MouseClick, createMarkerCallback);
  if ( ZealotSpots != null ) {
    addSpots(ZealotSpots);
  }
})();
