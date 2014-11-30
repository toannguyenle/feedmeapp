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
    .state('signin', {
      url: '/signin',
      templateUrl: 'signin.html',
      controller: 'HomeCtrl'
    })
    .state('order', {
      url: '/order',
      templateUrl: 'order.html',
      controller: 'HomeCtrl'
    });
}]);