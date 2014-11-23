angular.module('feedmeApp')
.config(['$stateProvider','$urlRouterProvider', function($stateProvider,$urlRouterProvider) {
  // Catch all route
  $urlRouterProvider.otherwise('/');

  // Define state
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home.html',
      controller: 'HomeCtrl'
    });
}]);