var myApp = angular.module('myApp', ['ngView','ngResource', 'ui.bootstrap']);

angular.module('ngView', [], function($routeProvider, $locationProvider) {
  $routeProvider.when('/', {controller: 'WelcomeCtrl',  templateUrl: 'welcome.html'});
  $routeProvider.when('/bookmark-list', {controller: 'BookMarkCtrl', templateUrl: 'bookmark-list.html'});
  $routeProvider.when("/bookmark-edit", {controller: 'BookMarkEditCtrl', templateUrl: 'bookmark-edit.html'});
  $routeProvider.when("/bookmark-edit/:id", {controller: 'BookMarkEditCtrl', templateUrl: 'bookmark-edit.html'});
});

myApp.factory('bookmarkStorage', function($rootScope, $resource){
  return {
  	BookMarkResource: $resource('./api/bookmarks/:id', {}, {update:{method:'PUT'}})
  }
});