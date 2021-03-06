<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="home.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "home.title.h1"/></h1>
                <p><@spring.message "home.title.text"/></p>
                <div class="container_buttons">
                    <a class="btn btn-outline-light" data-bs-toggle="modal" data-bs-target="#feedbackModal"><@spring.message "home.title.buttons.callback"/></a>
                    <a class="btn btn-primary" href="/real_estate"><@spring.message "home.title.buttons.real_estate"/></a>
                </div>
            </div>
        </div>
    </div>

    <div class="block_container light-100" >
        <div class="container-xl">
            <h2><@spring.message "home.real_estate"/></h2>
            <@spring.message "home.real_estate.text"/>
            <div class="card_container overflow_bottom">

                <div class="card shadow">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.apartments"/></h5>
                        <a href="/real_estate?real_estate_type=apartment" class="stretched-link hide"></a>
                    </div>
                </div>

                <div class="card shadow ">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.houses"/></h5>
                        <a href="/real_estate?real_estate_type=house" class="stretched-link hide"></a>
                    </div>
                </div>

                <div class="card shadow">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.villas"/></h5>
                        <a href="/real_estate?real_estate_type=villa" class="stretched-link hide"></a>
                    </div>
                </div>

                <div class="card shadow">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.land"/></h5>
                        <a href="/real_estate?real_estate_type=land" class="stretched-link hide"></a>
                    </div>
                </div>

                <div class="card shadow">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.ready_business"/></h5>
                        <a href="/real_estate?real_estate_type=business" class="stretched-link hide"></a>
                    </div>
                </div>

                <div class="card shadow">
<#--                    <img src="/static/img/bg-3.jpg" class="card-img img_rect">-->
                    <!-- d-flex ... justify - это все для выравнивания в центре -->
                    <div class="card-img-overlay d-flex align-items-center justify-content-center">
                        <h5><@spring.message "home.real_estate.buttons.rent"/></h5>
                        <a href="/real_estate?real_estate_type=rent" class="stretched-link hide"></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="img_parallax" style="background-image: url('/static/img/bg-4.jpg');">
        <div class="block_container light-50 after_float_block">
            <div class="container-xl">
                <div class=" container_right block" id="real_estate_info_block">
                    <h2><@spring.message "home.income"/></h2>
                    <@spring.message "home.income.text"/>
                </div>
            </div>
        </div>
    </div>

    <div class="img_parallax" style="background-image: url('/static/img/bg-2.jpg');">
        <div class="block_container light-50">
            <div class="container-xl">
                <div class=" container_right block" id="real_estate_info_block">
                    <h2><@spring.message "home.rent"/></h2>
                    <@spring.message "home.rent.text"/>
                </div>
            </div>
        </div>
    </div>

</@common.page>