var productsData = [];
var userLatLng = "";
angular.module('feedmeApp')
.controller('HomeCtrl',['$location','$scope','api', function($location, $scope, api){
  // GOOGLE MAPS AUTO COMPLETE AND PLACES LOOKUP
  // Auto Complete
  var placeSearch, autocomplete;
  var userLocation = {
    street_number: 'short_name',
    route: 'long_name',
    locality: 'long_name',
    administrative_area_level_1: 'short_name',
    postal_code: 'short_name',
    country: 'long_name',
    lat: 'NA',
    lng: 'NA'
  };


  function fillInAddress() {
    // Get the place details from the autocomplete object.
    var place = autocomplete.getPlace();

    // Get each component of the address from the place details
    // and fill the corresponding field on the form.
    for (var i = 0; i < place.address_components.length; i++) {
        var addressType = place.address_components[i].types[0];
      if (userLocation[addressType]) {
        var val = place.address_components[i][userLocation[addressType]];
        userLocation[addressType] = val;
      }
    }
  }
  // Create the autocomplete object, restricting the search
  // to geographical location types.
  if (document.getElementById('userLocation')) {
    autocomplete = new google.maps.places.Autocomplete((document.getElementById('userLocation')),
        { types: ['geocode'] });
    // When the user selects an address from the dropdown,
    // populate the address fields in the form.
    google.maps.event.addListener(autocomplete, 'place_changed', function() {
      fillInAddress();
    });
  }


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
      userLocation.lat = lat;
      userLocation.lng = lng;
      // Store to display in map
      userLatLng.lat = lat;
      userLatLng.lng = lng;
      
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

// r.addr, r.cs_contact_phone, r.latitude, r.longitude, r.menu (each do item as i, i.descrip, i.id,
 // i.is_orderable, i.name, i.price, r.restaurant_id, r.name, r.services

  // Send parameter back
  $scope.searchFood = function(price){
    // Reset the search result
    productsData = [];
    // Make an api call back to server to call ORDRIN for data
    api.getProduct(userLocation, price)
    .then(function(data){
      // Data Manipulation with results from API call
      restaurant = data.data;
      for (i=0; i < data.data.length; ++i){
        var item = {};
        // Ordr.in restaurant ID
        item.restaurantId = restaurant[i].restaurant_id;
        item.csContactPhone = restaurant[i].cs_contact_phone;
        item.latitude = restaurant[i].latitude;
        item.longitude = restaurant[i].longitude;
        item.restaurantName = restaurant[i].restaurant_name;
        // Delivery time
        item.deliveryTime = restaurant[i].del;
        // Minimum order amount
        item.minimumAmount = restaurant[i].mino;
        // Type of cuisine
        item.cuisine = restaurant[i].cu;
        
        // Get the menu item
        for (j=0; j < restaurant[i].menu.length; j++) {

          // Item categories
          item.categories = restaurant[i].menu[j].name;

          if (restaurant[i].menu[j].children != null ){
            for (k=0; k < restaurant[i].menu[j].children.length; k++) {
              // Add more detailed description
              item.descrip = restaurant[i].menu[j].children[k].descrip;
              item.name = restaurant[i].menu[j].children[k].name;
              item.price = restaurant[i].menu[j].children[k].price;
              item.isOrderable = restaurant[i].menu[j].children[k].is_orderable;
              // Item id is id for the whole group
              item.ordrnId = restaurant[i].menu[j].children[k].id;
              // Get the extra options only if the item has it
              if (restaurant[i].menu[j].children[k].children != null ){
                var orderOptions = [];
                for (h=0; h < restaurant[i].menu[j].children[k].children[0].children.length; h++) {
                  var option = {};
                  option.name = restaurant[i].menu[j].children[k].children[0].children[h].name;
                  option.id = restaurant[i].menu[j].children[k].children[0].children[h].id;
                  option.price = restaurant[i].menu[j].children[k].children[0].children[h].price;
                  option.descrip = restaurant[i].menu[j].children[k].children[0].children[h].descrip;
                  orderOptions.push(option);
                }
                item.orderOptions = orderOptions;
              }

              // Add item to list
              productsData.push(item);
            }
          }
        }
        // Push the item into scope
      }
      // Turn modal off
      document.getElementsByTagName("div")[document.getElementsByTagName("div").length - 1].setAttribute("class", "");
      document.body.className = document.body.className.replace("modal-open","");

      // Take me to the products page to show all my options
      $location.path('/products');
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