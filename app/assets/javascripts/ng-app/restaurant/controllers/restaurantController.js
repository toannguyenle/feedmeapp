// Controllers for restaurants
app.controller('RestaurantController',['$scope','api', function($scope, api){
  // Show RESTAURANTS
  api.getRestaurant()
  .then(function(data){
    $scope.restaurants = data.data;
  });
  // Add new RESTAURANT
  $scope.addRestaurant = function(restaurant){
    api.addRestaurant(restaurant);
  };
}]);