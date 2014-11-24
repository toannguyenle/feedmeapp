angular.module('feedmeApp')
.controller('HomeCtrl',['$location','$scope','api', function($location, $scope, api){
  $scope.test = "homeController test!";
  // Add new ORDER
  $scope.getProduct = function(){
    api.getProduct()
    .then(function(data){
      $scope.products = data.data;
      console.log(data.data);
    })
  };
  
}]);