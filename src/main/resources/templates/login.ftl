<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="sign_in.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "sign_in.title.h1"/></h1>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl  mt-5 mb-5">
            <form action="/login" method="post">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="mx-auto" style="max-width: 300px">
                    <@common.messages/>
                    <div class="mb-3" id="login_error_message" hidden>
                        <div class="alert alert-danger text-center pb-3" role="alert">
                            <@spring.message "sign_in.error"/>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label for="inputUsername" class="form-label"><@spring.message "sign_in.inputs.username"/></label>
                        <input name="username"
                               type="text"
                               value="<#if person??>${user.username}</#if>"
                               class="form-control ${(usernameError??)?string("is-invalid","")}"
                               id="inputUsername"
                               aria-describedby="usernameHelp">
                        <div id="usernameHelp" class="form-text"></div>
                        <#if usernameError??>
                            <div class="invalid-feedback">
                                ${usernameError}
                            </div>
                        </#if>
                    </div>
                    <div class="mb-3">
                        <label for="inputPassword" class="form-label"><@spring.message "sign_in.inputs.password"/></label>
                        <input name="password" type="password"
                               class="form-control ${(passwordError??)?string("is-invalid","")}"
                               id="password">
                        <#if passwordError??>
                            <div class="invalid-feedback">
                                ${passwordError}
                            </div>
                        </#if>
                    </div>
                    <button type="submit" id="btn-login" class="btn btn-primary w-100 mb-4"><@spring.message "sign_in.buttons.submit"/></button>
                    <div class="d-flex justify-content-center mb-3">
                        <a class="link-secondary" href="/registration"><@spring.message "sign_in.buttons.sign_up"/></a>
                    </div>
                    <div class="d-flex justify-content-center">
                        <a class="link-secondary" href="/restore/password"><@spring.message "sign_in.buttons.forgot_password"/></a>
                    </div>
                </div>
            </form>
        </div>
    </div>

    <script src="/static/js/login.js"></script>
</@common.page>