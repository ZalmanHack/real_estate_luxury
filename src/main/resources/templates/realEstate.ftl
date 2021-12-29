<#import "parts/common.ftl" as common>
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
                        <button type="button" data-bs-target="" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
                        <button type="button" data-bs-target="" data-bs-slide-to="1" aria-label="Slide 2"></button>
                        <button type="button" data-bs-target="" data-bs-slide-to="2" aria-label="Slide 3"></button>
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
                <div class="container_control">
                    <div class="btn-group d-flex justify-content-center m-3" id="real_estate_radio_group" role="group">
                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_" autocomplete="off" checked>
                        <label class="btn btn-outline-dark" for="radio_all"><@spring.message "real_estate.group_control.all"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_apartments" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_apartments"><@spring.message "real_estate.group_control.apartments"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_houses" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_houses"><@spring.message "real_estate.group_control.houses"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_land" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_land"><@spring.message "real_estate.group_control.land"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_business" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_business"><@spring.message "real_estate.group_control.ready_business"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_rent" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_rent"><@spring.message "real_estate.group_control.rent"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_villas" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_villas"><@spring.message "real_estate.group_control.villas"/></label>
                    </div>

                    <div class="d-flex flex-row" id="real_estate_btn_group">

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_city" aria-label="<@spring.message "real_estate.group_control.dropdown_city"/>">
                            <#--                        value="" НЕ УДАЛЯТЬ, нужно для пустой строки-->
                            <option value="" selected><@spring.message "real_estate.group_control.dropdown_city"/></option>
                            <option >One</option>
                            <option >Two</option>
                            <option >Three</option>
                        </select>

                        <input type="text" id="input_search" class="form-control flex-grow-1 w-auto m-3 mt-0" placeholder="<@spring.message "real_estate.group_control.search"/>" aria-label="Search">

                        <div class="input-group w-auto m-3 mt-0">
                            <input type="number" id="input_price_from" oninput="this.value=this.value.replace(/^[/\d]{12}?$/);" step="100" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_from"/>" aria-label="Cost from">
                            <span class="input-group-text">—</span>
                            <input type="number" id="input_price_to" oninput="this.value=this.value.replace(/^[/\d]{12}?$/);" step="100" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_to"/>" aria-label="Cost to">
                            <span class="input-group-text">$</span>
                        </div>

                        <button class="btn btn-primary m-3 mt-0" onclick="findRealEstate()"><@spring.message "real_estate.group_control.apply"/></button>
                    </div>
                </div>
<#--                Перенести в JS-->

            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container py-3"  id="real_estate_items_container">
            <div class="container_item" id="real_estate_items"></div>
        </div>
    </div>

    <template id="real_estate_item">
        <@item.real_estate/>
    </template>
    <template id="real_estate_table_body">
        <@item.table_body/>
    </template>
    <template id="real_estate_card_image">
        <@item.card_image/>
    </template>
    <template id="real_estate_card_alter_image">
        <@item.card_alter_image/>
    </template>

</@common.page>