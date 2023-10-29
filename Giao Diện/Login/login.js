document.getElementById("login-2").onclick = function () {
    document.getElementById("login-1").style.display = 'block' ;
    document.getElementById("signup-3").style.display = 'none';
  };
  document.getElementById("signup-2").onclick = function () {
    document.getElementById("signup-3").style.display = 'block';
    document.getElementById("login-1").style.display = 'none';
  };
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
  
  