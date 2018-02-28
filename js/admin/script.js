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
	$scope.table_pageinfo={};


	
	
	
	
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
		$scope.templates[index] ={'url':child.pe_page,"control":control,"func":child.pe_func};
		var tabpanel   	= '<div ng-init="tableindex='+index+'" role="tabpanel" data-tabindex="'+index +'" class="tab-pane fade" id="tab_content'+index+'" >';
		    tabpanel  	+='<iframe height="960px" src="/admin/layout/tabpanel.html#!/'+control+'/'+child.pe_func+'/'+$scope.templates[index].url+'/'+index+'" scrolling="no" frameBorder="0"></iframe>';
			tabpanel 	+='</div>';
		target.append($compile(tabpanel)($scope));
		$('.tab-pane').eq(index).addClass('active in');
		$scope.panelShow = true;
	}
	
	$scope.sidebar_menu_click('AdminRestaurant',{pe_page:"table_list" ,pe_name:"Restaurant List", pe_func:"getList"});
		

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
	$scope.data =
	{
		table_pageinfo :{},
		table_row:{},
		table_fields:{},
		table_pageinfo:{},
	};
	$scope.tableListInit = function()
	{
		$scope.search();
	}

	
	$scope.tableClose = function()
	{
		var a =window.parent.document; 
		console.log(a);
	}
	
	$scope.pagePrevious = function()
	{
		if($scope.data.table_pageinfo.p  ==1)
		{
			return false;
		}
		$scope.data.table_pageinfo.p -=1;
		$scope.search();
	}

	
	$scope.pageNext = function()
	{
		if($scope.data.table_pageinfo.p  ==$scope.data.table_pageinfo.pages)
		{
			return false;
		}
		$scope.data.table_pageinfo.p +=1;
		$scope.search();
	}
	
	$scope.changeLimit = function()
	{
		$scope.data.table_pageinfo.p =1;
		$scope.search();
	}
	
	$scope.changePage =function(p)
	{
		if($scope.data.table_pageinfop ==p)
		{
			return false;
		}
		$scope.data.table_pageinfo.p =p;
		$scope.search();
	}
		
	$scope.search = function()
	{
		var controller = $routeParams.controller;
		var func = $routeParams.func;
		var obj={
			p :$scope.data.table_pageinfo.p,
			limit :$scope.data.table_pageinfo.limit,
		}
		var promise = apiService.adminApi(controller,func, obj);
		promise.then
		(
			function(r) 
			{
				if(r.status =="200")
				{
					$scope.data.table_row= r.data.body.list;
					$scope.data.table_title =r.data.title;
					$scope.data.table_pageinfo= r.data.body.pageinfo;
					$scope.data.table_pageinfo.start=(parseInt($scope.data.table_pageinfo.p)-1)*parseInt($scope.data.table_pageinfo.limit)+1;
					$scope.data.table_pageinfo.end=(parseInt($scope.data.table_pageinfo.p)-1)*parseInt($scope.data.table_pageinfo.limit)+parseInt($scope.data.table_row.length);

					$scope.data.table_fields = r.data.body.fields;
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
			return 'views/';
		},
		controller: 'MainController'
    }).when("/:controller/:func/:page/:tabindex",{
		templateUrl: function(params) {
			var page ='/admin/layout/'+params.page+'.html';
			// UrlExists(page, function(status){
				// if(status === 200){
				   // page ='/loyout/'+params.page+'.html';
				// }
				// else if(status === 404){
				   // page ='views/page_404.html';
				   
				// }
			// });
			return page;
		},
		controller: 'MainController'
    }).otherwise({redirectTo : '/'})
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
