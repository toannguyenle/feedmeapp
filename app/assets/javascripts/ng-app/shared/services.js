angular.module('feedmeApp')

.service('api',['$http', function($http){
  return {

    // New User
    newUser: function(){

    },



    getOrder: function(){
      var promise = $http.get('/api/orders')
      .then(function(response){
        return response;
      });
      return promise;
    },

    // CREATE ORDER
    newOrder: function(planetName, planetImage){
      $http.patch('/api/orders', {name: planetName, image: planetImage});
    },

    // EDIT ORDER
    editOrder: function(planet){
      $http.patch('/api/orders/' + planet._id.$oid, {name: planet.name, image: planet.image});
    },

    // GET PRODUCT
    getProduct: function(userAddress, budget){
<<<<<<< HEAD:app/assets/javascripts/ng-app/shared/services.js
      // console.log(userAddress);
      var ordrin_params = {
        ordrin_zip: userAddress.postal_code,
        ordrin_city: userAddress.locality,
        ordrin_addr: (userAddress.street_number + ' ' + userAddress.route),
        ordrin_budget: budget,
        ordrin_lat: userAddress.lat,
        ordrin_lng: userAddress.lng };

        console.log(ordrin_params);
        
      var promise = $http.post('/api/products/', ordrin_params)
=======
      console.log(userAddress, budget);
      var promise = $http.post('/products/', {ordrin: {ordrin_zip: userAddress.postal_code, ordrin_city: userAddress.locality, ordrin_addr: (userAddress.street_number + ' ' + userAddress.route), ordrin_budget: budget}})
>>>>>>> 61518af2413fc1ff257267631a347033d7dbc475:app/assets/javascripts/ng-app/home/shared/services.js
      .then(function(response){
        return response;
      });
      return promise;
    },
    // ADD PRODUCT
    addProduct: function(product){
      $http.post('/api/products', {
        name: product.name,
        categories: product.categories,
        description: product.description,
        image_urls: product.image_urls,
        regular_price: product.regular_price,
        discount_price: product.discount_price,
        discount_start_time: product.discount_start_time,
        discount_end_time: product.discount_end_time,
        discount_inventory: product.discount_inventory});
    },

    // GET RESTAURANT
    getRestaurant: function(){
      var promise = $http.get('/api/restaurants')
      .then(function(response){
        return response;
      });
      return promise;
    },
    // ADD RESTAURANT
    addRestaurant: function(restaurant){
      $http.post('/api/restaurants', {
        name: restaurant.name,
        website: restaurant.website,
        phone_number: restaurant.phone_number,
        address: restaurant.address,
        yelp_id: restaurant.yelp_id,
        image_url: restaurant.image_url,
        categories: restaurant.categories,
        lat: restaurant.lat,
        lng: restaurant.lng});
    }

  }
}]);