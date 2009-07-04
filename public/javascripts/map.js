var Zealot = {};

Zealot.Map = new (function() {
  var self = this;
  this.spots = [];

  this.map = new YMap($('#map')[0]);
  this.map.setMapType(YAHOO_MAP_REG);
  this.map.drawZoomAndCenter("Bucharest", 3);
  this.map.addZoomLong();  
  this.map.addPanControl();  


  function createCustomMarkerImage(){
    var myImage = new YImage();
    myImage.src = '/images/default.jpg';
    myImage.size = new YSize(25,25);
    myImage.offsetSmartWindow = new YCoordPoint(12,25);
    return myImage;
  }

  function addMarker(geoPoint, options) {
    options = options || {};
    var newMarker = new YMarker(geoPoint, createCustomMarkerImage());
    newMarker.addAutoExpand(options.name);
    var markerMarkup = options.tags;

    self.map.addOverlay(newMarker);

    return newMarker;
  }


  function createMarkerCallback(_e, _c){  
    var mapCoordCenter = map.convertLatLonXY(map.getCenterLatLon());  
    currentGeoPoint = new YGeoPoint( _c.Lat, _c.Lon);  
    addMarker(currentGeoPoint);  
  }

  function addSpots(spots) {
    var lspots = spots.length;
    for ( i = 0; i < lspots; i++ ) {
      spot = spots[i].spot;
      addSpot(spot);
    }
  }

  function addSpot(spot) {
    var latlng = new YGeoPoint(spot.latitude, spot.longitude);

    
    var marker = addMarker(latlng, spot);
    spot.marker = marker;

    self.spots.push(spot);
  }

  if ( ZealotSpots != null ) {
    addSpots(ZealotSpots);
  }

  return this;
})();
