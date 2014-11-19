angular.module('feedmeApp', ['ui.router', 'templates'])

.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider){
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url:'/',
      templateUrl:'index.html',
      controller: 'homeController'
    })
    .state('options', {
      url: '/options',
      templateUrl: 'show_options.html',
      controller: 'homeController'
    })
    .state('order', {
      url: '/order/new',
      templateUrl: 'new_order.html',
      controller: 'orderController'
    })
    .state('user', {
      url: '/user',
      templateUrl: 'user.html',
      controller: 'userController'
    })
    .state('product', {
      url: '/product',
      templateUrl: 'product.html',
      controller: 'productController'
    })
    .state('newProduct', {
      url: '/product/new',
      templateUrl: 'new_product.html',
      controller: 'productController'
    })
    .state('restaurant', {
      url: '/restaurant',
      templateUrl: 'restaurant.html',
      controller: 'restaurantController'
    })
    .state('newRestaurant', {
      url: '/restaurant/new',
      templateUrl: 'new_restaurant.html',
      controller: 'restaurantController'
    });
}])

// Building out controllers for index page
.controller('homeController',['$scope','api', function($scope, api){
  $scope.test = "homeController test!";
  // Add new ORDER
  $scope.addOrder = function(order){
    api.newOrder(order);
  }
}])

// Controller for users
.controller('userController',['$scope','api', function($scope, api){
  $scope.test = "userController test!";
}])

// Controller for products
.controller('productController', ['$scope','api', function($scope, api){
  // Show Products
  api.getProduct()
  .then(function(data){
    $scope.products = data.data;
  });
  // Add new Product
  $scope.addProduct = function(product){
    api.addProduct(product);
  }
}])
// Controller for orders
.controller('orderController',['$scope','api', function($scope, api){
  $scope.test = "orderController test!";
}])

// Controllers for restaurants
.controller('restaurantController',['$scope','api', function($scope, api){
  // Show RESTAURANTS
  api.getRestaurant()
  .then(function(data){
    $scope.restaurants = data.data;
  });
  // Add new RESTAURANT
  $scope.addRestaurant = function(restaurant){
    api.addRestaurant(restaurant);
  }
}])

// SERVICE
.service('api',['$http', function($http){
  return {

    getOrder: function(){
      var promise = $http.get('/api/orders')
      .then(function(response){
        return response;
      });
      return promise;
    },

    // CREATE ORDER
    newOrder: function(planetName, planetImage){
      $http.post('/api/orders', {name: planetName, image: planetImage});
    },

    // EDIT ORDER
    editOrder: function(planet){
      $http.patch('/api/orders/' + planet._id.$oid, {name: planet.name, image: planet.image});
    },

    // GET PRODUCT
    getProduct: function(){
      var promise = $http.get('/api/products')
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

