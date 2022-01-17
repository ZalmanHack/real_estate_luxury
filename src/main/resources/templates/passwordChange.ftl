<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="password_change.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "password_change.title.h1"/></h1>
                <p><@spring.message "password_change.title.text"/></p>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl  mt-5 mb-5">
            <form action="/restore/password/change" method="post" id="password_change_form">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="code" value="${code}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <@common.messages/>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label"><@spring.message "password_change.inputs.password"/> <span class="text-danger">*</span></label>
                        <input name="password" type="password"
                               class="form-control ${(passwordError??)?string("is-invalid","")}"
                               id="inputPassword"
                               minlength="1" maxlength="24" required>
                        <div class="invalid-feedback">
                            <#if passwordError??> ${passwordError} <#else> <@spring.message "password_change.inputs.password.invalid"/> </#if>
                        </div>
                    </div>

                    <div class="mb-4">
                        <label for="inputRepeatPassword" class="form-label"><@spring.message "password_change.inputs.repeat_password"/> <span class="text-danger">*</span></label>
                        <input type="password"
                               class="form-control ${(passwordError??)?string("is-invalid","")}"
                               id="inputRepeatPassword"
                               minlength="1" maxlength="24" required>
                        <div class="invalid-feedback">
                            <@spring.message "password_change.inputs.repeat_password.invalid"/>
                        </div>
                    </div>

                    <button type="button" id="submitPasswordChangeButton" class="btn btn-primary w-100 mb-4"><@spring.message "password_change.buttons.submit"/></button>
                    <div class="d-flex justify-content-center mb-3">
                        <a class="link-secondary" href="/registration"><@spring.message "password_change.buttons.sign_up"/></a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a class="link-secondary" href="/login"><@spring.message "password_change.buttons.sign_in"/></a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="/static/js/passwordChange.js"></script>
</@common.page>