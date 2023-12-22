// ChiTietSanPhamController

app.controller("ChiTietSanPhamController", function ($scope, $http) {
    // Lấy id từ URL sử dụng $routeParams
    
  // Lấy tham số từ URL
const urlParams = new URLSearchParams(window.location.search);
const id = urlParams.get('id');

// Kiểm tra xem id có giá trị hay không

    // Gọi hàm GetSanPhamm với id
    $scope.GetSanPhamm = function () {
        $http({
            method: 'GET',
            url: api_link + '/api/SanPham/get-by-id/' + id,
        }).then(function (response) {
            $scope.ListSPP = response.data;
          console.log( $scope.ListSPP);
           
        });
    };
    $scope.DanhMucChange = function(masanpham) {
        // Thực hiện các hành động cần thiết khi chọn một danh mục
        // Ví dụ: Gọi API để lấy danh sách chi tiết danh mục
        console.log($scope.maSanPham);
     
    };
    
    $scope.GetSanPhamm();

    $scope.pushdata = function () {
        
      var loginData = {
          "maSanPham": id,
          
      };

      $http({
          method: 'POST',
          url: api_link + '/api/DatHang/create-DatHanPham',
          // headers: {
          //     'Authorization': 'Bearer ' + $scope.user.token
          // },
          data: loginData
      }).then(function (response) {
          var data = response.data;
          if (data != null || data.success) {
              alert('Thêm vào giỏ hàng thành công');
              
            
          } else {
              alert('Thêm giỏ hàng không thành công');
          }
      }, function (error) {
          alert(error);
      });
  };


  
//   $scope.pushdataa = function () {
        
//     var loginData = {
//         "maSanPham": id,
//         "soLuong": $scope.soLuong
//     };
// console.logg(id);
//     $http({
//         method: 'POST',
//         url: api_link + '/api/DatHang/create-ThemGioHang',
//         // headers: {
//         //     'Authorization': 'Bearer ' + $scope.user.token
//         // },
//         data: loginData
//     }).then(function (response) {
//         var data = response.data;
//         if (data != null || data.success) {
//             alert('Thêm Giỏ hàng thành công');
            
          
//         } else {
//             alert('Thêm Giỏ không thành công');
//         }
//     }, function (error) {
//         alert(error);
//     });
// };
});
