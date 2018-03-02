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



var CategoryListApi ="/Api/getCategory/";
var GetProductApi ="/Api/getProduct/";
var CheckOutApi ="/Api/checkout/";
var RegistrationApi ="/Api/registration/";
var LoginApi ="/Api/login/";
var GetUserApi ="/Api/getUser/";
var LogoutApi ="/Api/logout/";
var FBRegApi ="/Api/fbReg/";
var FBLoginApi ="/Api/fbLogin/";
var DeliveryPositionApi ="/Api/getDeliveryPosition/";
var isUserAccountExistApi ="/Api/isUserAccountExist/";
var isEmailExistApi ="/Api/isEmailExist/";
var setProfileApi ="/Api/setProfile/";
var getOrderList ="/Api/getOrderList/";
var setProfileInitApi ="/User/setProfileInit/";


var sihaliveApp = angular.module('sihaliveApp', ['ngCookies']);

sihaliveApp.factory('User',['$cookies','$rootScope' , function($cookies, $rootScope){
	var user={} ;
	// var sess = $cookies.get('sess');
	// if(sess !='' && typeof sess !="undefined")
	// {
		// $.ajax({
			// async: false,
			// type: 'get',
			// dataType: 'json',
			// url: GetUserApi+'?sess='+sess ,
			// success: function (data) {
				// if(data.status =="200")
				// {
					// user = data['body']['user_data'];
				// }
					
			// },
			// error: function (data) {
				// var obj = {
					// message :js_user_login_error
				// }
				// dialog(obj)
			// }
		// });
	// }
	return user;
}])

var productPageCtrl = function($scope, $cookies, $rootScope, apiService){
	
	$scope.selectPrice = function(price, $event)
	{
		$scope.selectprice = price;
		$('.resp-tab-item.resp-tab-active').removeClass('resp-tab-active');
	}
	
	$scope.order_set= function(f_id, order_num, price, f_name, is_set) 
	{	
		 var promise = apiService.getSetList(f_id);
		 promise.then
		(
			function(r) { 
				var obj = {
				};
				$scope.setList = r.data.body.rows;
				$( "#setdialog" ).dialog(obj).removeClass('hidden');
			},
			function(errorPayload) {
           
			}
		)
	}
	
	$scope.click = function(f_id, order_num, price, f_name, is_set) 
	{	
		var set_include = new Array();
		var set_select_empty = false;
		var error
		if(typeof is_set != 'undefined' && is_set == '1')
		{
			
			$.each($('.setSelect'), function(i, e){
				
				if($(e).val() =="")
				{
					error = js_please_select+$(e).prev().text();
					set_select_empty  = true;
					return  false;
				}
				var f_name = $(e).find("option:selected").text();
				set_include.push({"f_id":$(e).val(),'f_name':f_name});
			})
		}
		
		if(set_select_empty == true)
		{
			var obj = {
					message : error
				}
			dialog(obj)
		}
		
		if(order_num =='na')
		{
			order_num = $('#order_num').val();
		}
		var  obj ={
			f_id : f_id,
			order_num  :  order_num,
			price: price,
			f_name:f_name,
			is_set:is_set,
			set_include :set_include
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
	$('.container').removeClass('hidden');
	
	$scope.data = {
		o_consignee :User.u_consignee,
		o_phone :User.u_phone,
	};
	
	if($scope.cartnums ==0)
	{
		$( "#dialog p").text(js_cart_num_is_zero); 
		$( "#dialog" ).dialog({
			buttons: [
				{
				  text: "close",
				  click: function() {
					$( this ).dialog( "close" );
					//window.location.href="/Menu";
				  }
				}
			]
		});
		return false;
	}
	
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
						location.href="/login/?back=ShopCart";
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
			angular.forEach($('input[data-index]'), function(item, index){
				shopcart[index].order_num = $(item).val();
			})
			postdata ={
				order_list : shopcart,
				'o_consignee'	: $('input[name=o_consignee]').val(),
				'o_phone'	: $('input[name=o_phone]').val(),
				'o_message'	: $('#message').val(),
				'o_position_id'	: $('#o_position_id').val(),
				'o_lat'		:$('input[name=c_lat]').val(),
				'o_lng'		:$('input[name=c_lng]').val(),
			};
			var sess = $cookies.get('sess');
			$scope.ischeckout = true;
			$.ajax({
				// async: false,
				type: 'POST',
				dataType: 'json',
				url: CheckOutApi+'?sess='+sess,
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

var navCtrl = function($scope, $cookies, $rootScope, User){
	$scope.data = {
		islogin : false
	}
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

var loginCtrl = function($scope, $cookies, $rootScope, apiService){
	$scope.user = false;
	
	$scope.UserIsExist = function(u_account)
	{
		$.ajax({
			async: false,
			type: 'GET',
			dataType: 'json',
			url: isUserAccountExistApi+'?u_account='+u_account,
			contentType: "application/json",
			success: function (data) {
				var is_user_exist = data['body']['data']['is_user_exist'];
				if(is_user_exist > 0)
				{
					$scope.username_isexist = true;
				}else
				{
					$scope.username_isexist = false;
				}
			},
			error: function (data) {
				
			}
		});
	}
	$scope.EmailIsExist = function()
	{
		
		$.ajax({
			async: false,
			type: 'GET',
			dataType: 'json',
			url: isEmailExistApi+'?u_email='+$('#register-form-email').val(),
			contentType: "application/json",
			success: function (data) {
				var is_user_exist = data['body']['data']['is_user_exist'];
				if(is_user_exist > 0)
				{
					$scope.email_isexist = true;
				}else
				{
					$scope.email_isexist = false;
				}
			},
			error: function (data) {
				
			}
		});
	}
	$scope.register = function(event)
	{
		event.preventDefault();
		if($scope.u_passwd_confirm !=$scope.u_passwd)
		{
			var obj = {
				message :js_login_password_confirm
			}
			dialog(obj);
			return false;
		}
		
		$scope.registration_ok_auto_login = function(r)
		{

			if(r.data.status =='200')
			{
				$scope.sess = r.data.body.sess;
				$cookies.put('sess', $scope.sess, { path: '/'});
				var obj = {
					message :js_user_registration_ok,
					buttons: [
					{
						text: "ok",
						click: function() 
						{
							$( this ).dialog( "close" );
			
							location.href = '/';
						}
					}]
				};
				dialog(obj);
			}else
			{
				var obj = {
					message :r.data.message,
				};
				dialog(obj);
			}
		}
		
		var promise = apiService.adminApi(RegistrationApi, 'post', $scope.input);
		promise.then
		(
			function(r) { 
				api_response(r,$scope.registration_ok_auto_login(r));
			},
			function () {
				var obj = {
					message :js_systen_error
				}
				dialog(obj)
			}
		)
	}
	
	$scope.doLogin = function()
	{
	
		$.ajax({
			type: 'post',
			dataType: 'json',
			url: LoginApi,
			data: JSON.stringify($scope.login),
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


                                if( $('#o_phone').val()=="" ) {

                                }else{

                                    location.href="/";
								}

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
			error: function () {
				var obj = {
						message :js_user_login_error
				}
				dialog(obj)
			}
		});
	}
	
	
}


var bodyCtrl = function($scope, $cookies, $rootScope, apiService)
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
					$cookies.remove('ci_session', {path: '/'});
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
						message :js_systen_error
				}
				dialog(obj)
			}
		});
	}

	$scope.getUserCallBack = function(r)
	{
		$scope.islogin = true;
	}
	
	$scope.init = function()
	{
		var sess = $cookies.get('sess');
		if(typeof sess !="undefined")
		{
			var promise = apiService.adminApi(GetUserApi,'get');
			promise.then
			(
				function(r) 
				{
					api_response(r,$scope.getUserCallBack);
				},
				function() {
					var obj ={
						'message' :js_user_login_error
					};
					dialog(obj);
				}
			)
			
		}
		
		
	}
}

var breadcrumbsCtrl = function ($scope)
{
	var pathname = window.location.pathname; // Returns path only
	$scope.breadcrumbs = pathname.split('/');
	$.each($scope.breadcrumbs,function(i,e)
	{
		$scope.breadcrumbs[i]=__nav[e];
	})
}

var userCtrl = function($scope, $cookies, $rootScope, User, apiService)
{
	$scope.sending =false;
	$scope.getUserProfile = function(r){
		$scope.u_fname = r.data.body.user.u_first_name;
		$scope.u_lname=r.data.body.user.u_last_name;
        $scope.u_phone=r.data.body.user.u_phone;
        $scope.u_email=r.data.body.user.u_email;

	}
	$scope.init = function()
	{
		var promise = apiService.adminApi(setProfileInitApi);
		promise.then
		(
			function(r) 
			{
				api_response(r,$scope.getUserProfile);
			},
			function() {
				var obj ={
					'message' :js_user_login_error
				};
				dialog(obj);
			}
			)
	}
	
	$scope.setProfile = function()
	{

		
		if(	$scope.sending == true)
		{
			global({show:true ,message:js_respond_200,type:'finsh'});
			return false;
		}
		if($('#o_fname').val() =="" || $('#o_lname').val() =="")
		{
			var obj = {
				message :js_required_error
			};
			dialog(obj)
			return false;
		}
		global({show:true});
		$scope.sending = true;
		var postdata = {
			u_first_name:$('#o_fname').val(),
            u_last_name	:$('#o_lname').val(),
		};

		var sess = $cookies.get('sess');
		$.ajax({
			// async: false,
			type: 'post',
			dataType: 'json',
			url: setProfileApi+"?sess="+sess,
			data: JSON.stringify(postdata),
			contentType: "application/json",
			success: function (data) {
				if(data.status =="200")
				{
					$scope.sending = false;
					global({show:true ,message:js_respond_200,type:'finsh'});
					setTimeout("global()", 2000 );
				}else{
					var obj = {
						message :data.message
					};
					dialog(obj)
				}
			},
			error: function (data) {
				var obj = {
					message :js_set_profile_error
				}
				dialog(obj)
			}
		});
		return false;
	}
}

var orderCtrl = function($scope, $cookies, $rootScope, User)
{	
	$scope.data={
		orders :{},
		order_status :{},
		o_status :'1'
	};
	$scope.orderList = function()
	{
		var sess = $cookies.get('sess');
		$.ajax({
			async: false,
			type: 'get',
			dataType: 'json',
			url: getOrderList+"?sess="+sess,
			contentType: "application/json",
			success: function (data) {
				if(data.status =="200")
				{
					$scope.data.orders = data['body']['data']['orders'];
					$scope.data.order_status = data['body']['data']['order_status'];
				}else{
					var obj = {
						message :data.message
					};
					dialog(obj)
				}
			},
			error: function (data) {
				var obj = {
					message :js_order_list_error
				}
				dialog(obj)
			}
		});
		return false;
	}
}

var contactsCtrl = function ($scope){
	$scope.send = function()
	{
		
	}
}

sihaliveApp.controller('userCtrl', ['$scope' , '$cookies', '$rootScope', 'User','apiService',userCtrl]);
sihaliveApp.controller('categoryCtrl', categoryCtrl);
sihaliveApp.controller('breadcrumbsCtrl', breadcrumbsCtrl);
sihaliveApp.controller('navCtrl',  ['$scope', '$cookies', '$rootScope', 'User', navCtrl]);
sihaliveApp.controller('productPageCtrl',  ['$scope', '$cookies','$rootScope', 'apiService', productPageCtrl]);
sihaliveApp.controller('shopCartCtrl',  ['$scope', '$cookies', '$rootScope', 'User',shopCartCtrl]);
sihaliveApp.controller('loginCtrl',  ['$scope', '$cookies', '$rootScope','apiService',loginCtrl]);
sihaliveApp.controller('bodyCtrl',  ['$scope', '$cookies', '$rootScope', 'apiService',bodyCtrl]);
sihaliveApp.controller('orderCtrl',  ['$scope', '$cookies', '$rootScope', 'User',orderCtrl]);
sihaliveApp.controller('contactsCtrl',  ['$scope',contactsCtrl]);


var apiService = function($http, $cookies)
{
	var sess = $cookies.get('sess');
	return {
		adminApi :function(api_url, method='post', postdata){
			var default_obj = {
				
			};
			var object = $.extend(default_obj, postdata);
			if( method =="post")
			{
				return $http.post(api_url+'?sess='+sess, object ,  {headers: {'Content-Type': 'application/json'} });
			}else
			{
				return $http.get(api_url+'?sess='+sess, object ,  {headers: {'Content-Type': 'application/json'} });
			}
			
		}
    };
}
sihaliveApp.factory('apiService', ['$http', '$cookies',apiService]);



function api_response(r,callback)
{
	if(typeof callback == 'function')
	{
		callback(r);
	}
	
}

function global(odj)
{
	var default_obj ={
		show : false,
		message : js_sending,
		type : 'sending'
	}
	
	var data = $.extend(default_obj,odj);
	$('#form-output-global-icon').removeAttr('class');
	$('#form-output-global-icon').addClass('icon text-middle fa icon-xxs');
	switch (data.type)
	{
		case 'sending' :
			$('#form-output-global-icon').addClass('fa-circle-o-notch');
			$('#form-output-global-icon').addClass('fa-spin');
		break; 
		case 'finsh' :
			$('#form-output-global-icon').addClass('fa-check');
		break;
	}
	$('#form-output-global').find('.message').html(data.message)
	if(data.show == true)
	{
		$('#form-output-global').addClass('active');
	}else{
		$('#form-output-global').removeClass('active');
	}
}

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







