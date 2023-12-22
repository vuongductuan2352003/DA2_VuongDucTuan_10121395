var app = angular.module('APIDOGOMYNGHE', []);
app.controller("KH", function ($scope, $http) { 
	$scope.ListKH;	 
    $scope.GetKhachHang = function () {
        $http({
            method: 'GET', 
            url: api_link + '/api/Khach/get-listKhachHang',
        }).then(function (response) {  
            debugger;
            $scope.ListKH = response.data;  
        });
    };   
	$scope.GetKhachHang();


});

