var dietRecall = angular.module('dietRecall', ['ui.bootstrap']);

function dietRecallRouteConfig($routeProvider) {
	var app_dir='/DietRecall/pages';
	$routeProvider.
	when('/', {
		controller: welcomeController,
		templateUrl: app_dir + '/welcome.html'
	}).
	when('/login', {
		controller: dashboardController,
		templateUrl: app_dir + '/dashboard.html'
	}).
	otherwise({
		redirectTo: '/'
	});
}

dietRecall.config(dietRecallRouteConfig);

function welcomeController($scope) {
	$scope.message = "Welcome to Diet Recall";
}

function dashboardController($scope) {
	$scope.message = "Welcome to Dashboard";
}