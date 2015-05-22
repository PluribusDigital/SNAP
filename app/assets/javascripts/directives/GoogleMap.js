var directives = angular.module('directives');

directives.directive("googleMap", ['MapInitializer', function (MapInitializer) {
  return {
    restrict: 'AE',
    link: function(scope, elem, attrs) {
      // Parse HTML attrs, set defaults
      var zoom        = Number(attrs.zoom) || 9;
      var showTraffic = (attrs.traffic === "true");
      var lat         = Number(attrs.lat) || 38.8976757; 
      var lng         = Number(attrs.lng) || -77.036528;
      // Set up map options
      var gmap = {
        areaName:   '',
        options: {
          center: { lat: lat, lng: lng },
          zoom: zoom,
          disableDefaultUI : true
        }
      }
      // draw the map
      MapInitializer.initialized.then(function(){
        gmap.map = new google.maps.Map(elem[0], gmap.options);
        if (showTraffic) {
          gmap.trafficLayer  = new google.maps.TrafficLayer();
          gmap.trafficLayer.setMap(gmap.map);
        }
      });
      
    }
  };
}]);