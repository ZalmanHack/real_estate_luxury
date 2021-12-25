<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="real_estate.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 after_navbar">
            <div class="container block">
                <h1><@spring.message "real_estate.title.h1"/></h1>
                <div id="realEstateCarousel" class="carousel slide" data-bs-ride="carousel">
                    <div class="carousel-indicators">
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
                    </div>

                    <div class="carousel-inner">
                        <div class="carousel-item active">
                            <img src="/static/img/bg.jpg" class="d-block" style="width: 100%; height: 100%" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/img/bg.jpg" class="d-block" style="width: 100%; height: 100%" alt="...">
                        </div>
                        <div class="carousel-item">
                            <img src="/static/img/bg.jpg" class="d-block" style="width: 100%; height: 100%" alt="...">
                        </div>
                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#realEstateCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden"><-></span>
                    </button>
                    <button class="carousel-control-next" type="button" data-bs-target="#realEstateCarousel" data-bs-slide="next">
                        <span class="carousel-control-next-icon" aria-hidden="true"></span>
                        <span class="visually-hidden">-></span>
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="block_container after_float_block" id="real_estate_container">
        <#-- + fixed top-->
        <div class="real_estate_control shadow shadow-none" id="real_estate_control">
            <div class="container py-3">
<#--                Перенести в JS-->
                <div class="btn-group d-flex justify-content-center" role="group">
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.appartments"/></button>
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.houses"/></button>
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.land"/></button>
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.ready_business"/></button>
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.rent"/></button>
                    <button type="button" class="btn btn-outline-dark"><@spring.message "real_estate.group_control.villas"/></button>
                </div>
<#--                -->
                <div class="d-flex mt-3">
                    <button class="btn btn-outline-dark dropdown-toggle me-3" type="button" data-bs-toggle="dropdown" aria-expanded="false">Выбор города</button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">Донецк</a></li>
                        <li><a class="dropdown-item" href="#">Родной</a></li>
                        <li><a class="dropdown-item" href="#">Любимый</a></li>
                        <li><hr class="dropdown-divider"></li>
                        <li><a class="dropdown-item" href="#">Separated link</a></li>
                    </ul>
                    <input type="text" class="form-control me-3" placeholder="Название" aria-label="Username">
                    <div class="input-group">
                        <input type="text" class="form-control" placeholder="Цена от" aria-label="Username">
                        <span class="input-group-text">—</span>
                        <input type="text" class="form-control" placeholder="до" aria-label="Server">
                        <span class="input-group-text">$</span>
                    </div>
                    <button class="btn btn-dark ms-3">Применить</button>
                </div>
            </div>
        </div>
    </div>
    <div class="block_container">
        <div class="container">
            <div class="card_container">
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
                <@item.real_estate/>
            </div>
<#--            <div class="" style="height: 1000px"></div>-->
        </div>
    </div>

</@common.page>