angular.module('feedmeApp')
// Building out controllers for index page
.controller('homeController',['$scope','api', function($scope, api){
  $scope.test = "homeController test!";
  // Add new ORDER
  $scope.addOrder = function(order){
    api.newOrder(order);
  }
}]);