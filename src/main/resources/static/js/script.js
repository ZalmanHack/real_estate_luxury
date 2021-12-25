

// Когда пользователь прокручивает вниз 50px от верхней части документа, измените размер шрифта заголовка
window.addEventListener("scroll", scrollFunction);

window.addEventListener("scroll", scrollToRealEstateControl);

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

function scrollToRealEstateControl() {
    let navbar = document.getElementsByTagName("nav")[0];
    let container = document.getElementById("real_estate_container");
    let control = document.getElementById("real_estate_control");
    let pos = document.documentElement.scrollTop;
    if (navbar && container && control) {
        if (pos > 556 && pos < (556 + navbar.offsetHeight)) {
            navbar.style.marginTop = -(pos - 556) + "px";
            navbar.style.transition = 0 + "s";
        } else if (pos <= 556) {
            navbar.style.marginTop = "0px";
            navbar.style.transition = 0.2 + "s";
        } else if (pos >= (556 + navbar.offsetHeight)) {
            navbar.style.marginTop = -(navbar.offsetHeight) + "px";
            navbar.style.transition = 0.2 + "s";
        }
        // Включение и отключение теней navbar
        if(pos >= 540) {
          if(!navbar.classList.contains("shadow-none")) {
              navbar.classList.add("shadow-none");
          }
        } else {
            if(navbar.classList.contains("shadow-none")) {
                navbar.classList.remove("shadow-none");
            }
        }
        // включение и отключение теней контроллера
        if(pos >= 556) {
            if(control.classList.contains("shadow-none")) {
                control.classList.remove("shadow-none");
            }
        } else if(!control.classList.contains("shadow-none")) {
                control.classList.add("shadow-none");
        }
        // фикасация контроллера
        container.style.minHeight = "204px";
        if(pos >= (556 + navbar.offsetHeight) && !control.classList.contains("fixed-top")) {
            control.classList.add("fixed-top");
        } else if(pos < (556 + navbar.offsetHeight) && control.classList.contains("fixed-top")) {
            control.classList.remove("fixed-top");
        }
    }
}
