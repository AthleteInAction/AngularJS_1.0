var App = angular.module('App',['ngRoute','ngResource','ngSanitize','ui.bootstrap']);
App.value('$anchorScroll',angular.noop);
App.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){

	// html5Mode: true;

	// $routeProvider.when('/home',{
	// 	templateUrl : '/angularjs/templates/home.html',
	// 	controller: HomeCtrl
	// }).otherwise({
	// 	redirectTo: '/home'
	// });
	
}]);