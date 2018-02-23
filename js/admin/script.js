var adminApp = angular.module("adminApp", ['ngRoute']);

var bodyCtrl = function()
{
}

adminApp.controller('foodListCtrl',  ['$scope', '$http', bodyCtrl]);