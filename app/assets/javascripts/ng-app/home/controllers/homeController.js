angular.module('feedmeApp')
.controller('HomeCtrl',['$location','$scope','api', function($location, $scope, api){
  $scope.test = "homeController test!";
  // Add new ORDER
  $scope.addOrder = function(order){
    api.newOrder(order);
  };
}]);