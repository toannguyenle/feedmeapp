angular.module('feedmeApp')
// Controller for orders
.controller('orderController',['$scope','api', function($scope, api){
  $scope.test = "orderController test!";
}]);