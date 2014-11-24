angular.module('feedmeApp')
.controller('HomeCtrl',['$location','$scope','api', function($location, $scope, api){
  // Auto Complete
  var placeSearch, autocomplete;
  var userAddress = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    postal_code: 'short_name',
    country: 'long_name'
  };

  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

    // Get each component of the address from the place details
    // and fill the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
      var addressType = place.address_components[i].types[0];
      if (userAddress[addressType]) {
        var val = place.address_components[i][userAddress[addressType]];
        userAddress[addressType] = val;
      }
    }
  }
  // Create the autocomplete object, restricting the search
  // to geographical location types.
  autocomplete = new google.maps.places.Autocomplete((document.getElementById('userLocation')),
      { types: ['geocode'] });
  // When the user selects an address from the dropdown,
  // populate the address fields in the form.
  google.maps.event.addListener(autocomplete, 'place_changed', function() {
    fillInAddress();
  });


  // Get user's coordinates
  $scope.getLocation = function(){
    var x = document.getElementById("userLocation");
    if (navigator.geolocation){
      navigator.geolocation.getCurrentPosition(showPosition);
    } else { 
      x.value = "Geolocation is not supported by this browser.";
    }

    function showPosition(position) {
      // Convert Geocode into physical adddress for OrdrIn search
      var lat = position.coords.latitude;
      var lng = position.coords.longitude;
      geocoder = new google.maps.Geocoder();
      var latlng = new google.maps.LatLng(lat, lng);
      geocoder.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            x.value = results[1].formatted_address;
          }
        } else {
          alert("Address lookup failed due to: " + status);
        }
      });
    }

  };


  // Send parameter back
  $scope.searchFood = function(price){
    api.getProduct(userAddress, price)
    .then(function(data){
      $scope.products = data.data;
    })
  };

  //Get all the products to display
  $scope.getProduct = function(){
    api.getProduct()
    .then(function(data){
      $scope.products = data.data;
    })
  };
  
  //Order the item
  $scope.orderProduct = function(item){
    // Push item into client's side basket
    $scope.current_order.push(item);
    // Update database
    api.orderProduct(item);
  };


}]);