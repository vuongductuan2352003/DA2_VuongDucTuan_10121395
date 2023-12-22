// Lấy ra hai khối HTML
const block1 = document.getElementById("block11");
const block2 = document.getElementById("block2");

// Định nghĩa hàm đổi màu
function changeColor(selectedBlock, otherBlock) {
  // Đổi màu nền của khối được click thành màu xanh
  selectedBlock.style.backgroundColor = "#5A4137";
  // Đổi màu nền của khối còn lại thành màu trắng
  otherBlock.style.backgroundColor = "white";
    // Thay đổi border bottom của khối được click thành 2px solid red
    selectedBlock.style.borderTop = "3px solid red";
    // Đặt lại border bottom của khối còn lại thành none
    otherBlock.style.borderTop = "none";
    selectedBlock.style.color = "white";
    otherBlock.style.color = "black";
 
}

// Thêm sự kiện click cho khối 1
block1.addEventListener("click", function() {
  changeColor(block1, block2);
});

// Thêm sự kiện click cho khối 2
block2.addEventListener("click", function() {
  changeColor(block2, block1);
});
document.getElementById("block11").onclick = function () {
    document.getElementById("MT").style.display = 'block';
    document.getElementById("HDMH").style.display = 'none';
  };
  document.getElementById("block2").onclick = function () {
    document.getElementById("HDMH").style.display = 'block';
    document.getElementById("MT").style.display = 'none';
  };
  const minusBtn = document.querySelector('.minus-btn');
  const plusBtn = document.querySelector('.plus-btn');
  const quantityInput = document.querySelector('.quantity-input');
  
  minusBtn.addEventListener('click', function(e) {
    e.preventDefault();
    let currentValue = parseInt(quantityInput.value);
    if(currentValue > 1) {
      quantityInput.value = currentValue - 1;
    }
  });
  
  plusBtn.addEventListener('click', function(e) {
    e.preventDefault();
    let currentValue = parseInt(quantityInput.value);
    quantityInput.value = currentValue + 1;
  });
  window.onscroll = function() {stickyMenu()};

var menu, sticky;
menu = document.getElementById('bootom-bar');
sticky = menu.offsetTop;

function stickyMenu() {
    if(window.pageYOffset >= sticky) {
        menu.classList.add("sticky");
    }else{
        menu.classList.remove("sticky");    
    }
}

