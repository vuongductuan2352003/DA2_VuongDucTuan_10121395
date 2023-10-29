var app = angular.module('APIDOGOMYNGHE', []);
app.controller("SP", function ($scope, $http) { 
    $scope.GetMacProduct= function () {
        $http({
            method: 'GET', 
            url: api_link + '/api/SanPham/get-listSanPham',
        }).then(function (response) {  
            debugger;
            $scope.ListSP = response.data;  
        });
    };   
	$scope.GetMacProduct();


});

