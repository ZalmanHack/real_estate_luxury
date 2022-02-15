<#import "parts/common.ftl" as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>
<#import "parts/security.ftl" as security>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="profile.show.title"/> ${user.companyName}</#assign>

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
                        <div class="d-flex flex-column pb-3 px-0" style="flex: 1 1 auto">
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
                                <#if security.know &&  security.auth_user.id == user.id>
                                    <div class="d-flex">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-card-image me-3 mt-1" viewBox="0 0 16 16">
                                            <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
                                            <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
                                        </svg>
                                        <span class="btn btn-outline-light border-0 btn-file">
                                            <input type="file" class="form-control" accept="image/*" id="upload_profile_img_input" aria-describedby="upload_img_button" aria-label="Upload">
                                            <@spring.message "profile.show.buttons.change_profile_img"/>
                                        </span>
                                    </div>
                                </#if>
                            </div>
                        </div>

                        <div class="row mt-4" style="width: auto; max-width: none">
                            <div class="col">
                                <a class="btn btn-success d-flex justify-content-center mt-3" href="https://api.whatsapp.com/send?phone=${user.phone}&text=&source=&data=" role="button" target="_blank" rel="noopener noreferrer">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><g><rect fill="none" height="24" width="24" y="0"/>
                                        </g><g><g><g><path d="M19.05,4.91C17.18,3.03,14.69,2,12.04,2c-5.46,0-9.91,4.45-9.91,9.91c0,1.75,0.46,3.45,1.32,4.95L2.05,22l5.25-1.38 c1.45,0.79,3.08,1.21,4.74,1.21h0c0,0,0,0,0,0c5.46,0,9.91-4.45,9.91-9.91C21.95,9.27,20.92,6.78,19.05,4.91z M12.04,20.15 L12.04,20.15c-1.48,0-2.93-0.4-4.2-1.15l-0.3-0.18l-3.12,0.82l0.83-3.04l-0.2-0.31c-0.82-1.31-1.26-2.83-1.26-4.38 c0-4.54,3.7-8.24,8.24-8.24c2.2,0,4.27,0.86,5.82,2.42c1.56,1.56,2.41,3.63,2.41,5.83C20.28,16.46,16.58,20.15,12.04,20.15z M16.56,13.99c-0.25-0.12-1.47-0.72-1.69-0.81c-0.23-0.08-0.39-0.12-0.56,0.12c-0.17,0.25-0.64,0.81-0.78,0.97 c-0.14,0.17-0.29,0.19-0.54,0.06c-0.25-0.12-1.05-0.39-1.99-1.23c-0.74-0.66-1.23-1.47-1.38-1.72c-0.14-0.25-0.02-0.38,0.11-0.51 c0.11-0.11,0.25-0.29,0.37-0.43c0.12-0.14,0.17-0.25,0.25-0.41c0.08-0.17,0.04-0.31-0.02-0.43c-0.06-0.12-0.56-1.34-0.76-1.84 c-0.2-0.48-0.41-0.42-0.56-0.43C8.86,7.33,8.7,7.33,8.53,7.33c-0.17,0-0.43,0.06-0.66,0.31C7.65,7.89,7.01,8.49,7.01,9.71 c0,1.22,0.89,2.4,1.01,2.56c0.12,0.17,1.75,2.67,4.23,3.74c0.59,0.26,1.05,0.41,1.41,0.52c0.59,0.19,1.13,0.16,1.56,0.1 c0.48-0.07,1.47-0.6,1.67-1.18c0.21-0.58,0.21-1.07,0.14-1.18S16.81,14.11,16.56,13.99z"/></g></g></g>
                                    </svg>
                                </a>
                            </div>
                            <div class="col">
                                <a class="btn btn-danger d-flex justify-content-center mt-3" href="mailto:${user.email}" role="button" target="_blank" rel="noopener noreferrer">
                                    <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><path d="M0 0h24v24H0V0z" fill="none"/>
                                        <path d="M12 1.95c-5.52 0-10 4.48-10 10s4.48 10 10 10h5v-2h-5c-4.34 0-8-3.66-8-8s3.66-8 8-8 8 3.66 8 8v1.43c0 .79-.71 1.57-1.5 1.57s-1.5-.78-1.5-1.57v-1.43c0-2.76-2.24-5-5-5s-5 2.24-5 5 2.24 5 5 5c1.38 0 2.64-.56 3.54-1.47.65.89 1.77 1.47 2.96 1.47 1.97 0 3.5-1.6 3.5-3.57v-1.43c0-5.52-4.48-10-10-10zm0 13c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/>
                                    </svg>
                                </a>
                            </div>
                            <#if security.know &&  security.auth_user.id == user.id>
                                <div class="col">
                                    <button class="btn btn-dark d-flex w-100 justify-content-center mt-3" type="button" onclick="newPost(event)">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-newspaper me-3" viewBox="0 0 16 16">
                                            <path d="M0 2.5A1.5 1.5 0 0 1 1.5 1h11A1.5 1.5 0 0 1 14 2.5v10.528c0 .3-.05.654-.238.972h.738a.5.5 0 0 0 .5-.5v-9a.5.5 0 0 1 1 0v9a1.5 1.5 0 0 1-1.5 1.5H1.497A1.497 1.497 0 0 1 0 13.5v-11zM12 14c.37 0 .654-.211.853-.441.092-.106.147-.279.147-.531V2.5a.5.5 0 0 0-.5-.5h-11a.5.5 0 0 0-.5.5v11c0 .278.223.5.497.5H12z"/>
                                            <path d="M2 3h10v2H2V3zm0 3h4v3H2V6zm0 4h4v1H2v-1zm0 2h4v1H2v-1zm5-6h2v1H7V6zm3 0h2v1h-2V6zM7 8h2v1H7V8zm3 0h2v1h-2V8zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1zm-3 2h2v1H7v-1zm3 0h2v1h-2v-1z"/>
                                        </svg>
                                        <@spring.message "profile.show.buttons.new_post"/>
                                    </button>
                                </div>
                            </#if>

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
                            <#list posts_status as key, value>
                                <option value="${key}">${value}</option>
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