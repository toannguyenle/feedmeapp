// Controller for products
app.controller('ProductController', ['$scope','api', function($scope, api){
  // Show Products
  api.getProduct()
  .then(function(data){
    $scope.products = data.data;
  });
  // Add new Product
  $scope.addProduct = function(product){
    api.addProduct(product);
  };
}]);