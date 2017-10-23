

var CategoryListApi ="/api/getCategory/";


var sihaliveApp = angular.module('sihaliveApp', ['ngCookies']);

var productPageCtrl = function($scope, $cookies, $rootScope){
	
	$scope.click = function(f_id) 
	{
		var  obj ={
			f_id : f_id,
			order_num  :  $('#order_num').val(),
			price: $('.resp-tab-item.resp-tab-active').find('.price').data('price')
		};
		var shopcart =  $cookies.getObject('shopcart');
		shopcart.push(obj);
		$cookies.putObject('shopcart', shopcart, { path: '/'});
		
		$rootScope.$broadcast('cartnumsChanged', $scope.cartnums);
	};
};

var categoryCtrl = function($scope, $http){
};

var shopCartCtrl = function($scope, $cookies, $rootScope){
	var shopcart =  $cookies.getObject('shopcart');
	$scope.items=shopcart;
	$scope.cartnums= shopcart.length;
	$scope.Total = function(filterAry){
		var total = 0;
		angular.forEach(filterAry, function(item){
			total += parseFloat(item.price,2);
		});
		return total.toFixed(2);
	};
	$scope.delete = function($index)
	{
		// $scope.items[$index].s\=true;
		$scope.items.splice($index,1);
		$cookies.putObject('shopcart', $scope.items, { path: '/'});
		$scope.cartnums= $scope.items.length;
		$rootScope.$broadcast('cartnumsChanged', $scope.cartnums);
		// console.log(shopcart)
	}
};

var navCtrl = function($scope, $cookies, $rootScope){
	var shopcart =  $cookies.getObject('shopcart');
	if (typeof shopcart === "undefined") {
		shopcart =[];
		$cookies.putObject('shopcart', shopcart, { path: '/'});
	}
	$scope.data={
		num : shopcart.length
	};
	$scope.cartnums= shopcart.length;
	
    $rootScope.$on('cartnumsChanged', function(event, data){
        $scope.cartnums = $cookies.getObject('shopcart').length;
    })
};


sihaliveApp.controller('categoryCtrl', categoryCtrl);
sihaliveApp.controller('navCtrl',  ['$scope', '$cookies', '$rootScope', navCtrl]);
sihaliveApp.controller('productPageCtrl',  ['$scope', '$cookies','$rootScope', productPageCtrl]);
sihaliveApp.controller('shopCartCtrl',  ['$scope', '$cookies', '$rootScope', shopCartCtrl]);



$( "body" ).on( "click", ".stepper-arrow.up", function() {
	var input = $(this).parent().find('input');
	var max   =parseInt(input.attr('max'));
	var val   =parseInt(input.val());
	if(val > max)
	{
		return false;
	}
	input.val(val +1);
});

$( "body" ).on( "click", ".stepper-arrow.down", function() {
	var input = $(this).parent().find('input');
	var min   =parseInt(input.attr('min'));
	var val   =parseInt(input.val());
	if(val <= min)
	{
		return false;
	}
	input.val(val -1);
});
