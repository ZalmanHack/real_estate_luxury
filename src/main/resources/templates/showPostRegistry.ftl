<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#assign title><@spring.message code="administration.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message code="administration.title.h1"/></h1>
                <div class="block">
                    <div class="btn-group" id="real_estate_radio_group" role="group">
                        <a type="button" class="btn btn-light" name="section" id="posts"><@spring.message "administration.sections.posts"/></a>
<#--                        <a type="button" href="/" class="btn btn-outline-light" name="section" id="users"><@spring.message "administration.sections.users"/></a>-->
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="block_container">
        <div class="container pb-5" style="max-width: 800px">
            <ul class="nav nav-pills nav-justified mb-5 mt-4" id="post_sections">
                <li class="nav-item pt-3">
                    <a class="nav-link active" onclick="changePostSection(event)" id="post_section_moderated"><@spring.message "administration.sections.posts.moderation"/></a>
                </li>
                <li class="nav-item pt-3">
                    <a class="nav-link" onclick="changePostSection(event)" id="post_section_rejected"><@spring.message "administration.sections.posts.rejected"/></a>
                </li>
                <li class="nav-item pt-3">
                    <a class="nav-link" onclick="changePostSection(event)" id="post_section_history"><@spring.message "administration.sections.posts.history"/></a>
                </li>
            </ul>



            <div name="post_list" id="post_list_moderated">
                <#list posts_moderated as post>
                    <@item.post_item "changeable" post true true/>
                    <#if !post?is_last>
                        <hr style="height: 1px; border: 0 solid  rgba(100,100,100,100.125); border-top-width: 1px;"/>
                    </#if>
                <#else>
                    <div class="alert alert-success py-3" role="alert">
                        <@spring.message "administration.list_empty"/>
                    </div>
                </#list>
            </div>

            <div name="post_list" id="post_list_rejected" hidden>
                <#list posts_rejected as post>
                    <@item.post_item "changeable"  post true false/>
                    <#if !post?is_last>
                        <hr style="height: 1px; border: 0 solid  rgba(100,100,100,100.125); border-top-width: 1px;"/>
                    </#if>
                <#else>
                    <div class="alert alert-success py-3" role="alert">
                        <@spring.message "administration.list_empty"/>
                    </div>
                </#list>
            </div>

            <div name="post_list" id="post_list_history" hidden>
                <#list posts_history as post>
                    <@item.post_registry_item "history" post false false/>
                    <#if !post?is_last>
                        <hr style="height: 1px; border: 0 solid  rgba(100,100,100,100.125); border-top-width: 1px;"/>
                    </#if>
                <#else>
                    <div class="alert alert-success py-3" role="alert">
                        <@spring.message "administration.list_empty"/>
                    </div>
                </#list>
            </div>
        </div>
    </div>

    <script src="/static/js/editPost.js"></script>
    <script src="/static/js/showPostRegistry.js"></script>
</@common.page>