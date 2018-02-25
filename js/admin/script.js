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
var CURRENT_URL = window.location.href.split("#")[0].split("?")[0]
  , $BODY = $("body")
  , $MENU_TOGGLE = $("#menu_toggle")
  , $SIDEBAR_MENU = $("#sidebar-menu")
  , $SIDEBAR_FOOTER = $(".sidebar-footer")
  , $LEFT_COL = $(".left_col")
  , $RIGHT_COL = $(".right_col")
  , $NAV_MENU = $(".nav_menu")
  , $FOOTER = $("footer")
  , randNum = function() {
    return Math.floor(21 * Math.random()) + 20
};

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

var bodyCtrl = function($scope, $compile, $cookies)
{
	$scope.admin_sess = $cookies.get('admin_sess');
	if(typeof $scope.admin_sess =="undefined")
	{
		location.href='/admin/login.html';
	}
	
	$scope.templates =[ ];
	// $scope.template = $scope.templates[0];
	
	onload =function()
	{
		CURRENT_URL = window.location.href.split("#")[0].split("?")[0],
		$BODY = $("body"),
		$MENU_TOGGLE = $("#menu_toggle"),
	    $SIDEBAR_MENU = $("#sidebar-menu"),
		$SIDEBAR_FOOTER = $(".sidebar-footer"),
		$LEFT_COL = $(".left_col"),
		$RIGHT_COL = $(".right_col"),
		$NAV_MENU = $(".nav_menu"),
		$FOOTER = $("footer"),
		randNum = function() {
			return Math.floor(21 * Math.random()) + 20
		};
		init_sparklines(),
		init_flot_chart(),
		init_sidebar(),
		init_wysiwyg(),
		init_InputMask(),
		init_JQVmap(),
		init_cropper(),
		init_knob(),
		init_IonRangeSlider(),
		init_ColorPicker(),
		init_TagsInput(),
		init_parsley(),
		init_daterangepicker(),
		init_daterangepicker_right(),
		init_daterangepicker_single_call(),
		init_daterangepicker_reservation(),
		init_SmartWizard(),
		init_EasyPieChart(),
		init_charts(),
		init_echarts(),
		init_morris_charts(),
		init_skycons(),
		init_select2(),
		init_validator(),
		init_DataTables(),
		init_chart_doughnut(),
		init_gauge(),
		init_PNotify(),
		init_starrr(),
		init_calendar(),
		init_compose(),
		init_CustomNotification(),
		init_autosize(),
		init_autocomplete();
		
		
	}
	
	$scope.sidebar_menu_click = function()
	{
		$('#myTab li').removeClass('active');
		var index = $('#myTab li').length+1;
		var target=$('#myTab');
		var li ='<li role="presentation" data-tabindex="'+index +'" class="active">';
		li +='<a href="#tab_content'+index+'" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Home ';
		li +='<i ng-click="tableClose('+index+')" class="fa fa-close"></i>';
		li +='</a></li>';
		target.append($compile(li)($scope));

		
		var target =$('#myTabContent');
		$('.tab-pane').removeClass('active in');
		$scope.templates[index] ={'url':"views/user.html"};
		var tabpanel   = '<div role="tabpanel" class="tab-pane fade" id="tab_content'+index+'" aria-labelledby="home-tab">';
		    tabpanel  +='<div ng-include="templates['+index+'].url"></div>';
			tabpanel +='</div>';
		target.append($compile(tabpanel)($scope));
		$('.tab-pane').eq(index-1).addClass('active in');
	}
	
	
	
	$scope.tableClose = function(index)
	{
		$('#myTab li[data-tabindex='+index+']').remove()
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
		var obj ;
		var promise = apiService.adminApi($scope.setting.controller,$scope.setting.func,obj);
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
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									location.href="/admin/";
									$( this ).dialog( "close" );
								}
							}
						]
					};
					dialog(obj);
				}else
				{
					var obj =
					{
						'message' :r.data.message,
						buttons: 
						[
							{
								text: "close",
								click: function() 
								{
									$( this ).dialog( "close" );
								}
							}
						]
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

adminApp.controller('bodyCtrl',  ['$scope', '$compile', '$cookies' , bodyCtrl]);
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