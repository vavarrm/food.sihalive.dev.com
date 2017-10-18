$(function() {
	
    // $( "#dialog" ).dialog();
 
	
	$('#nav-login').bind('click', function(e){
		e.preventDefault();
		$( "#dialog" ).dialog({
			width:'auto',
			resizable: false,
			modal: true,}
		).removeClass('hidden');
		// dialog.dialog( "open" );
	})

});

var CategoryListApi ="/api/getCategory/";



var sihaliveApp = angular.module('sihaliveApp', []);

var CategoryCtrl = function($scope, $http){
	$http.post(CategoryListApi,	[]).success(function(r) {
		// $scope.categorys =r.body.data;
		$scope.categorys =["1"];

	});
};

sihaliveApp.controller('CategoryCtrl', CategoryCtrl);