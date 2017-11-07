(function ($) {
    $.fn.serializeFormJSON = function () {

        var o = {};
        var a = this.serializeArray();
        $.each(a, function () {
            if (o[this.name]) {
                if (!o[this.name].push) {
                    o[this.name] = [o[this.name]];
                }
                o[this.name].push(this.value || '');
            } else {
                o[this.name] = this.value || '';
            }
        });
        return o;
    };
})(jQuery);

var CategoryListApi ="/api/getCategory/";
var GetProductApi ="/api/getProduct/";
var CheckOutApi ="/api/checkout/";
var RegistrationApi ="/api/registration/";
var LoginApi ="/api/login/";
var GetUserApi ="/api/getUser/";


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
	$scope.checkout_confirm  = false;
	$scope.checkout = function()
	{
		if($scope.cartnums ==0)
		{
			$( "#dialog p").text(js_cart_num_is_zero); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
					  }
					}
				]
			});
			return false;
		}
		if($scope.checkout_confirm ==false)
		{
			$( "#dialog p").text( js_cart_checkout_confirm ); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "Ok",
					  click: function() {
						$( this ).dialog( "close" );
						$scope.checkout_confirm = true;
						$scope.checkout();
					  }
					},
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
					  }
					},
				]
			});
			return false;
		}
		
		if($scope.ischeckout !=true)
		{
			var shopcart =  $cookies.getObject('shopcart');
			postdata ={
				order_list : shopcart
			};
			$scope.ischeckout = true;
			$.ajax({
				// async: false,
				type: 'POST',
				dataType: 'json',
				url: CheckOutApi,
				data: JSON.stringify(postdata),
				contentType: "application/json",
				success: function (data) {
					$scope.ischeckout =false ;
					if(data.status =="200")
					{
						$cookies.remove('shopcart', {path: '/'});
						$( "#dialog p").text(js_cart_checkout_ok); 
						$( "#dialog" ).dialog({
							buttons: [
								{
								  text: "close",
								  click: function() {
									$( this ).dialog( "close" );
									window.location.href="/";
								  }
								}
							]
						});
					}else{
						
					}
				},
				error: function (data) {
					
				}
			});
			
		}else
		{
			$( "#dialog p").text( js_cart_ischeckout ); 
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

var loginCtrl = function($scope, $cookies, $rootScope){
	$scope.user = false;
	$scope.register = function()
	{
		if($scope.password_confirm !=$scope.password)
		{
			var obj = {
				message :js_login_password_confirm
			}
			dialog(obj);
			return false;
		}
		postdata = $('#Register').serializeFormJSON();
		$.ajax({
			// async: false,
			type: 'post',
			dataType: 'json',
			url: RegistrationApi,
			data: JSON.stringify(postdata),
			contentType: "application/json",
			success: function (data) {
				$scope.ischeckout =false ;
				if(data.status =="200")
				{
					var obj = {
						message :js_user_registration_ok
					}
					dialog(obj)
				}else{
					var obj = {
						message :data.message
					};
					dialog(obj)
				}
			},
			error: function (data) {
				var obj = {
						message :js_login_password_confirm
				}
				dialog(obj)
			}
		});
		
	}
	
	$scope.doLogin = function()
	{
		postdata = $('#Loginfrm').serializeFormJSON();
		$.ajax({
			// async: false,
			type: 'post',
			dataType: 'json',
			url: LoginApi,
			data: JSON.stringify(postdata),
			contentType: "application/json",
			success: function (data) {
				$scope.ischeckout =false ;
				if(data.status =="200")
				{
					$scope.user = data['body']['user'];
					var obj = {
						message :js_user_login_ok,
						buttons: [
						{
						  text: "ok",
						  click: function() {
							$( this ).dialog( "close" );
							location.href="/";
						  }
						}]
					};
					dialog(obj);
				}else{
					var obj = {
						message :data.message
					};
					dialog(obj)
				}
			},
			error: function (data) {
				var obj = {
						message :js_user_login_error
				}
				dialog(obj)
			}
		});
	}
}


var bodyCtrl = function($scope, $cookies, $rootScope)
{
	$scope.logout = function()
	{
		alert('e');
	}
	$.ajax({
		// async: false,
		type: 'get',
		dataType: 'json',
		url: GetUserApi,
		success: function (data) {
			$scope.ischeckout =false ;
			if(data.status =="200")
			{
				$scope.user = data['body']['user'];
			}
		},
		error: function (data) {
			var obj = {
					message :js_login_password_confirm
			}
			dialog(obj)
		}
	});
}

sihaliveApp.controller('categoryCtrl', categoryCtrl);
sihaliveApp.controller('navCtrl',  ['$scope', '$cookies', '$rootScope', navCtrl]);
sihaliveApp.controller('productPageCtrl',  ['$scope', '$cookies','$rootScope', productPageCtrl]);
sihaliveApp.controller('shopCartCtrl',  ['$scope', '$cookies', '$rootScope', shopCartCtrl]);
sihaliveApp.controller('loginCtrl',  ['$scope', '$cookies', '$rootScope', loginCtrl]);
sihaliveApp.controller('bodyCtrl',  ['$scope', '$cookies', '$rootScope', bodyCtrl]);


function dialog(object2)
{
	if(typeof object2 !="object")
	{
		object2 ={};
	}
	var  object1 ={
		buttons: [
			{
			  text: "close",
			  click: function() {
				$( this ).dialog( "close" );
			  }
			}
		]
	};
	$.extend( object1, object2 );
	$( "#dialog p").text(object1.message); 
	$( "#dialog" ).dialog(object1);
}

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
