angular.module('feedmeApp')
.controller('ProductCtrl',['$location','$scope','api', function($location, $scope, api){
  // feedmeApp.Product
  $scope.products = feedmeAppProduct.data;
}]);