<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>

<#assign title><@spring.message code="error.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <span class="display-1 d-block mb-3">404</span>
                <p><@spring.message "error.404"/></p>
                <div class="container_buttons">
                    <a class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#feedbackModal"><@spring.message "home.title.buttons.callback"/></a>
                    <a class="btn btn-primary" href="/real_estate"><@spring.message "home.title.buttons.real_estate"/></a>
                </div>
            </div>
        </div>
    </div>
</@common.page>