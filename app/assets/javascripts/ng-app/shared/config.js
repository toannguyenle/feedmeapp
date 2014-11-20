var app = angular.module('feedmeApp')

app.config(['$stateProvider','$urlRouterProvider', function($stateProvider,$urlRouterProvider) {
  // $locationProvider.html5Mode({enabled:true, requiredBase:true});
  $urlRouterProvider.otherwise('/');

  $stateProvider

    .state('home', {
      url:'/',
      templateUrl:'home.html',
      controller: 'HomeController'
    })
    .state('options', {
      url: '/options',
      templateUrl: 'show_options.html',
      controller: 'HomeController'
    })
    .state('order', {
      url: '/order/new',
      templateUrl: 'new_order.html',
      controller: 'OrderController'
    })
    .state('user', {
      url: '/user',
      templateUrl: 'user.html',
      controller: 'UserController'
    })
    .state('product', {
      url: '/product',
      templateUrl: 'product.html',
      controller: 'ProductController'
    })
    .state('newProduct', {
      url: '/product/new',
      templateUrl: 'new_product.html',
      controller: 'ProductController'
    })
    .state('restaurant', {
      url: '/restaurant',
      templateUrl: 'restaurant.html',
      controller: 'RestaurantController'
    })
    .state('newRestaurant', {
      url: '/restaurant/new',
      templateUrl: 'new_restaurant.html',
      controller: 'RestaurantController'
    });
}]);