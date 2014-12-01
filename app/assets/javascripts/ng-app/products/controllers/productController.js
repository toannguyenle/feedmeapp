angular.module('feedmeApp')
.controller('ProductCtrl',['$location','$scope','api', function($location, $scope, api){
  // Send data back
  $scope.products = productsData;

  // Google Maps Heat Map
  var map,pointArray, heatmap;
  var foodMapData = [];
  for (i=0; i < productsData.length; i++) {
    newMapPoint = new google.maps.LatLng(productsData[i].latitude, productsData[i].longitude);
    foodMapData.push(newMapPoint);
  }

  var heatMap = function() {
    // If user did not use browser geolocation than use the closest restaurant location as map center
    // if (userLatLng == ""){
    //   userLatLng.lat = productsData[0].latitude;
    //   userLatLng.lng = productsData[0].longitude;
    // }
    var myMapStyle = [{"featureType":"water","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"landscape","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":17}]},{"featureType":"road.highway","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":29},{"weight":0.2}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":18}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":16}]},{"featureType":"poi","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":21}]},{"elementType":"labels.text.stroke","stylers":[{"visibility":"on"},{"color":"#000000"},{"lightness":16}]},{"elementType":"labels.text.fill","stylers":[{"saturation":36},{"color":"#000000"},{"lightness":40}]},{"elementType":"labels.icon","stylers":[{"visibility":"off"}]},{"featureType":"transit","elementType":"geometry","stylers":[{"color":"#000000"},{"lightness":19}]},{"featureType":"administrative","elementType":"geometry.fill","stylers":[{"color":"#000000"},{"lightness":20}]},{"featureType":"administrative","elementType":"geometry.stroke","stylers":[{"color":"#000000"},{"lightness":17},{"weight":1.2}]}];
    var mapOptions = {
      zoom: 14,
      center: new google.maps.LatLng(productsData[0].latitude, productsData[0].longitude),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      styles: myMapStyle
    };

    map = new google.maps.Map(document.getElementById('map-canvas'),
        mapOptions);

    var pointArray = new google.maps.MVCArray(foodMapData);

    heatmap = new google.maps.visualization.HeatmapLayer({
      data: pointArray
    });

    heatmap.setMap(map);
  }

  heatMap();
}]);