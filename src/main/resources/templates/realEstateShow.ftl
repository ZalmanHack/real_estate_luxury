<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="real_estate.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('${post.mainImage!''}');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 after_navbar">
            <div class="container block">
                <h1>${post.locationName}</h1>

                <div class="row overflow_bottom_6" id="title_container">
                    <div class="col-8" id="title_carousel">
                        <div id="realEstateCarousel" class="carousel slide" data-bs-ride="carousel">
                            <div class="carousel-indicators">
<#--                                <button type="button" data-bs-target="#realEstateCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>-->
                                <#assign index=0>
                                <#list post.postImages as image>
                                    <button type="button" data-bs-target="#realEstateCarousel" data-bs-slide-to="${index}" <#if index==0>class="active" aria-current="true"</#if> aria-label="Slide ${index+1}"></button>
                                    <#assign index++>
                                </#list>
                            </div>

                            <div class="carousel-inner">
                                <#assign index=0>
                                <#list post.postImages as image>
                                    <div class="carousel-item <#if index==0>active</#if>">
                                        <img src="${image}" class="d-block mx-auto" style="width: 100%" alt="...">
                                    </div>
                                    <#assign index++>
                                </#list>
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

                    <div class="col d-flex flex-column px-3" id="title_info">
                        <div class="d-flex flex-column pb-4 px-0" style="flex: 1 1 auto">
                            <div class="" style="flex: 1 1 auto">
                                <span class="badge rounded-pill bg-light text-dark mb-2 me-3">${post.realEstateType}</span>
                                <h3 class="card-title">${post.locationCityValue}</h3>
                                <p class="card-text">${post.localizedBodies[0].features!""}</p>
                            </div>
                            <h3 class="card-text mt-4"><@spring.message "real_estate.item.from"/> ${post.price} $</h3>
                            <a class="btn btn-outline-light mt-4" href="https://www.google.com/maps/search/${post.locationLatitude?float?c},+${post.locationLongitude?float?c}" role="button" target="_blank" rel="noopener noreferrer"><@spring.message "real_estate.title.buttons.map"/></a>
                        </div>
                        <a class="btn btn-primary mt-4" href="" role="button"><@spring.message "real_estate.title.buttons.callback"/></a>

                    </div>
                </div>



            </div>
        </div>
    </div>

    <div class="block_container after_float_block">
        <video autoplay loop muted>
            <source src="/vid/1.mp4" type="video/mp4">
            Your browser does not support the video tag.
        </video>
    </div>

    <script src="/static/js/realestateShow.js"></script>
</@common.page>