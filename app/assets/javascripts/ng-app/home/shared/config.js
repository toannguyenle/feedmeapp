angular.module('feedmeApp')
.config(['$stateProvider','$urlRouterProvider', function($stateProvider,$urlRouterProvider) {
  // Catch all route
  $urlRouterProvider.otherwise('/');

  // Define state
  $stateProvider
    .state('home', {
      url: '/',
      templateUrl: 'home.html',
      controller: 'HomeCtrl'
    })
    .state('products', {
      url: '/products',
      templateUrl: 'products.html',
      controller: 'HomeCtrl'
    })
    .state('maps', {
      url: '/maps',
      templateUrl: 'maps.html',
      controller: 'HomeCtrl'
    })
    .state('order', {
      url: '/order',
      templateUrl: 'order.html',
      controller: 'HomeCtrl'
    });
}]);