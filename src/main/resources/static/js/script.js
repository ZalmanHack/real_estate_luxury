// Когда пользователь прокручивает вниз 50px от верхней части документа, измените размер шрифта заголовка
window.addEventListener("scroll", scrollFunction);

window.addEventListener("resize", scrollFunction);

window.addEventListener("load", scrollFunction);

function scrollFunction() {
    let navbar = document.getElementById("navbar-air");
    if(navbar !== null) {
        if (document.body.scrollTop > 1 || document.documentElement.scrollTop > 1) {
            navbar.id = "navbar-collapsed";
        } else if (window.innerWidth <= 991.98){
            navbar.id = "navbar-collapsed";
        } else {
            navbar.style.removeProperty('background');
        }
        
    }
    else {
        let navbar = document.getElementById("navbar-collapsed");
        if(navbar !== null) {
            if (document.body.scrollTop <= 1 && document.documentElement.scrollTop <= 1) {
                if(window.innerWidth <= 991.98) {
                    navbar.id = "navbar-collapsed";
                } else {
                    navbar.id = "navbar-air";
                }
            }
        }
    }
}
