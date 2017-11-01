

var CategoryListApi ="/api/getCategory/";
var GetProductApi ="/api/getProduct/";
var CheckOutApi ="/api/checkout/";


var sihaliveApp = angular.module('sihaliveApp', ['ngCookies']);

var productPageCtrl = function($scope, $cookies, $rootScope){
	
	$scope.$watch("f_id", function(){
		$.ajax({
			async: false,
			type: 'GET',
			url: GetProductApi+'?f_id='+$scope.f_id,
			success: function (data) {
				$scope.food = data['body']['data'];
				$scope.selectprice= $scope.food['f_large_price'];
			},
			error: function (data) {
			}
		});

    });
	$scope.selectPrice = function(price, $event)
	{
		$scope.selectprice = price;
		$('.resp-tab-item.resp-tab-active').removeClass('resp-tab-active');
		// $($event).addClass('resp-tab-active');
	}
	
	$scope.click = function(f_id) 
	{	
		var  obj ={
			f_id : f_id,
			order_num  :  parseInt($('#order_num').val()),
			price: $scope.selectprice
		};
		var shopcart =  $cookies.getObject('shopcart');
		var isadd = false;
		$.each(shopcart, function(i,e){
			if(e.f_id == f_id)
			{
				isadd=true;
				$.extend( shopcart[i], obj );
				$cookies.putObject('shopcart', shopcart, { path: '/'});
			}else{
				isadd = false;
			}
		})
		if(!isadd)
		{
			shopcart.push(obj);
			$cookies.putObject('shopcart', shopcart, { path: '/'});
			$rootScope.$broadcast('cartnumsChanged', $scope.cartnums);
		}

		
		if($(document).width()<=1024)
		{
			$('.cartnums').removeClass('text-white').addClass('text-black');
		}else
		{
			$('.cartnums').removeClass('text-black').addClass('text-white');
		}
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
		$scope.items.splice($index,1);
		$cookies.putObject('shopcart', $scope.items, { path: '/'});
		$scope.cartnums= $scope.items.length;
		$rootScope.$broadcast('cartnumsChanged', $scope.cartnums);
	}
	$scope.ischeckout = false;
	$scope.checkout = function()
	{
		if($scope.cartnums ==0)
		{
			$( "#dialog p").text(cart_num_is_zero); 
			$( "#dialog" ).dialog();
		}
		if($scope.ischeckout !=true)
		{
			postdata ={};
			$scope.ischeckout = true;
			$.ajax({
				// async: false,
				type: 'POST',
				dataType: 'json',
				url: CheckOutApi,
				data: JSON.stringify(postdata),
				success: function (data) {
					console.log(data);
					$scope.ischeckout =false ;
				},
				error: function (data) {
					
				}
			});
			
		}else
		{
			$( "#dialog p").text( cart_ischeckout ); 
			$( "#dialog" ).dialog();
		}
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


$( "body" ).on( "click", ".stepper-arrow.up", function(e) {
	var input = $(this).parent().find('input');
	if($(input).hasClass( "ng-valid" ) ==false)
	{
		return false;
	}
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
	if($(input).hasClass( "ng-valid" ) ==false)
	{
		return false;
	}
	var min   =parseInt(input.attr('min'));
	var val   =parseInt(input.val());
	if(val <= min)
	{
		return false;
	}
	input.val(val -1);
});
