<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="profile.edit.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "profile.edit.title.h1"/></h1>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl  mt-5 mb-5">
            <form action="/users/${user.id}/change_info" method="post" id="change_info_form">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <@common.messages/>
                    <div class="mb-3">
                        <label for="inputFirstName" class="form-label"><@spring.message "sign_up.inputs.first_name"/> <span class="text-danger">*</span></label>
                        <input name="firstName"
                               type="text"
                               minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                               value="<#if user??>${user.firstName}</#if>"
                               class="form-control ${(firstNameError??)?string("is-invalid","")}"
                               id="inputFirstName">
                        <div class="invalid-feedback">
                            <#if firstNameError??> ${firstNameError} <#else> <@spring.message "sign_up.inputs.first_name.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputLastName" class="form-label"><@spring.message "sign_up.inputs.last_name"/> <span class="text-danger">*</span></label>
                        <input name="lastName"
                               type="text"
                               minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                               value="<#if user??>${user.lastName}</#if>"
                               class="form-control ${(lastNameError??)?string("is-invalid","")}"
                               id="inputLastName">
                        <div class="invalid-feedback">
                            <#if lastNameError??> ${lastNameError} <#else> <@spring.message "sign_up.inputs.last_name.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputCompanyName" class="form-label"><@spring.message "sign_up.inputs.company_name"/> <span class="text-danger">*</span></label>
                        <input name="companyName"
                               type="text"
                               minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё0-9 ]{1,26}" required
                               value="<#if user??>${user.companyName}</#if>"
                               class="form-control ${(companyNameError??)?string("is-invalid","")}"
                               id="inputCompanyName">
                        <div class="invalid-feedback">
                            <#if companyNameError??> ${companyNameError} <#else> <@spring.message "sign_up.inputs.company_name.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputPhone"
                               class="form-label"><@spring.message "sign_up.inputs.phone"/> <span class="text-danger">*</span></label>
                        <input name="phone"
                               type="tel"
                               value="<#if user??>+${user.phone}</#if>"
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
                        <label for="inputEmail"
                               class="form-label"><@spring.message "sign_up.inputs.email"/> <span class="text-danger">*</span></label>
                        <input name="email"
                               type="text"
                               value="<#if user??>${user.email}</#if>"
                               class="form-control ${(emailError??)?string("is-invalid","")}"
                               id="inputEmail"
                               minlength="5" maxlength="320" required
                               pattern="(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
                               aria-describedby="emailHelp"
                               disabled>
                        <div class="invalid-feedback">
                            <#if emailError??> ${emailError} <#else> <@spring.message "sign_up.inputs.email.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputNewEmail"
                               class="form-label"><@spring.message "sign_up.inputs.new_email"/> <span class="text-danger">*</span></label>
                        <input name="newEmail"
                               type="text"
                               value="<#if user??>${user.newEmail!''}</#if>"
                               class="form-control ${(newEmailError??)?string("is-invalid","")}"
                               id="inputNewEmail"
                               minlength="5" maxlength="320" required
                               pattern="(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
                               aria-describedby="emailHelp">
                        <div class="invalid-feedback">
                            <#if newEmailError??> ${newEmailError} <#else> <@spring.message "sign_up.inputs.new_email.invalid"/> </#if>
                        </div>
                    </div>

                    <button type="button" id="submitChangeInfo" class="btn btn-primary w-100 mt-2 mb-3"><@spring.message "profile.edit.buttons.change_info"/></button>
                </div>
            </form>

            <form action="/users/${user.id}/change_password" method="post" id="change_password_form" enctype="application/json;charset=UTF-8">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <div class="mb-3">
                            <hr style="height: 1px; border: 0 solid  rgba(100,100,100,100.125); border-top-width: 1px;"/>
                            <label for="inputPassword" class="form-label"><@spring.message "sign_up.inputs.password"/> <span class="text-danger">*</span></label>
                            <input name="password" type="password"
                                   class="form-control ${(passwordError??)?string("is-invalid","")}"
                                   id="inputPassword"
                                   minlength="1" maxlength="24" required>
                            <div class="invalid-feedback">
                                <#if passwordError??> ${passwordError} <#else> <@spring.message "sign_up.inputs.password.invalid"/> </#if>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="inputRepeatPassword" class="form-label"><@spring.message "sign_up.inputs.repeat_password"/> <span class="text-danger">*</span></label>
                            <input type="password"
                                   class="form-control ${(passwordError??)?string("is-invalid","")}"
                                   id="inputRepeatPassword"
                                   minlength="1" maxlength="24" required>
                            <div class="invalid-feedback">
                                <@spring.message "sign_up.inputs.repeat_password.invalid"/>
                            </div>
                        </div>

                        <button type="button" id="submitChangePassword" class="btn btn-primary w-100 mt-2"><@spring.message "profile.edit.buttons.change_password"/></button>
                </div>
            </form>

        </div>
    </div>

    <script src="/static/js/profileEdit.js"></script>
</@common.page>