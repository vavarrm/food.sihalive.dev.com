'use strict';
var adminApp = angular.module("adminApp", ['ngRoute', 'ngCookies']);
var CURRENT_URL,
	$BODY,
    $MENU_TOGGLE,
	$SIDEBAR_MENU,
	$SIDEBAR_FOOTER,
	$LEFT_COL,
	$RIGHT_COL,
	$NAV_MENU,
	$FOOTER,
	randNum ;
function UrlExists(url, cb){
    $.ajax({
        url:      url,
        dataType: 'text',
        type:     'GET',
		async: 		false,
        error:  function(xhr){
            if(typeof cb === 'function')
			{
				cb.apply(this, [xhr.status]);
			}
        }
    });
}

function dialog(object2, cb, params)
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
					if(typeof cb =="function")
					{
						cb(params);
					}
					$( this ).dialog( "close" );
				}
			}
		]
	};
	$.extend( object1, object2 );
	$( "#dialog p").text(object1.message); 
	$( "#dialog" ).dialog(object1);
}

var bodyCtrl = function($scope, $compile, $cookies, apiService)
{
	$scope.panelShow = false;
	$scope.admin_sess = $cookies.get('admin_sess');
	if(typeof $scope.admin_sess =="undefined")
	{
		location.href='/admin/login.html';
	}
	
	$scope.templates ={};
	$scope.sidebarMenuList={};
	$scope.table_row={};
	$scope.table_fields={};

	$scope.tableListInit = function(tableindex)
	{
		var control = $scope.templates[tableindex].control;
		var func = $scope.templates[tableindex].func;
		
		var promise = apiService.adminApi(control,func);
		promise.then
		(
			function(r) 
			{
				if(r.status =="200")
				{
					$scope.table_row[tableindex] = r.data.body.list;
					$scope.table_fields[tableindex] = r.data.body.fields;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
					};
					dialog(obj);
				}
				
			},
			function() {
				var obj ={
					'message' :'system error'
				};
				 dialog(obj);
			}
		)
	}
	
	
	$scope.sidebar_menu_click = function(control, child)
	{
		$('#myTab li').removeClass('active');
		var index = $('#myTab li').length;
		var target=$('#myTab');
		var li ='<li role="presentation" data-tabindex="'+index +'" class="active">';
		li +='<a href="#tab_content'+index+'" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">'+child.pe_name ;
		li +='<i ng-click="tableClose('+index+')" class="fa fa-close"></i>';
		li +='</a></li>';
		target.append($compile(li)($scope));
		
		var target =$('#myTabContent');
		$('.tab-pane').removeClass('active in');
		$scope.templates[index] ={'url':"views/"+child.pe_page+".html","control":control,"func":child.pe_func};
		var tabpanel   = '<div ng-init="tableindex='+index+'" role="tabpanel" data-tabindex="'+index +'" class="tab-pane fade" id="tab_content'+index+'" aria-labelledby="home-tab">';
		    tabpanel  +='<div  ng-include="templates['+index+'].url"></div>';
			tabpanel +='</div>';
		target.append($compile(tabpanel)($scope));
		$('.tab-pane').eq(index).addClass('active in');
		$scope.panelShow = true;
	}
	
	$scope.sidebar_menu_click('AdminRestaurant',{pe_page:"restaurant_list" ,pe_name:"Restaurant List", pe_func:"getList"});
		

	$scope.init = function()
	{
		var promise = apiService.adminApi('AdminApi','getUser');
		promise.then
		(
			function(r) 
			{
				$scope.ajaxload = false;
				if(r.data.status =="200")
				{
					$scope.sidebarMenuList = r.data.body.menu_list;
					$scope.admin = r.data.body.admin_user;
				}else
				{
					var obj =
					{
						'message' :r.data.message,
					};
					dialog(obj);
				}
				
			},
			function() {
				var obj ={
					'message' :'system error'
				};
				 dialog(obj);
			}
		)
		
	}
	
	$scope.sidebarMenuListInit = function()
	{	
		$SIDEBAR_MENU = $("#sidebar-menu");
		$MENU_TOGGLE = $("#menu_toggle") ;
		init_sidebar();
	}
	
	$scope.tableClose = function(index)
	{
		$('#myTab li[data-tabindex='+index+']').remove();
		$('div[role=tabpanel][data-tabindex='+index+']').remove();
		delete $scope.templates[index];
		if( $('#myTab li').length ==0)
		{
			$scope.panelShow = false;
		}
	}
}

var MainController = function($scope, $routeParams, apiService)
{
	$scope.setting = 
	{
		controller 	:'AdminHome',
		func 		:'index'
	};
	$scope.data =
	{
		input :{},
		response:{}
	};
	$scope.init = function()
	{
		if(typeof $routeParams.controller !="undefined")
		{
			$scope.setting.controller =  $routeParams.controller;
			$scope.setting.func =  $routeParams.func;
		}
	}
}

var loginCtrl = function($scope, $cookies, apiService)
{
	$scope.ajaxload = false;
	$scope.setting = 
	{
		controller 	:'AdminApi',
		func 		:'login'
	};
	$scope.data =
	{
		input :{},
		response:{}
	};
	
	$scope.loginDone = function()
	{
		location.href="/admin/";
	}
	
	$scope.login = function(){
		var obj = 	$scope.data.input;
		if($scope.ajaxload ==true)
		{
			var obj ={
				'message':'isloading....',
			}
			dialog(obj);
			return false;
		}
		$scope.ajaxload = true;
		var promise = apiService.adminApi($scope.setting.controller,$scope.setting.func,obj);
		promise.then
		(
			function(r) 
			{
				$scope.ajaxload = false;
				if(r.data.status =="200")
				{
					$scope.sess = r.data.body.sess;
					$cookies.put('admin_sess', $scope.sess, { path: '/'});
					var obj =
					{
						'message':'welcome',
					};
					dialog(obj, $scope.loginDone);
				}else
				{
					var obj =
					{
						'message' :r.data.message,
					};
					dialog(obj);
				}
				
			},
			function() {
				$scope.ajaxload = false;
				var obj ={
					'message' :'system error'
				};
				 dialog(obj);
			}
		)
	}
}

adminApp.controller('bodyCtrl',  ['$scope', '$compile', '$cookies' ,'apiService' , bodyCtrl]);
adminApp.controller('loginCtrl',  ['$scope', '$cookies' ,'apiService', loginCtrl]);
adminApp.controller('MainController',  ['$scope' ,'$routeParams', 'apiService' , MainController]);


var apiService = function($http, $cookies)
{
	return {
		adminApi :function(controller, func, obj){
			var sess = $cookies.get('admin_sess');
			var default_obj = {
					
			};
			var object = $.extend(default_obj, obj);
			return $http.post('/'+controller+'/'+func+'?sess='+sess, object ,  {headers: {'Content-Type': 'application/json'} });
		}
    };
}
adminApp.factory('apiService', ['$http', '$cookies', apiService]);
adminApp.config(function($routeProvider){
	$routeProvider.when("/",{
		templateUrl: function(params) {
			return 'views/home.html';
		},
		controller: 'MainController'
    }).when("/:controller/:func/:page",{
		templateUrl: function(params) {
			var page ='views/'+params.page+'.html';
			console.log(page);
			UrlExists('views/'+params.page+'.html', function(status){
				if(status === 200){
				   page ='views/'+params.page+'.html';
				}
				else if(status === 404){
				   page ='views/page_404.html';
				   
				}
			});
			return page;
		},
		controller: 'MainController'
    }) .otherwise({redirectTo : '/'})
});

adminApp.directive('ngEnter', function() {
    return function(scope, elem, attrs) {
      elem.bind("keydown keypress", function(event) {
        if (event.which === 13) {
          scope.$apply(function() {
            scope.$eval(attrs.ngEnter);
          });

          event.preventDefault();
        }
      });
    };
});

adminApp.filter('range', function() {
  return function(page, total) {
    total = parseInt(total);

    for (var i=0; i<total; i++) {
		page.push(i);
    }

    return page;
  };
});

$( document ).ready(function() {
	CURRENT_URL = window.location.href.split("#")[0].split("?")[0],
	$BODY = $("body");
	$SIDEBAR_FOOTER = $(".sidebar-footer");
	$LEFT_COL = $(".left_col");
	$RIGHT_COL = $(".right_col");
	$NAV_MENU = $(".nav_menu");
	$FOOTER = $("footer");
	randNum = function() {
		return Math.floor(21 * Math.random()) + 20
	};
});
