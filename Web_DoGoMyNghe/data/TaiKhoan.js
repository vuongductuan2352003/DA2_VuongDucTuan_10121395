var admin = [{
    "username": "Tuan",
    "pass": "123"
}];
var nguoiDung=[{
     "username": "User1", "pass": "789" },
    { "username": "User2", "pass": "abc" 
}]
function login() {
    var usernameInput = document.getElementById('username').value;
    var passwordInput = document.getElementById('password').value;
    var userTypeInput = document.getElementById('userType').value;

    var isValid = false;

    if (userTypeInput === 'admin') {
        isValid = admin.some(function(admin) {
            return admin.username === usernameInput && admin.pass === passwordInput;
            
        });if (isValid) {
                // Chuyển hướng đến trang admin.html khi đăng nhập thành công
                window.location.href = "/QuanTriVien/admin.html";
            }
    } else if (userTypeInput === 'nguoidung') {
        isValid = nguoiDung.some(function(nguoiDung) {
            return nguoiDung.username === usernameInput && nguoiDung.pass === passwordInput;
        });
        if (isValid) {
            // Chuyển hướng đến trang admin.html khi đăng nhập thành công
            window.location.href = "/Trang_Chủ/index.html";
        }
    }

    if (isValid) {
        alert('Đăng nhập thành công!');
        // Thực hiện các hành động sau khi đăng nhập thành công
    } else {
        alert('Đăng nhập thất bại. Vui lòng kiểm tra lại thông tin đăng nhập.');
    }
}
localStorage.setItem('hii',JSON.stringify(nguoiDung))
