app.controller("DM", function ($scope, $http,$window) { 
    $scope.ListDM = [];
    $scope.ListCTDM = [];
    $scope.ChiTietDanhMucList = [];
    $scope.showChiTiet = false;

    $scope.GetDM = function () {
        $http({
            method: 'GET', 
            url: api_link + '/api/DanhMuc/get-listDanhMuc',
        }).then(function (response) {  
            $scope.ListDM = response.data;
            
            // Gán danh sách chi tiết danh mục cho biến ChiTietDanhMucList
        });
    };     
     // Sử dụng watch để theo dõi sự thay đổi của maDanhMuc
   // Trong controller
$scope.selectedDanhMuc = null;
// Trong controller
$scope.onDanhMucChange = function(maDanhMuc) {
    // Thực hiện các hành động cần thiết khi chọn một danh mục
    // Ví dụ: Gọi API để lấy danh sách chi tiết danh mục
    console.log($scope.maDanhMuc);
    // Sử dụng $http.get để đơn giản hóa mã
    let url = api_link + "/api/DanhMuc/get-by-id-ctdanhmuc/" + $scope.maDanhMuc.toString();
    console.log(url);

    $http.get(url)
        .then(function (response) {
            console.log(response);
            // Kiểm tra xem có dữ liệu hay không trước khi gán vào $scope.ListCTDM
            if (response && response.data) {
                console.log('has data');
                console.log('---');
                $scope.ListCTDM = response.data;
                console.log($scope.ListCTDM);
                console.log('---');
            } else {
                // Xử lý trường hợp không có dữ liệu trả về
                console.log('Không có dữ liệu chi tiết danh mục.');
                // Gán một giá trị mặc định hoặc xử lý theo nhu cầu
                $scope.ListCTDM = [];
            }
        })
        .catch(function (error) {
            // Xử lý lỗi nếu có
            console.error('Lỗi khi gọi API:', error);
            // Gán một giá trị mặc định hoặc xử lý theo nhu cầu
            $scope.ListCTDM = [];
        });
};

//     $scope.TimKiemID = function (maDanhMuc) {
    
//         // Nếu có giá trị tìm kiếm, gọi API để lấy sản phẩm theo mã ID
//         $http({
//             method: 'POST',
//             url: api_link + '/api/DanhMuc/get-by-id-ctdanhmuc/' + maDanhMuc,
//         }).then(function (response) {
//             $scope.ListDM = [response.data]; // Gán kết quả tìm kiếm vào danh sách sản phẩm
//         });
 
// };
    // $scope.GetCTDM = function () {
    //     $http({
    //         method: 'GET', 
    //         url: api_link + '/api/DanhMuc/get-listChiTietDanhMuc',
    //     }).then(function (response) {  
    //         $scope.ListCTDM = response.data;
    //         // Gán danh sách chi tiết danh mục cho biến ChiTietDanhMucList
    //     }); 
    // };     
 
    $scope.GetDM();
    // Gọi hàm GetCTDM khi controller được khởi tạo
    // $scope.GetCTDM();
    $scope.taikhoan = "";
    $scope.matkhau = "";

    // $scope.login = function () {
    //     var loginData = {
    //         "username": $scope.taikhoan,
    //         "password": $scope.matkhau
    //     };

    //     $http({
    //         method: 'POST',
    //         url:  'https://localhost:44306/api/User/login',
    //         data: loginData
    //     }).then(
    //         function (response) {
                
    //             alert("Đăng nhập thành công");
                
    //         },
    //         function (error) {
    //             alert('Tài khoản hoặc mật khẩu không chính xác');
    //         }
    //     );
    // };
    // $scope.tailkhoan = "";
    // $scope.matkhau = "";

    $scope.login = function () {
        var loginData = {
            "username": $scope.taikhoan,
            "password": $scope.matkhau
        };

        $http({
            method: 'POST',
            url: 'https://localhost:44306/api/User/login',
            data: loginData
        }).then(function (response) {
            var data = response.data;
            if (data != null && data.token != null) {
               
                if (data.loai === 1) {
                    $window.location.href = "/QuanTriVien/admin.html";
                    alert('Đăng nhập thành công')
                } else {
                    alert('Đăng nhập thành công')
                    $window.location.href = "/San_Pham/San_Pham.html";
                }
            } else {
                alert('Tài khoản hoặc mật khẩu không chính xác');
            }
        }, function (error) {
            alert('Tài khoản hoặc mật khẩu không chính xác');
        });
    };
});
