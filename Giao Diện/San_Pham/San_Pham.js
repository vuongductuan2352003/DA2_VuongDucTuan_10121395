document.getElementById("click1").onclick = function () {
    document.getElementById("block-1").style.display = 'block' ;
    document.getElementById("block-2").style.display = 'none';
  };
  document.getElementById("click2").onclick = function () {
    document.getElementById("block-2").style.display = 'block';
    document.getElementById("block-1").style.display = 'none';
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

