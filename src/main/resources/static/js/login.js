window.addEventListener("load", loginError);

function loginError() {
    if(getParameterByName("error") === "true") {
        let message = document.getElementById("login_error_message");
        message.removeAttribute("hidden");
    }
}