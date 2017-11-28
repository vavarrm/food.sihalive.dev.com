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
var LogoutApi ="/api/logout/";
var FBRegApi ="/api/fbReg/";
var FBLoginApi ="/api/fbLogin/";
var DeliveryPositionApi ="/api/getDeliveryPosition/";


var sihaliveApp = angular.module('sihaliveApp', ['ngCookies']);

sihaliveApp.factory('User',['$cookies' , function($cookies){
	var user={} ;
	var sess = $cookies.get('sess');
	if(sess !='')
	{
		$.ajax({
			async: false,
			type: 'get',
			dataType: 'json',
			url: GetUserApi+'?sess='+sess ,
			success: function (data) {
				if(data.status =="200")
				{
					user = data['body']['user_data'];
					// console.log(user);
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
	return user;
}])

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
	}
	
	$scope.click = function(f_id) 
	{	
		var  obj ={
			f_id : f_id,
			order_num  :  parseInt($('#order_num').val()),
			price: $scope.selectprice,
			f_name:$scope.food.f_name
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

var shopCartCtrl = function($scope, $cookies, $rootScope, User){
	var shopcart =  $cookies.getObject('shopcart');
	
	$scope.items=shopcart;
	$scope.cartnums= shopcart.length;
	
	$scope.mapinit = function()
	{	
		$.ajax({
			async: false,
			type: 'GET',
			dataType: 'json',
			url: DeliveryPositionApi,
			contentType: "application/json",
			success: function (data) {
				$scope.positions = data['body']['data']['positions'];
				// console.log($scope.positions);
			},
			error: function (data) {
				
			}
		});
	}
	$scope.Total = function(filterAry){
		var total = 0;
		angular.forEach(filterAry, function(item){
			total += parseFloat(item.subtotal,2);
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

		if(typeof User.u_id == 'undefined')
		{
			$( "#dialog p").text(js_please_login); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
						location.href="/Login/";
					  }
					}
				]
			});
			return false;
		}
		
		
		if($('input[name=o_consignee]').val() =="")
		{
			$( "#dialog p").text(js_o_consignee_empty); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
						$('input[name=o_consignee]').focus();
					  }
					}
				]
			});
			return false;
		}
		
		if($('input[name=o_phone]').val() =="")
		{
			$( "#dialog p").text(js_o_phone_empty); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
						$('input[name=o_phone]').focus();
					  }
					}
				]
			});
			return false;
		}
		
		if($('#message').val() =="")
		{
			$( "#dialog p").text(js_o_messge_empty); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
						$('#message').focus();
					  }
					}
				]
			});
			return false;
		}	
		
		if($('#o_position_id').val() =="")
		{
			$( "#dialog p").text(js_o_messge_empty); 
			$( "#dialog" ).dialog({
				buttons: [
					{
					  text: "close",
					  click: function() {
						$( this ).dialog( "close" );
						$('#message').focus();
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
			// console.log(shopcart);
			angular.forEach($('input[data-index]'), function(item, index){
				shopcart[index].order_num = $(item).val();
			})
			postdata ={
				order_list : shopcart,
				'o_consignee'	: $('input[name=o_consignee]').val(),
				'o_phone'	: $('input[name=o_phone]').val(),
				'o_message'	: $('#message').val(),
				'o_position_id'	: $('#o_position_id').val()
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
						$( "#dialog p").text( js_cart_checkout_error ); 
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
	$scope.cartnums= shopcart.length;
    $rootScope.$on('cartnumsChanged', function(event, data){
        $scope.cartnums = $cookies.getObject('shopcart').length;
    })
	
	$scope.setLanguage = function(lang)
	{
		$cookies.put('language', lang, { path: '/'});
		window.location.reload();
	}
};

var loginCtrl = function($scope, $cookies, $rootScope){
	$scope.user = false;
	$scope.register = function()
	{
		if($scope.u_passwd_confirm !=$scope.u_passwd)
		{
			var obj = {
				message :js_login_password_confirm
			}
			dialog(obj);
			return false;
		}
		var postdata = $('#Register').serializeFormJSON();
		$.ajax({
			// async: false,
			type: 'post',
			dataType: 'json',
			url: RegistrationApi,
			data: JSON.stringify(postdata),
			contentType: "application/json",
			success: function (data) {
				if(data.status =="200")
				{
					$scope.sess = data['body']['sess'];
					$cookies.put('sess', $scope.sess, { path: '/'});
					var obj = {
						message :js_user_registration_ok,
						buttons: [
							{
							  text: "OK",
							  click: function() {
								$( this ).dialog( "close" );
								window.location.href="/";
							  }
							}
						]
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
						message :js_response_error
				}
				dialog(obj)
			}
		});
		
	}
	
	$scope.doLogin = function()
	{
		postdata = $('#Loginfrm').serializeFormJSON();
		postdata['logintype'] ='web';
		$.ajax({
			// async: false,
			type: 'post',
			dataType: 'json',
			url: LoginApi,
			data: JSON.stringify(postdata),
			contentType: "application/json",
			success: function (data) {
				if(data.status =="200")
				{
					$scope.sess = data['body']['sess'];
					$cookies.put('sess', $scope.sess, { path: '/'});
					var obj = {
						message :js_user_login_ok,
						buttons: [
						{
							text: "ok",
							click: function() 
							{
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


var bodyCtrl = function($scope, $cookies, $rootScope, User)
{
	$scope.islogin = false;
	
	$scope.logout = function()
	{
		$.ajax({
			type: 'get',
			dataType: 'json',
			url: LogoutApi,
			success: function (data) {
				$scope.ischeckout =false ;
				if(data.status =="200")
				{
					$cookies.remove('sess', {path: '/'});
					var obj = {
						message :js_user_logout_ok,
						buttons: [
						{
						  text: "ok",
						  click: function() {
							$( this ).dialog( "close" );
							location.href="/";
						  }
						}]
					}
					dialog(obj);
				}
			},
			error: function (data) {
				var obj = {
						message :js_user_logout_error
				}
				dialog(obj)
			}
		});
	}

	$scope.init = function()
	{
		console.log(User);
		if(typeof User.u_id != 'undefined')
		{
			$scope.islogin = true;
		}
	}
}

var breadcrumbsCtrl = function ($scope)
{
	var pathname = window.location.pathname; // Returns path only
	$scope.breadcrumbs = pathname.split('/');
}

var userCtrl = function($scope)
{
	$scope.setProfile = function()
	{
		console.log('d');
	}
}
sihaliveApp.controller('userCtrl', ['$scope',userCtrl]);
sihaliveApp.controller('categoryCtrl', categoryCtrl);
sihaliveApp.controller('breadcrumbsCtrl', breadcrumbsCtrl);
sihaliveApp.controller('navCtrl',  ['$scope', '$cookies', '$rootScope', 'User', navCtrl]);
sihaliveApp.controller('productPageCtrl',  ['$scope', '$cookies','$rootScope', 'User', productPageCtrl]);
sihaliveApp.controller('shopCartCtrl',  ['$scope', '$cookies', '$rootScope', 'User',shopCartCtrl]);
sihaliveApp.controller('loginCtrl',  ['$scope', '$cookies', '$rootScope', 'User',loginCtrl]);
sihaliveApp.controller('bodyCtrl',  ['$scope', '$cookies', '$rootScope', 'User',bodyCtrl]);


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



var fbAction ='';
$('#fbReg').bind('click', function(e){
	e.preventDefault();
	fbAction = "FBreg";
	fbLogin();
})

$('#FBloginBtn').bind('click', function(e){
	e.preventDefault();
	fbAction = "FBLogin";
	fbLogin();
})

// javascript document
// This is called with the results from from FB.getLoginStatus().
function statusChangeCallback(response) {
    if (response.status === 'connected') {
        // Logged into your app and Facebook.
		switch(fbAction)
		{
			case 'FBreg' :
				FBreg(response);
			break;
			case 'FBLogin':
				FBLogin(response);
			break;
		}
    } else if (response.status === 'not_authorized') {
		
        // The person is logged into Facebook, but not your app.
    } else {
        // The person is not logged into Facebook, so we're not sure if
        // they are logged into this app or not.
    }
}



function checkLoginState() {
    FB.getLoginStatus(function(response) {
        statusChangeCallback(response);
    });
}
window.fbAsyncInit = function() {
    FB.init({
        appId      : fbAppId ,
        cookie     : true, 
        xfbml      : true, 
        version    : 'v2.2' 
    });
};

(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "//connect.facebook.net/zh_TW/sdk.js";
	fjs.parentNode.insertBefore(js, fjs);
}(document, "script", "facebook-jssdk"));



function FBreg(token) {
	var postdata =token.authResponse;
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: FBRegApi,
		data: JSON.stringify(postdata),
		contentType: "application/json",
		success: function (data) {
			if(data.status =="200")
			{
				var sess = data['body']['sess'];
				$.cookie('sess', sess, { path: '/' });
				var obj = {
					message :js_user_registration_ok,
					buttons: 
					[
						{
						  text: "OK",
						  click: function() {
							$( this ).dialog( "close" );
							window.location.href="/";
						  }
						}
					]
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
					message :js_response_error
			}
			dialog(obj)
		}
	});
}

function FBLogin(token)
{
	var postdata =token.authResponse;
	$.ajax({
		type: 'post',
		dataType: 'json',
		url: FBLoginApi,
		data: JSON.stringify(postdata),
		contentType: "application/json",
		success: function (data) {
			if(data.status =="200")
			{
				var sess = data['body']['sess'];
				$.cookie('sess', sess, { path: '/' });
				var obj = {
					message :js_user_login_ok,
					buttons: 
					[
						{
						  text: "OK",
						  click: function() {
							$( this ).dialog( "close" );
							window.location.href="/";
						  }
						}
					]
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
					message :js_response_error
			}
			dialog(obj)
		}
	});
}

function fbLogin()
{
    // FB 第三方登入，要求公開資料與email
    FB.login(function(response)
    {
        statusChangeCallback(response);
    }, {scope: 'public_profile,email'});
}

	
