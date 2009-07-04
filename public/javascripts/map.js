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
    if ( arguments.length == 0 ) {
      myImage.src = '/images/default.jpg';
    } else {
      myImage.src = '/images/' + arguments[0] + '.jpg';
    }
    myImage.size = new YSize(25,25);
    myImage.offsetSmartWindow = new YCoordPoint(12,25);
    return myImage;
  }

  function addMarker(geoPoint, options) {
    options = options || {};
    if ( options.newSpot ) {
      var image = createCustomMarkerImage('selected');
    } else {
      var image = createCustomMarkerImage();
    }

    var newMarker = new YMarker(geoPoint, image);
    newMarker.addAutoExpand(options.name);
    var markerMarkup = options.tags;

    self.map.addOverlay(newMarker);

    return newMarker;
  }


  function createMarkerCallback(_e, _c){  
    var currentGeoPoint = new YGeoPoint( _c.Lat, _c.Lon);  
    if ( self.newMarker === undefined ) {
      self.newMarker = addMarker(currentGeoPoint, { newSpot: true });  
    } else {
      self.newMarker.setYGeoPoint(currentGeoPoint);
    }
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

  this.setNewSpotMode = function() {
    YEvent.Capture(self.map, EventsList.MouseClick, createMarkerCallback);
  }

  this.unsetNewSpotMode = function() {
    YEvent.Remove(self.map, EventsList.MouseClick, createMarkerCallback);
  }

  if ( ZealotSpots != null ) {
    addSpots(ZealotSpots);
  }

  return this;
})();
