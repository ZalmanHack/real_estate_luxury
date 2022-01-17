window.addEventListener("load", (e) => {
    document.getElementById("submitPasswordRestoreButton").addEventListener("click", submitRestorePassword);
})

function submitRestorePassword(e) {
    let email = document.getElementById("inputEmail");
    const valid_email = email.checkValidity();
    valid_email ? email.classList.remove("is-invalid") : email.classList.add("is-invalid");
    let form = document.getElementById("password_restore_form");
    if(valid_email) {
        e.target.setAttribute("disabled", "");
        form.submit();
    }
}