<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="sign_up.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "sign_up.title.h1"/></h1>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl  mt-5 mb-5">
            <form action="/login" method="post" id="registration_form">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <div class="mb-3">
                        <label for="inputFirst_name" class="form-label"><@spring.message "sign_up.inputs.first_name"/> <span class="text-danger">*</span></label>
                        <input name="first_name"
                               type="text"
                               minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                               value="<#if user??>${user.first_name}</#if>"
                               class="form-control ${(first_nameError??)?string("is-invalid","")}"
                               id="inputFirst_name">
                        <div class="invalid-feedback">
                            <#if first_nameError??> ${first_nameError} <#else> <@spring.message "sign_up.inputs.first_name.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputLast_name" class="form-label"><@spring.message "sign_up.inputs.last_name"/> <span class="text-danger">*</span></label>
                        <input name="last_name"
                               type="text"
                               minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                               value="<#if user??>${user.last_name}</#if>"
                               class="form-control ${(last_nameError??)?string("is-invalid","")}"
                               id="inputLast_name">
                        <div class="invalid-feedback">
                            <#if last_nameError??> ${last_nameError} <#else> <@spring.message "sign_up.inputs.last_name.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputEmail"
                               class="form-label"><@spring.message "sign_up.inputs.email"/> <span class="text-danger">*</span></label>
                        <input name="email"
                               type="text"
                               value="<#if user??>${user.email}</#if>"
                               class="form-control ${(emailError??)?string("is-invalid","")}"
                               id="inputEmail"
                               minlength="5" maxlength="320" required
                               pattern="(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
                               aria-describedby="emailHelp">
                        <div class="invalid-feedback">
                            <#if emailError??> ${emailError} <#else> <@spring.message "sign_up.inputs.email.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputPhone"
                               class="form-label"><@spring.message "sign_up.inputs.phone"/> <span class="text-danger">*</span></label>
                        <input name="phone"
                               type="tel"
                               value="<#if user??>${user.phone}</#if>"
                               class="form-control ${(phoneError??)?string("is-invalid","")}"
                               id="inputPhone"
                               minlength="3" maxlength="15" required
                               aria-describedby="phoneHelp">
                        <div class="invalid-feedback">
                            <#if phoneError??> ${phoneError} <#else> <@spring.message "sign_up.inputs.phone.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputUsername" class="form-label"><@spring.message "sign_up.inputs.username"/> <span class="text-danger">*</span></label>
                        <input name="username"
                               type="text"
                               value="<#if user??>${user.username}</#if>"
                               class="form-control ${(usernameError??)?string("is-invalid","")}"
                               id="inputUsername"
                               minlength="1" maxlength="64" required
                               aria-describedby="usernameHelp">
                        <div id="usernameHelp" class="form-text"></div>
                        <div class="invalid-feedback">
                            <#if usernameError??> ${usernameError} <#else> <@spring.message "sign_up.inputs.username.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputPassword" class="form-label"><@spring.message "sign_up.inputs.password"/> <span class="text-danger">*</span></label>
                        <input name="password" type="password"
                               class="form-control ${(passwordError??)?string("is-invalid","")}"
                               id="inputPassword"
                               minlength="1" maxlength="24" required>
                        <div class="invalid-feedback">
                            <#if passwordError??> ${passwordError} <#else> <@spring.message "sign_up.inputs.password.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="InputRepeat_password" class="form-label"><@spring.message "sign_up.inputs.repeat_password"/> <span class="text-danger">*</span></label>
                        <input type="password"
                               class="form-control ${(passwordError??)?string("is-invalid","")}"
                               id="InputRepeat_password"
                               minlength="1" maxlength="24" required>
                        <div class="invalid-feedback">
                            <@spring.message "sign_up.inputs.repeat_password.invalid"/>
                        </div>
                    </div>

                    <button type="button" id="submitRegistrationButton" class="btn btn-primary w-100 mb-4"><@spring.message "sign_up.buttons.submit"/></button>
                    <div class="d-flex justify-content-center mb-3">
                        <a class="link-secondary" href="/registration"><@spring.message "sign_in.buttons.sign_up"/></a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a class="link-secondary" href="/registration"><@spring.message "sign_in.buttons.forgot_password"/></a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="/static/js/registration.js"></script>
</@common.page>