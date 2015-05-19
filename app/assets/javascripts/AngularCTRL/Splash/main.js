var App = angular.module('App',['APIModule','ngRoute','ngResource','ngSanitize','ui.bootstrap']);
App.value('$anchorScroll',angular.noop);
App.config(['$routeProvider','$locationProvider',function($routeProvider,$locationProvider){
	
	// html5Mode: true;
	
}]);