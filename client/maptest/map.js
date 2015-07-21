
Template.map.helpers({
  exampleMapOptions: function() {
    // Make sure the maps API has loaded
    if (GoogleMaps.loaded()) {
      // Map initialization options
      return {
        center: new google.maps.LatLng(-37.8136, 144.9631),
        zoom: 8
      };
    }
  }
});

Template.map.events({
  "click #whereami" : function(){
    var latlng = Geolocation.currentLocation().coords;
    GoogleMaps.maps.exampleMap.instance.setCenter(new google.maps.LatLng(latlng.latitude, latlng.longitude))
    GoogleMaps.maps.exampleMap.instance.setZoom(10)
  }
});