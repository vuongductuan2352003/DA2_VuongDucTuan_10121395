
window.onload = function () {
    // get data từ localstorage
  
    // adminInfo = getListAdmin() || adminInfo;

    addEventChangeTab();

    if (window.localStorage.getItem('Tuan')) {
     
        openTab('Trang Chủ')
    } else {
        document.body.innerHTML = `<h1 style="color:red; with:100%; text-align:center; margin: 50px;"> Truy cập bị từ chối.. </h1>`;
    }
}
var storedData = localStorage.getItem('hi');

// Chuyển chuỗi JSON thành đối tượng JavaScript
var retrievedData = JSON.parse(storedData);
var indexCounter = 1;
retrievedData.forEach(function(product) {
    var productDiv = document.createElement('div');
    productDiv.className = 'menu-sanpham';
  
    // Construct HTML content for the product
    productDiv.innerHTML = `
    <table>       
        <tr   >
            <th  style="width: 5%" >${indexCounter}</th>
            <th  style="width: 5%" >${product.maSp}</th>
            <th  style="width: 5%"> ${product.tenDanhMuc}</th>
            <th id="hienthi-img"  style="width: 15%" > ${product.tenSp}
            <img src="${product.img}" alt="">
            </th>
            <th  style="width: 10%" >${product.gia}đ</th>
            <th  style="width: 5%" >${product.soLuong}</th>
            <th  style="width: 5%" >${product.nhaSanXuat}</th>
   
            <th  style="width: 5%" >${product.BaoHanh}</th>
            <th style="width: 15%">  <div>
          <button> <i class="fa-solid fa-plus"></i> </button>   
              <button><i class="fa fa-wrench"></i> </button>
            <button ng-click="Xoa(sp.maSanPham)">  <i class="fa fa-trash"></i></button>
            </div></th>
  
        </tr>
    </table>
    `;
   
    // Append the product div to the container
    document.getElementById('producttt').appendChild(productDiv);
    indexCounter++;
});
console.log();