app.controller("DM", function ($scope, $http) { 
    $scope.ListDM = [];
    $scope.ChiTietDanhMucList = [];
    $scope.showChiTiet = false;  // Biến để kiểm soát hiển thị chi tiết danh mục

    $scope.GetDM = function () {
        $http({
            method: 'GET', 
            url: api_link + '/api/DanhMuc/get-listDanhMuc',
        }).then(function (response) {  
            $scope.ListDM = response.data;
        });
    };       

    $scope.showChiTietDanhMuc = function(list_json_chitietdanhmuc) {
        // Chuyển đổi chuỗi JSON thành đối tượng
        $scope.ChiTietDanhMucList = JSON.parse(list_json_chitietdanhmuc);
        $scope.showChiTiet = true;  // Hiển thị chi tiết danh mục
    };

    // Gọi hàm GetDM khi controller được khởi tạo
    $scope.GetDM();
});
