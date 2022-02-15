<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="real_estate.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container block">
                <h1><@spring.message "real_estate.title.h1"/></h1>
                <div id="realEstateCarousel" class="carousel slide overflow_bottom_6" data-bs-ride="carousel">
                    <div class="carousel-inner">
                        <#assign index=0>
                        <#list posts as post>
                            <div class="carousel-item <#if index==0>active</#if>">
                                <@item.real_estate_premium post/>
                            </div>
                            <#assign index++/>
                        </#list>
                    </div>

                    <button class="carousel-control-prev" type="button" data-bs-target="#realEstateCarousel" data-bs-slide="prev">
                        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                        <span class="visually-hidden"><-</span>
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
                        <label class="btn btn-outline-dark" for="radio_"><@spring.message "real_estate.group_control.all"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_apartment" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_apartment"><@spring.message "real_estate.group_control.apartments"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_house" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_house"><@spring.message "real_estate.group_control.houses"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_land" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_land"><@spring.message "real_estate.group_control.land"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_business" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_business"><@spring.message "real_estate.group_control.ready_business"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_rent" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_rent"><@spring.message "real_estate.group_control.rent"/></label>

                        <input type="radio" class="btn-check" name="real_estate_type" id="radio_villa" autocomplete="off">
                        <label class="btn btn-outline-dark" for="radio_villa"><@spring.message "real_estate.group_control.villas"/></label>
                    </div>

                    <div class="d-flex flex-row" id="real_estate_btn_group">

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_city" aria-label="<@spring.message "real_estate.group_control.dropdown_city"/>">
                            <#--                        value="" НЕ УДАЛЯТЬ, нужно для пустой строки-->
                            <option value="" selected><@spring.message "real_estate.group_control.dropdown_city"/></option>
                            <#list cities as city>
                                <option >${city}</option>
                            </#list>
                        </select>

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_post_status" aria-label="<@spring.message "real_estate.group_control.dropdown_post_status"/>" hidden disabled>
                            <option selected>${post_status}</option>
                        </select>

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_company_name" aria-label="<@spring.message "real_estate.group_control.dropdown_company_name"/>">
                            <option value="" selected><@spring.message "real_estate.group_control.dropdown_company_name"/></option>
                            <#list companies as company>
                                <option>${company}</option>
                            </#list>
                        </select>

                        <input type="text" id="input_search_name" class="form-control flex-grow-1 w-auto m-3 mt-0" placeholder="<@spring.message "real_estate.group_control.search"/>" aria-label="Search">

                        <div class="input-group w-auto m-3 mt-0">
                            <input type="number" id="input_price_from" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" step="1000" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_from"/>" aria-label="Cost from" value="0">
                            <span class="input-group-text">—</span>
                            <input type="number" id="input_price_to" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" step="1000" max="${max_price?long?c}" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_to"/>" aria-label="Cost to" value="${max_price?long?c}">
                            <span class="input-group-text">$</span>
                        </div>

<#--                        <button class="btn btn-primary m-3 mt-0" onclick="findRealEstate()"><@spring.message "real_estate.group_control.apply"/></button>-->
                    </div>
                </div>
<#--                Перенести в JS-->

            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container py-3"  id="real_estate_items_container">
            <div class="container_item" id="real_estate_items"></div>

<#--            <ul class="pagination justify-content-end pt-3">-->
<#--                <li class="page-item disabled">-->
<#--                    <a class="page-link text-secondary" href="#" tabindex="-1" aria-disabled="true">Previous</a>-->
<#--                </li>-->
<#--                <li class="page-item active"><a class="page-link text-dark" href="#">1</a></li>-->
<#--                <li class="page-item"><a class="page-link text-dark" href="#">2</a></li>-->
<#--                <li class="page-item"><a class="page-link text-dark" href="#">3</a></li>-->
<#--                <li class="page-item">-->
<#--                    <a class="page-link text-secondary" href="#">Next</a>-->
<#--                </li>-->
<#--            </ul>-->
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

    <script src="/static/js/realestate.js"></script>
</@common.page>