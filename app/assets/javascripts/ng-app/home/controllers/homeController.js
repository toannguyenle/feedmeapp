var app = angular.module('feedmeApp')
// Building out controllers for index page
app.controller('HomeController',['$scope','api', function($scope, api){
  $scope.test = "homeController test!";

  // Add new ORDER
  $scope.addOrder = function(order){
    api.newOrder(order);
  };
}]);