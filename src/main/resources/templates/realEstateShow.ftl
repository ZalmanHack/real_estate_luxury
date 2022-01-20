<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="real_estate.show.title"/> ${post.locationName!post.id}</#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('${post.mainImage!''}');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container block">
                <h1>${post.locationName!post.id}</h1>

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
                                        <img src="${image.image}" class="d-block mx-auto" style="width: 100%" alt="...">
                                    </div>
                                    <#assign index++>
                                </#list>
                            </div>

                            <button class="carousel-control-prev" type="button" data-bs-target="#realEstateCarousel" data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden"><-</span>
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
                                <span class="badge rounded-pill bg-light text-dark mb-2 me-3">${post.realEstateType!''}</span>
                                <h3 class="card-title">${post.locationCityValue!''}</h3>
                                <p class="card-text">${post.localizedBodies[0].features!''}</p>
                            </div>
                            <h3 class="card-text mt-4"><@spring.message "real_estate.item.from"/> ${post.price} $</h3>
<#--                            <a class="btn btn-outline-light mt-4" href="https://www.google.com/maps/search/${post.locationLatitude?float?c},+${post.locationLongitude?float?c}" role="button" target="_blank" rel="noopener noreferrer"><@spring.message "real_estate.title.buttons.map"/></a>-->
                            <a class="btn btn-outline-light mt-4" href="" data-bs-toggle="modal" data-bs-target="#feedbackModal" role="button"><@spring.message "real_estate.title.buttons.callback"/></a>
                        </div>
                        <div class="row mt-4" style="width: auto; max-width: none">
                            <div class="col">
                                <a class="btn btn-success d-flex justify-content-center mt-3" href="https://api.whatsapp.com/send?phone=${post.author.phone}&text=&source=&data=" role="button" target="_blank" rel="noopener noreferrer">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><g><rect fill="none" height="24" width="24" y="0"/>
                                        </g><g><g><g><path d="M19.05,4.91C17.18,3.03,14.69,2,12.04,2c-5.46,0-9.91,4.45-9.91,9.91c0,1.75,0.46,3.45,1.32,4.95L2.05,22l5.25-1.38 c1.45,0.79,3.08,1.21,4.74,1.21h0c0,0,0,0,0,0c5.46,0,9.91-4.45,9.91-9.91C21.95,9.27,20.92,6.78,19.05,4.91z M12.04,20.15 L12.04,20.15c-1.48,0-2.93-0.4-4.2-1.15l-0.3-0.18l-3.12,0.82l0.83-3.04l-0.2-0.31c-0.82-1.31-1.26-2.83-1.26-4.38 c0-4.54,3.7-8.24,8.24-8.24c2.2,0,4.27,0.86,5.82,2.42c1.56,1.56,2.41,3.63,2.41,5.83C20.28,16.46,16.58,20.15,12.04,20.15z M16.56,13.99c-0.25-0.12-1.47-0.72-1.69-0.81c-0.23-0.08-0.39-0.12-0.56,0.12c-0.17,0.25-0.64,0.81-0.78,0.97 c-0.14,0.17-0.29,0.19-0.54,0.06c-0.25-0.12-1.05-0.39-1.99-1.23c-0.74-0.66-1.23-1.47-1.38-1.72c-0.14-0.25-0.02-0.38,0.11-0.51 c0.11-0.11,0.25-0.29,0.37-0.43c0.12-0.14,0.17-0.25,0.25-0.41c0.08-0.17,0.04-0.31-0.02-0.43c-0.06-0.12-0.56-1.34-0.76-1.84 c-0.2-0.48-0.41-0.42-0.56-0.43C8.86,7.33,8.7,7.33,8.53,7.33c-0.17,0-0.43,0.06-0.66,0.31C7.65,7.89,7.01,8.49,7.01,9.71 c0,1.22,0.89,2.4,1.01,2.56c0.12,0.17,1.75,2.67,4.23,3.74c0.59,0.26,1.05,0.41,1.41,0.52c0.59,0.19,1.13,0.16,1.56,0.1 c0.48-0.07,1.47-0.6,1.67-1.18c0.21-0.58,0.21-1.07,0.14-1.18S16.81,14.11,16.56,13.99z"/></g></g></g>
                                    </svg>
                                </a>
                            </div>
                            <div class="col">
                                <a class="btn btn-secondary d-flex justify-content-center mt-3" href="https://www.google.com/maps/search/${post.locationLatitude?string("0.######")?replace(",", ".")},+${post.locationLongitude?string("0.######")?replace(",", ".")}" role="button" target="_blank" rel="noopener noreferrer">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><path d="M0 0h24v24H0z" fill="none"/>
                                        <path d="M12 2C8.13 2 5 5.13 5 9c0 5.25 7 13 7 13s7-7.75 7-13c0-3.87-3.13-7-7-7zm0 9.5c-1.38 0-2.5-1.12-2.5-2.5s1.12-2.5 2.5-2.5 2.5 1.12 2.5 2.5-1.12 2.5-2.5 2.5z"/>
                                    </svg>
                                </a>
                            </div>
                            <div class="col">
                                <a class="btn btn-danger d-flex justify-content-center mt-3" href="mailto:${post.author.email}" role="button" target="_blank" rel="noopener noreferrer">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><path d="M0 0h24v24H0V0z" fill="none"/>
                                        <path d="M12 1.95c-5.52 0-10 4.48-10 10s4.48 10 10 10h5v-2h-5c-4.34 0-8-3.66-8-8s3.66-8 8-8 8 3.66 8 8v1.43c0 .79-.71 1.57-1.5 1.57s-1.5-.78-1.5-1.57v-1.43c0-2.76-2.24-5-5-5s-5 2.24-5 5 2.24 5 5 5c1.38 0 2.64-.56 3.54-1.47.65.89 1.77 1.47 2.96 1.47 1.97 0 3.5-1.6 3.5-3.57v-1.43c0-5.52-4.48-10-10-10zm0 13c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/>
                                    </svg>
                                </a>
                            </div>
                        </div>


                    </div>
                </div>

            </div>
        </div>
    </div>

    <div class="block_container after_float_block">
        <div class="container">
            <h2 class="text-start"><@spring.message "real_estate.show.specifications"/></h2>
            <div class="row row-cols-1 row-cols-sm-1 row-cols-lg-3">
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.area"/></p>
                    <p>${post.area} m.<sup>2</sup></p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.beach"/></p>
                    <p>${post.beach} m.</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.bedrooms"/></p>
                    <p>${post.bedrooms}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.bathrooms"/></p>
                    <p>${post.bathrooms}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.guest_bathrooms"/></p>
                    <p>${post.guestBathrooms}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.swimming_pool"/></p>
                    <p>${post.swimmingPool}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.terrace"/></p>
                    <p>${post.terrace}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.parking"/></p>
                    <p>${post.parking}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.mall"/></p>
                    <p>${post.mall}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.gym"/></p>
                    <p>${post.gym}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.golf"/></p>
                    <p>${post.golf}</p>
                </div>
                <div class="col d-flex flex-row">
                    <p class="me-auto"><@spring.message "real_estate.show.specifications.tennis"/></p>
                    <p>${post.tennis}</p>
                </div>
            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container">
            <h2 class="text-start"><@spring.message "real_estate.show.description"/></h2>
            <p>${post.localizedBodies[0].description!''}</p>
        </div>
    </div>

    <#if post.mainVideo??>
        <div class="block_container mt-5">
            <video autoplay loop playsinline muted class="d-block"  id="main_video">
<#--                <source src="${post.mainVideo}" type="video/mp4">-->
<#--                Your browser does not support the video tag.-->
            </video>
        </div>
    </#if>

    <script src="/static/js/realestateShow.js"></script>
</@common.page>