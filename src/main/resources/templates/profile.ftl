<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="real_estate.show.title"/> </#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('${user.profileImage!''}');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container block">
                <h1>${user.companyName}</h1>

                <div class="row px-3 overflow_bottom_6" id="title_container">
                    <div class="col" id="title_image">
                        <#if user.profileImage?? && user.profileImage != "">
                            <img src="${user.profileImage}" class="profile_img bg-white px-0" alt="...">
                        <#else>
                            <div class="profile_img bg-white">
                                <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="#888" class="bi bi-person d-block mx-auto my-auto" viewBox="0 0 16 16">
                                    <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                </svg>
                            </div>
                        </#if>
                    </div>

                    <div class="col d-flex flex-column" id="title_info">
                        <div class="d-flex flex-column pb-4 px-0" style="flex: 1 1 auto">
                            <div class="" style="flex: 1 1 auto">
                                <h3 class="card-text mb-3">${user.firstName} ${user.lastName}</h3>
                                <div class="d-flex mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-person me-3" viewBox="0 0 16 16">
                                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                                    </svg>
                                    <p class="card-text"> ${user.username}</p>
                                </div>
                                <div class="d-flex mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-envelope me-3" viewBox="0 0 16 16">
                                        <path d="M0 4a2 2 0 0 1 2-2h12a2 2 0 0 1 2 2v8a2 2 0 0 1-2 2H2a2 2 0 0 1-2-2V4Zm2-1a1 1 0 0 0-1 1v.217l7 4.2 7-4.2V4a1 1 0 0 0-1-1H2Zm13 2.383-4.708 2.825L15 11.105V5.383Zm-.034 6.876-5.64-3.471L8 9.583l-1.326-.795-5.64 3.47A1 1 0 0 0 2 13h12a1 1 0 0 0 .966-.741ZM1 11.105l4.708-2.897L1 5.383v5.722Z"/>
                                    </svg>
                                    <p class="card-text">${user.email}</p>
                                </div>
                                <div class="d-flex mb-3">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-telephone me-3" viewBox="0 0 16 16">
                                        <path d="M3.654 1.328a.678.678 0 0 0-1.015-.063L1.605 2.3c-.483.484-.661 1.169-.45 1.77a17.568 17.568 0 0 0 4.168 6.608 17.569 17.569 0 0 0 6.608 4.168c.601.211 1.286.033 1.77-.45l1.034-1.034a.678.678 0 0 0-.063-1.015l-2.307-1.794a.678.678 0 0 0-.58-.122l-2.19.547a1.745 1.745 0 0 1-1.657-.459L5.482 8.062a1.745 1.745 0 0 1-.46-1.657l.548-2.19a.678.678 0 0 0-.122-.58L3.654 1.328zM1.884.511a1.745 1.745 0 0 1 2.612.163L6.29 2.98c.329.423.445.974.315 1.494l-.547 2.19a.678.678 0 0 0 .178.643l2.457 2.457a.678.678 0 0 0 .644.178l2.189-.547a1.745 1.745 0 0 1 1.494.315l2.306 1.794c.829.645.905 1.87.163 2.611l-1.034 1.034c-.74.74-1.846 1.065-2.877.702a18.634 18.634 0 0 1-7.01-4.42 18.634 18.634 0 0 1-4.42-7.009c-.362-1.03-.037-2.137.703-2.877L1.885.511z"/>
                                    </svg>
                                    <p class="card-text">+ ${user.phone}</p>
                                </div>
                            </div>
                       </div>
                    </div>
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

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_company_name" aria-label="<@spring.message "real_estate.group_control.dropdown_company_name"/>" hidden disabled>
                            <option selected>${user.companyName}</option>
                        </select>

                        <select class="form-select w-auto m-3 mt-0" id="dropdown_post_status" aria-label="<@spring.message "real_estate.group_control.dropdown_post_status"/>">
                            <#--                        value="" НЕ УДАЛЯТЬ, нужно для пустой строки-->
                            <option value="" selected><@spring.message "real_estate.group_control.dropdown_post_status"/></option>
                            <#list posts_status as status>
                                <option >${status}</option>
                            </#list>
                        </select>


                        <input type="text" id="input_search_name" class="form-control flex-grow-1 w-auto m-3 mt-0" placeholder="<@spring.message "real_estate.group_control.search"/>" aria-label="Search">

                        <div class="input-group w-auto m-3 mt-0">
                            <input type="number" id="input_price_from" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" step="1000" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_from"/>" aria-label="Cost from" value="0">
                            <span class="input-group-text">—</span>
                            <input type="number" id="input_price_to" oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');" step="1000" max="${max_price?long?c}" class="form-control" placeholder="<@spring.message "real_estate.group_control.price_to"/>" aria-label="Cost to" value="${max_price?long?c}">
                            <span class="input-group-text">$</span>
                        </div>
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

    <script src="/static/js/profile.js"></script>
    <script src="/static/js/realestate.js"></script>
</@common.page>