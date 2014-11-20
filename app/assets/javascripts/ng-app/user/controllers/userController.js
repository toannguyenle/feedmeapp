angular.module('feedmeApp', ['ui.router', 'templates'])
// Controller for users
.controller('userController',['$scope','api', function($scope, api){
  $scope.test = "userController test!";
}]);
