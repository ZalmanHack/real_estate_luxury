window.addEventListener("load", (e) => {
    document.getElementById("submitPasswordChangeButton").addEventListener("click", submitChangePassword);
})

function submitChangePassword(e) {
    let password = document.getElementById("inputPassword");
    let repeat_password = document.getElementById("inputRepeatPassword");

    const valid_password = password.checkValidity();
    const valid_repeat_password = repeat_password.checkValidity();

    valid_password ? password.classList.remove("is-invalid") : password.classList.add("is-invalid");
    valid_repeat_password ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");
    password.value === repeat_password.value ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");

    let form = document.getElementById("password_change_form");
    if(valid_password && valid_repeat_password) {
        e.target.setAttribute("disabled", "");
        form.submit();
    }
}