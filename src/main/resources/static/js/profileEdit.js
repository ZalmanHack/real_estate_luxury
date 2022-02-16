window.addEventListener("load", (e) => {
    let input = document.getElementById("inputPhone");
    let iti = intlTelInput(input, ({
        nationalMode: true,
        preferredCountries: ["us", "ru", "do"],
        separateDialCode: true,
        utilsScript : "/static/intl_tel_input/js/utils.js"

    }));

    document.getElementById("submitChangePassword").addEventListener("click", function (e) {
        let password = document.getElementById("inputPassword");
        let repeat_password = document.getElementById("inputRepeatPassword");

        const valid_password = password.checkValidity();
        const valid_repeat_password = repeat_password.checkValidity();

        valid_password ? password.classList.remove("is-invalid") : password.classList.add("is-invalid");
        valid_repeat_password ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");
        password.value === repeat_password.value ? repeat_password.classList.remove("is-invalid") : repeat_password.classList.add("is-invalid");

        let form = document.getElementById("change_password_form");

        if (valid_password && valid_repeat_password) {
            e.target.setAttribute("disabled", "");
            form.submit();
        }
    });


    document.getElementById("submitChangeInfo").addEventListener("click", function (e) {
        let first_name = document.getElementById("inputFirstName");
        let last_name = document.getElementById("inputLastName");
        let phone = document.getElementById("inputPhone");
        let new_email = document.getElementById("inputNewEmail");
        let email = document.getElementById("inputEmail");
        let username = document.getElementById("inputUsername");
        let company_name = document.getElementById("inputCompanyName");

        const valid_first_name = first_name.checkValidity();
        const valid_last_name = last_name.checkValidity();
        const valid_phone = phone.checkValidity();
        const valid_username = username.checkValidity();
        const valid_company_name = company_name.checkValidity();
        let valid_new_email = true;
        if(new_email.value) {
            valid_new_email = new_email.checkValidity();
        }


        valid_first_name ? first_name.classList.remove("is-invalid") : first_name.classList.add("is-invalid");
        valid_last_name ? last_name.classList.remove("is-invalid") : last_name.classList.add("is-invalid");
        valid_phone ? phone.classList.remove("is-invalid") : phone.classList.add("is-invalid");
        valid_new_email ? new_email.classList.remove("is-invalid") : new_email.classList.add("is-invalid");
        valid_username ? username.classList.remove("is-invalid") : username.classList.add("is-invalid");
        valid_company_name ? company_name.classList.remove("is-invalid") : company_name.classList.add("is-invalid");

        let form = document.getElementById("change_info_form");

        if (valid_first_name && valid_last_name && valid_phone && valid_username && new_email && valid_company_name) {
            e.target.setAttribute("disabled", "");
            email.name = null;
            phone.value = parseInt(filterInt(iti.getNumber()));
            form.submit();
        }
    });
});