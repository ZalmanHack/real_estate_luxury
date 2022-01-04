

// Когда пользователь прокручивает вниз 50px от верхней части документа, измените размер шрифта заголовка

window.addEventListener("scroll", scrollFunction);
window.addEventListener("resize", scrollFunction);

window.addEventListener("load", () => {
    document.getElementById("feedbackModalButton").addEventListener("click", sendFeedback);
})

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

function sendFeedback() {
    let email = document.getElementById("emailCallbackInput");
    let name = document.getElementById("nameCallbackInput");
    let question = document.getElementById("questionCallbackTextarea");
    if(email && name && question) {
        console.log(111)
        let csrf = get_csrf();
        let url = "/api/user/feedback";
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
        xhr.setRequestHeader(csrf.header, csrf.token);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // console.log(JSON.parse(xhr.response));
                location.reload();
                console.log(true);
            } else {
                console.log(false);
            }
        };
        xhr.send(JSON.stringify({
            "email": email.value,
            "name": name.value,
            "question": question.value
        }));
    }
}

function get_csrf() {
    let token = document.querySelector("meta[name='_csrf']").content;
    let header = document.querySelector("meta[name='_csrf_header']").content;
    return {"header": header, "token": token};
}

function getParameterByName(name, url = window.location.href) {
    name = name.replace(/[\[\]]/g, '\\$&');
    let regex = new RegExp('[?&]' + name + '(=([^&#]*)|&|#|$)'),
        results = regex.exec(url);
    if (!results) return '';
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, ' '));
}


function setParameterByName(name, value) {
    const url = new URL(window.location);
    url.searchParams.set(name, value);
    window.history.pushState({}, '', url);

}
