window.addEventListener("load", (e) => {
    let input = document.getElementById("inputPhone");
    window.intlTelInput(input,({
        preferredCountries: [ "us", "ru", "do" ],
    }));
    document.getElementById("submitRegistrationButton").addEventListener("click", submitRegistration);
})

function submitRegistration(e) {

    let first_name = document.getElementById("inputFirst_name");
    let last_name = document.getElementById("inputLast_name");
    let email = document.getElementById("inputEmail");
    let phone = document.getElementById("inputPhone");
    let username = document.getElementById("inputUsername");
    let password = document.getElementById("inputPassword");
    let repeat_password = document.getElementById("InputRepeat_password");

    const valid_first_name = first_name.checkValidity();
    const valid_last_name = last_name.checkValidity();
    const valid_email = email.checkValidity();
    const valid_phone = phone.checkValidity();
    const valid_username = username.checkValidity();
    const valid_password = password.checkValidity();
    const valid_repeat_password = repeat_password.checkValidity();

    valid_first_name ? first_name.classList.remove("is-invalid") : first_name.classList.add("is-invalid");
    valid_last_name ? last_name.classList.remove("is-invalid") : last_name.classList.add("is-invalid");
    valid_email ? email.classList.remove("is-invalid") : email.classList.add("is-invalid");
    valid_phone ? phone.classList.remove("is-invalid") : phone.classList.add("is-invalid");
    valid_username ? username.classList.remove("is-invalid") : username.classList.add("is-invalid");
    valid_password ? password.classList.remove("is-invalid") : password.classList.add("is-invalid");
    valid_repeat_password ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");
    password.value === repeat_password.value ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");

    let form = document.getElementById("registration_form");

    console.log(valid_email)
    console.log(form)

    if(valid_first_name && valid_last_name && valid_email && valid_phone && valid_username && valid_password && valid_repeat_password) {
        e.target.setAttribute("disabled", "");
        console.log(222)
        form.submit();
    } else {
        console.log(333)
    }
}