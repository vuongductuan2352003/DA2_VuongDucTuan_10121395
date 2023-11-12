
app.controller("SP", function ($scope, $http) { 
    $scope.anhDaiDien = ""; // Khởi tạo giá trị mặc định cho anhDaiDien

    $scope.GetMacProduct = function () {
        $http({
            method: 'GET',
            url: api_link + '/api/SanPham/get-listSanPham',
        }).then(function (response) {
            debugger;
            $scope.ListSP = response.data;
        });
    };

    $scope.GetMacProduct();

    // Hàm xử lý khi người dùng chọn tệp ảnh
    $scope.capNhatAnhSanPham = function (files, imgElementId) {
        if (files && files.length > 0) {
            var file = files[0];
            var reader = new FileReader();
            reader.onload = function (e) {
                $scope.anhDaiDien = e.target.result;
                $scope.$apply();
            };
            reader.readAsDataURL(file);
        } else {
            $scope.anhDaiDien = ""; // Đặt lại giá trị nếu không có tệp nào được chọn
        }
    };
});

