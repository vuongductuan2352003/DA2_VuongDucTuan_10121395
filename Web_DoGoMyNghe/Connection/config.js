var app = angular.module('API', ['ngRoute']);
app.config(function ($routeProvider) {
    $routeProvider
        .when('/San_Pham', {
            templateUrl: 'San_Pham/San_Pham.html',
            controller: 'SP'
        })
        .when('/Chi_Tiet_SP/:maSanPham', {
            templateUrl: 'Chi_Tiet_SP/Chi_Tiet_SP.html'
            ,
            controller: 'ChiTietSanPhamController'
        })
        .otherwise({
            redirectTo: 'Chi_Tiet_SP/Chi_Tiet_SP.html'
        });
});
