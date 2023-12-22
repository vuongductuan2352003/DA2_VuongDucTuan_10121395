
app.controller("SP", function ($scope, $http) { 
    $scope.anhDaiDien = ""; // Khởi tạo giá trị mặc định cho anhDaiDien

    $scope.GetSanPham = function () {
        $http({
            method: 'GET',
            url: api_link + '/api/SanPham/get-listSanPham',
        }).then(function (response) {
            $scope.ListSP = response.data;
        });
    };
    
    $scope.GetSanPham();
    $scope.DanhMucChange = function(masanpham) {
        // Thực hiện các hành động cần thiết khi chọn một danh mục
        // Ví dụ: Gọi API để lấy danh sách chi tiết danh mục
        console.log($scope.maSanPham);
     
    };
    
    function layMaSanPham(buttonElement) {
        // Lấy giá trị từ thuộc tính 'value' của thẻ i (icon)
        var maSanPham = buttonElement.querySelector('i').getAttribute('value');
    
        // Sử dụng giá trị mã sản phẩm
        console.log("Mã sản phẩm: " + maSanPham);
    
        // Thêm các xử lý khác tùy thuộc vào nhu cầu của bạn
    }
    
    

  




  // Lấy tham số từ URL
const urlParams = new URLSearchParams(window.location.search);
const id = urlParams.get('id');
$scope.ListSPP=[];
// Kiểm tra xem id có giá trị hay không
if (id) {
    console.log("Mã ID được lấy từ URL:", id);

    // Gọi hàm GetSanPhamm với id
    $scope.GetSanPhamm = function (id) {
        $http({
            method: 'GET',
            url: api_link + '/api/SanPham/get-by-id/' + id,
        }).then(function (response) {
            $scope.ListSPP = response.data;
          
           
        });
    };

    // Gọi hàm GetSanPhamm với id từ URL
    $scope.GetSanPhamm(id);
} else {
    console.log("Không tìm thấy mã ID trong URL.");
}



   
    $scope.ListSanPhamTimKiem =[];
$scope.TimKiemSanPhamm = function (maSanPham) {
    // Gọi API để tìm kiếm sản phẩm dựa trên giá trị của biến hi
    $http({
        method: 'GET',
        url: api_link + '/api/SanPham/get-by-id/' + maSanPham,
    }).then(function (response) {
        // Gán kết quả tìm kiếm vào danh sách sản phẩm
        $scope.ListSanPhamTimKiem = response.data;
    });

};

    $scope.TimKiemSanPham = function (maSanPham) {
        // Gọi API để tìm kiếm sản phẩm dựa trên mã sản phẩm
        $http({
            method: 'POST',
            url: api_link + '/api/SanPham/tim-kiem-sanpham/' + maSanPham,
        }).then(function (response) {
            // Gán kết quả tìm kiếm vào danh sách sản phẩm
            $scope.ListSanPhamTimKiem = response.data;
        });
    };

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
    // Hàm xóa sản phẩm theo mã sản phẩm
    $scope.TimKiemSanPhamTheoID = function (maSanPham) {
    
            // Nếu có giá trị tìm kiếm, gọi API để lấy sản phẩm theo mã ID
            $http({
                method: 'POST',
                url: api_link + '/api/SanPham/get-by-id/' + maSanPham,
            }).then(function (response) {
                $scope.ListSP = [response.data]; // Gán kết quả tìm kiếm vào danh sách sản phẩm
            });
     
    };
    $scope.Xoa = function (id) {
        var result = confirm("Bạn có thực sự muốn xóa không?"+id+"đ");
        if (result) {
            $http({
                method: 'DELETE',                
           
                url: api_link+ '/api/SanPham/delete-san-pham/' + id,
            }).then(function (response) {
                $scope.GetSanPham();
                alert('Xóa thành công!');
            });
        } 
    };
    
   // Trong file config.js hoặc ở nơi khác cấu hình route
  
});
