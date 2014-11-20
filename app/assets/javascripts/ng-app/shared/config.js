angular.module('feedmeApp')
.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider){
  $urlRouterProvider.otherwise('/');

  $stateProvider
    .state('home', {
      url:'/',
      templateUrl:'index.html',
      controller: 'homeController'
    })
    .state('options', {
      url: '/options',
      templateUrl: 'show_options.html',
      controller: 'homeController'
    })
    .state('order', {
      url: '/order/new',
      templateUrl: 'new_order.html',
      controller: 'orderController'
    })
    .state('user', {
      url: '/user',
      templateUrl: 'user.html',
      controller: 'userController'
    })
    .state('product', {
      url: '/product',
      templateUrl: 'product.html',
      controller: 'productController'
    })
    .state('newProduct', {
      url: '/product/new',
      templateUrl: 'new_product.html',
      controller: 'productController'
    })
    .state('restaurant', {
      url: '/restaurant',
      templateUrl: 'restaurant.html',
      controller: 'restaurantController'
    })
    .state('newRestaurant', {
      url: '/restaurant/new',
      templateUrl: 'new_restaurant.html',
      controller: 'restaurantController'
    });
}])