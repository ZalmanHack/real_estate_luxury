

// Когда пользователь прокручивает вниз 50px от верхней части документа, измените размер шрифта заголовка

window.addEventListener("scroll", scrollFunction);
window.addEventListener("resize", scrollFunction);
window.addEventListener("load", scrollFunction);

window.addEventListener("load", (e) => {
    document.getElementById("modalButtonFeedback").addEventListener("click", sendFeedback);
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

function sendFeedback(e) {
    let email = document.getElementById("emailCallbackInput");
    let name = document.getElementById("nameCallbackInput");
    let question = document.getElementById("questionCallbackTextarea");
    let form = document.getElementById("modalFeedback");
    let loader = document.getElementById("modalButtonLoader");
    let alert_error = document.getElementById("modalAlertError");

    const valid_email = email.checkValidity();
    const valid_name = name.checkValidity();
    const valid_question = question.checkValidity();

    valid_email ? email.classList.remove("is-invalid") : email.classList.add("is-invalid");
    valid_name ? name.classList.remove("is-invalid") : name.classList.add("is-invalid");
    valid_question ? question.classList.remove("is-invalid") : question.classList.add("is-invalid");
    console.log(111)
    console.log(valid_email)
    console.log(valid_name)
    console.log(valid_question)
    console.log(form)
    if(valid_email && valid_name && valid_question && form) {
        e.target.setAttribute("disabled", "");
        loader.removeAttribute("hidden");
        console.log(222)
        let csrf = get_csrf();
        let url = "/api/users/feedback";
        let xhr = new XMLHttpRequest();
        xhr.open('POST', url, true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");
        xhr.setRequestHeader("Accept", "application/json;charset=UTF-8");
        xhr.setRequestHeader(csrf.header, csrf.token);
        xhr.onload = () => {
            if (xhr.readyState === 4 && xhr.status === 200) {
                // console.log(JSON.parse(xhr.response));
                console.log(true);
                alert_error.setAttribute("hidden", "");
                location.reload();
            } else {
                console.log(false);
                alert_error.removeAttribute("hidden");
            }
            loader.setAttribute("hidden", "");
            e.target.removeAttribute("disabled");
        };
        xhr.send(JSON.stringify({
            "email": email.value,
            "name": name.value,
            "question": question.value
        }));
        // form.submit();
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

function getPath() {
    return window.location.href.split("?")[0].split("/").filter(item => item);
}