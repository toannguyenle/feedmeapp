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
    .state('restaurant', {
      url: '/restaurant',
      templateUrl: 'restaurant.html',
      controller: 'restaurantController'
    });
}])

// Building out controllers for index page
.controller('homeController',['$scope', function($scope){
  $scope.test = "homeController test!";
}])

// Controller for users
.controller('userController',['$scope', function($scope){
  $scope.test = "userController test!";
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
.service('api', function($http){
  return {
    getProducts: function(){
      var promise = $http.get('/api/orders')
      .then(function(response){
        return response
      });
      return promise;
    }
  }
})
;