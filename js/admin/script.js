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

var bodyCtrl = function($scope)
{
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
		init_autocomplete()
	}
	
	$scope.sidebar_menu_click = function()
	{
		$('#myTab li').removeClass('active');
		var index = $('#myTab li').length+1;
		$('#myTab').append('<li role="presentation" class="active"><a href="#tab_content'+index+'" id="home-tab" role="tab" data-toggle="tab" aria-expanded="true">Home </a></li>')
	}
	
	$scope.tableClose = function(index)
	{
		$('#myTab li[data-tabindex='+index+']').remove()
	}
}

var MainController = function($scope, $http, $routeParams, apiService)
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

adminApp.controller('bodyCtrl',  ['$scope', '$http', bodyCtrl]);
adminApp.controller('MainController',  ['$scope', '$http' ,'$routeParams', 'apiService' , MainController]);


var apiService = function($http, $cookies)
{
	var sess = $cookies.get('admin_sess');
	return {
		adminApi :function(controller, func, obj){
			var default_obj = {
					
			};
			var object = $.extend(default_obj, obj);
			return $http.post('/'+controller+'/'+func+'?sess='+sess, object ,  {headers: {'Content-Type': 'application/json'} });
		}
    };
}
adminApp.factory('apiService', ['$http','$cookies',apiService]);
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
