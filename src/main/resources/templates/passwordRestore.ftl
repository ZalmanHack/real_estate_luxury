<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="password_restore.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "password_restore.title.h1"/></h1>
                <p><@spring.message "password_restore.title.text"/></p>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl  mt-5 mb-5">
            <form action="/restore/password" method="post" id="password_restore_form">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <@common.messages/>
                    <div class="mb-3">
                        <label for="inputEmail"
                               class="form-label"><@spring.message "password_restore.inputs.email"/> <span class="text-danger">*</span></label>
                        <input name="email"
                               type="text"
                               class="form-control ${(emailError??)?string("is-invalid","")}"
                               id="inputEmail"
                               minlength="5" maxlength="320" required
                               pattern="(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)"
                               aria-describedby="emailHelp">
                        <div class="invalid-feedback">
                            <#if emailError??> ${emailError} <#else> <@spring.message "password_restore.inputs.email.invalid"/> </#if>
                        </div>
                    </div>

                    <button type="button" id="submitPasswordRestoreButton" class="btn btn-primary w-100 mb-4"><@spring.message "password_restore.buttons.submit"/></button>
                    <div class="d-flex justify-content-center mb-3">
                        <a class="link-secondary" href="/registration"><@spring.message "password_restore.buttons.sign_up"/></a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a class="link-secondary" href="/login"><@spring.message "password_restore.buttons.sign_in"/></a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="/static/js/passwordRestore.js"></script>
</@common.page>