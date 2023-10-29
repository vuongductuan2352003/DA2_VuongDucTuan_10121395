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

