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
    .state('restaurant', {
      url: '/restaurant',
      templateUrl: 'restaurant.html',
      controller: 'restaurantController'
    });
}])

// Building out controllers for index page
.controller('homeController',['$scope', function($scope){
  $scope.test = "homeController test!";
  
  // Add new ORDER
  $scope.addOrder = function(order){
    api.newOrder(order);
  }
}])

// Controller for users
.controller('userController',['$scope', function($scope){
  $scope.test = "userController test!";
}])

// Controller for products
.controller('productController', ['$scope', function($scope){
  $scope.test = "productController test!";
}])
// Controller for orders
.controller('orderController',['$scope', function($scope){
  $scope.test = "orderController test!";
}])

// Controllers for restaurants
.controller('restaurantController',['$scope', function($scope){
  $scope.test = "restaurantController test!";
}])

// SERVICE
.service('api',['$http', function($http){
  return {
    getOrder: function(){
      var promise = $http.get('/api/orders')
      .then(function(response){
        return response
      });
      return promise;
    },

    // CREATE ORDER
    newOrder: function(planetName, planetImage){
      $http.post('api/planets', {name: planetName, image: planetImage});
    },

    // EDIT ORDER
    editOrder: function(planet) {
      $http.patch('api/planets/' + planet._id.$oid, {name: planet.name, image: planet.image});
    }

  }
}])
;