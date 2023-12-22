// ChiTietSanPhamController

app.controller("GH", function ($scope, $http) {
    // Lấy id từ URL sử dụng $routeParams
    
  // Lấy tham số từ URL

// Kiểm tra xem id có giá trị hay không

    // Gọi hàm GetSanPhamm với id
   
    $scope.GetGioHang = function () {
        $http({
            method: 'GET',
            url: api_link + '/api/DatHang/get-listGioHang',
        }).then(function (response) {
            $scope.ListGH = response.data;
        });
    };
    
    $scope.GetGioHang();
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?"+id+"đ");
        if (result) {
            $http({
                method: 'DELETE',                
           
                url: api_link+ '/api/DatHang/delete-san-pham/' + id,
            }).then(function (response) {
                $scope.GetGioHang();
                alert('Xóa thành công!');
            });
        } 
    };

    $scope.GetTongTien = function () {
        $http({
            method: 'GET',
            url: api_link + '/api/DatHang/get-TongTien',
        }).then(function (response) {
            $scope.ListTT = response.data;
        });
    };
    $scope.GetTongTien();


    $scope.soLuong = null;

    // console.log($scope.filePath);
    $scope.pushdata = function (id) {
        
        var loginData = {
            "maGioHang": id,
            "soLuong": $scope.soLuong ,
        };

        $http({
            method: 'POST',
            url: api_link + '/api/DatHang/update-GioHang',
            // headers: {
            //     'Authorization': 'Bearer ' + $scope.user.token
            // },
            data: loginData
        }).then(function (response) {
            var data = response.data;
            if (data != null || data.success) {
                alert('Sửa số lượng thành công');
                
               
            } else {
                alert('Sửa số lượng không thành công');
            }
        }, function (error) {
            alert(error);
        });
    };





    $scope.tenKhachHang='';
    $scope.gioiTinh='';
    $scope.diaChi='';
    $scope.soDienThoai='';
    $scope.email='';
 
    $scope.THANHTOAN = function () {
        
        var loginData = {
            "ngayTao":'',
            "ngayDuyet":'',
            "tenKH": $scope.tenKhachHang,
            "gioiTinh": $scope.gioiTinh,
            "diaChi":$scope.diaChi,
            "sdt": $scope.soDienThoai,
            "email":  $scope.email,
            "maSanPham":0,
            "soLuong":0

        };

        $http({
            method: 'POST',
            url: api_link + '/api/DatHang/create-DatHangNhieuSanPham',
            // headers: {
            //     'Authorization': 'Bearer ' + $scope.user.token
            // },
            data: loginData
        }).then(function (response) {
            var data = response.data;
            if (data != null || data.success) {
                alert('Thêm Hóa đơn Thành Công');
                
              
            } else {
                alert('Thêm hóa đơn không thành công');
            }
        }, function (error) {
            alert(error);
        });
    };






});
