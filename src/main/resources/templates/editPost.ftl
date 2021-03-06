<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>
<#import "parts/security.ftl" as security/>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="edit_post.title"/> <@spring.message code="edit_post.title.h1"/> ${post.name}</#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "edit_post.title.h1"/></h1>
                <h2>"${post.name}"</h2>
            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container-xl block">
            <h2 class="text-start"><@spring.message "edit_post.title.h2.load_images"/></h2>

            <div id="load_images_count_invalid" class="alert alert-danger" role="alert" hidden><@spring.message code="edit_post.invalids.load_images.count"/></div>
            <div id="load_images_size_invalid" class="alert alert-danger" role="alert" hidden><@spring.message code="edit_post.invalids.load_images.size"/></div>

            <div class="" id="control_images_container">

                <div class="input-group py-3" id="img_upload_control">
                    <input type="file" class="form-control" accept="image/*" id="upload_img_input" aria-describedby="upload_img_button" aria-label="Upload">
                </div>
                <div id="img_upload_progress_container" hidden>
                    <div class="d-flex align-items-center" style="height: 70px;">
                        <div class="progress w-100">
                            <div class="progress-bar" id="img_upload_progress" role="progressbar" style="width: 50%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>

                <div class="files_container" id="images_container">
                    <#if post??>
                        <#list post.postImages as image>
                            <div class="p-3 d-flex flex-column" id="post_image_container_${image.id}">
                                <img src="${image.image}" id="post_image_${image.id}" alt="">
                                <button type="button" class="btn btn-outline-danger mt-3" id="btn_delete_img_${image.id}" onclick="deleteImg(event)" ><@spring.message "edit_post.buttons.delete"/></button>
                            </div>
                        </#list>
                    </#if>

                </div>

            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container">
            <h2 class="text-start"><@spring.message "edit_post.title.h2.location"/></h2>

            <div class="row row-cols-1 row-cols-md-3">
                <div class="col mb-3">
                    <label for="inputPrice" class="form-label"><@spring.message "real_estate.group_control.price_from"/></label>
                    <div class="input-group">
                        <input name="price"
                               type="number"
                               step="1000"
                               oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                               value="<#if post??>${post.price?long?c}</#if>"
                               class="form-control"
                               id="inputPrice">
                        <span class="input-group-text">$</span>
                    </div>
                </div>

                <div class="col mb-3">
                    <label for="inputLocationName" class="form-label"><@spring.message "edit_post.title.inputs.location.name"/></label>
                    <input name="locationName"
                           type="text"
                           minlength="1" maxlength="26" required
                           value="<#if post??>${post.name}</#if>"
                           class="form-control ${(firstNameError??)?string("is-invalid","")}"
                           id="inputLocationName">
                    <div class="invalid-feedback">
                        <#if locationNameError??> ${locationNameError} <#else> <@spring.message "edit_post.title.inputs.location.name.invalid"/> </#if>
                    </div>
                </div>
                <div class="col mb-3">
                    <label for="dropdownLocationCityValue" class="form-label"><@spring.message "edit_post.title.inputs.location.city"/></label>
                    <select class="form-select w-100" id="dropdownLocationCityValue" aria-label="<@spring.message "real_estate.group_control.dropdown_city"/>">
                        <option value="" selected><@spring.message "real_estate.group_control.dropdown_city"/></option>
                        <#list cities as city>
                            <option <#if post.cityValue == city>selected</#if>>${city}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="row row-cols-1 row-cols-md-2">
                <div class="col mb-3">
                    <label for="inputLocationLatitude" class="form-label"><@spring.message "edit_post.title.inputs.location.latitude"/></label>
                    <input name="locationLatitude"
                           type="number"
                           step="0.005"
                           value="<#if post??>${post.latitude?string("0.######")}</#if>"
                           class="form-control"
                           id="inputLocationLatitude">
                </div>

                <div class="col mb-3">
                    <label for="inputLocationLongitude" class="form-label"><@spring.message "edit_post.title.inputs.location.longitude"/></label>
                    <input name="locationLongitude"
                           type="number"
                           step="0.005"
                           value="<#if post??>${post.longitude?string("0.######")}</#if>"
                           class="form-control"
                           id="inputLocationLongitude">
                </div>
            </div>
        </div>
    </div>


    <div class="block_container">
        <div class="container">
            <h2 class="text-start"><@spring.message "real_estate.show.specifications"/></h2>
            <div class="btn-group d-flex justify-content-center mb-3" id="real_estate_radio_group" role="group">
                <input type="radio" class="btn-check" name="real_estate_type" id="radio_apartment" autocomplete="off" <#if realEstateType == "APARTMENT">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_apartment"><@spring.message "real_estate.group_control.apartments"/></label>

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_house" autocomplete="off" <#if realEstateType == "HOUSE">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_house"><@spring.message "real_estate.group_control.houses"/></label>

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_land" autocomplete="off" <#if realEstateType == "LAND">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_land"><@spring.message "real_estate.group_control.land"/></label>

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_business" autocomplete="off" <#if realEstateType == "BUSINESS">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_business"><@spring.message "real_estate.group_control.ready_business"/></label>

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_rent" autocomplete="off" <#if realEstateType == "RENT">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_rent"><@spring.message "real_estate.group_control.rent"/></label>

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_villa" autocomplete="off" <#if realEstateType == "VILLA">checked</#if>>
                <label class="btn btn-outline-dark" for="radio_villa"><@spring.message "real_estate.group_control.villas"/></label>
            </div>

            <div class="row row-cols-1 row-cols-md-3">
                <div class="col mb-3">
                    <label for="inputArea" class="form-label"><@spring.message "real_estate.show.specifications.area"/></label>
                    <div class="input-group">
                        <input name="area"
                               type="number"
                               step="0.5"
    <#--                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"-->
                               value="<#if post??>${post.area?double?c}</#if>"
                               class="form-control"
                               id="inputArea">
                        <span class="input-group-text">m.<sup>2</sup></span>
                    </div>
                </div>

                <div class="col mb-3">
                    <label for="inputBedrooms" class="form-label"><@spring.message "real_estate.show.specifications.bedrooms"/></label>
                    <input name="bedrooms"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.bedrooms}</#if>"
                           class="form-control"
                           id="inputBedrooms">
                </div>

                <div class="col mb-3">
                    <label for="inputBathrooms" class="form-label"><@spring.message "real_estate.show.specifications.bathrooms"/></label>
                    <input name="bathrooms"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.bathrooms}</#if>"
                           class="form-control"
                           id="inputBathrooms">
                </div>

                <div class="col mb-3">
                    <label for="inputGuestBathrooms" class="form-label"><@spring.message "real_estate.show.specifications.guest_bathrooms"/></label>
                    <input name="guestBathrooms"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.guestBathrooms}</#if>"
                           class="form-control"
                           id="inputGuestBathrooms">
                </div>

                <div class="col mb-3">
                    <label for="inputKitchen" class="form-label"><@spring.message "real_estate.show.specifications.kitchen"/></label>
                    <input name="kitchen"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.kitchen}</#if>"
                           class="form-control"
                           id="inputKitchen">
                </div>

                <div class="col mb-3">
                    <label for="inputLivingRoom" class="form-label"><@spring.message "real_estate.show.specifications.living_room"/></label>
                    <input name="livingRoom"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.livingRoom}</#if>"
                           class="form-control"
                           id="inputLivingRoom">
                </div>

                <div class="col mb-3">
                    <label for="inputTerrace" class="form-label"><@spring.message "real_estate.show.specifications.terrace"/></label>
                    <input name="terrace"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.terrace}</#if>"
                           class="form-control"
                           id="inputTerrace">
                </div>

                <div class="col mb-3">
                    <label for="inputSwimmingPool" class="form-label"><@spring.message "real_estate.show.specifications.swimming_pool"/></label>
                    <input name="swimmingPool"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.swimmingPool}</#if>"
                           class="form-control"
                           id="inputSwimmingPool">
                </div>

                <div class="col mb-3">
                    <label for="inputParking" class="form-label"><@spring.message "real_estate.show.specifications.parking"/></label>
                    <input name="parking"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.parking}</#if>"
                           class="form-control"
                           id="inputParking">
                </div>

                <div class="col mb-3">
                    <label for="inputBarbecueArea" class="form-label"><@spring.message "real_estate.show.specifications.barbecue_area"/></label>
                    <input name="barbecueArea"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.barbecueArea}</#if>"
                           class="form-control"
                           id="inputBarbecueArea">
                </div>

                <div class="col mb-3">
                    <label for="inputGym" class="form-label"><@spring.message "real_estate.show.specifications.gym"/></label>
                    <input name="gym"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.gym}</#if>"
                           class="form-control"
                           id="inputGym">
                </div>

                <div class="col mb-3">
                    <label for="inputGolf" class="form-label"><@spring.message "real_estate.show.specifications.golf"/></label>
                    <input name="golf"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.golf}</#if>"
                           class="form-control"
                           id="inputGolf">
                </div>

                <div class="col mb-3">
                    <label for="inputTennis" class="form-label"><@spring.message "real_estate.show.specifications.tennis"/></label>
                    <input name="tennis"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.tennis}</#if>"
                           class="form-control"
                           id="inputTennis">
                </div>

                <div class="col mb-3">
                    <label for="inputMall" class="form-label"><@spring.message "real_estate.show.specifications.mall"/></label>
                    <input name="mall"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.mall}</#if>"
                           class="form-control"
                           id="inputMall">
                </div>

                <div class="col mb-3">
                        <label for="inputBeach" class="form-label"><@spring.message "real_estate.show.specifications.beach"/></label>
                    <div class="input-group">
                        <input name="beach"
                               type="number"
                               oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                               value="<#if post??>${post.beach}</#if>"
                               class="form-control"
                               id="inputBeach">
                        <span class="input-group-text">m.</span>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container-xl block">

            <h2 class="text-start"><@spring.message "edit_post.title.h2.description"/></h2>

            <div id="description_invalid" class="alert alert-danger" role="alert" hidden><@spring.message code="edit_post.invalids.description"/></div>

            <ul class="nav nav-pills nav-justified pb-3" id="locale_description">
                <#if localizedBodies??>
                    <#assign index=0>
                    <#list localizedBodies as body>
                        <li class="nav-item">
                            <a class="nav-link <#if index==0>active</#if>" onclick="changeDescriptionLocale(event)" id="locale_description_${body.localeCode}">${body.localeCode}</a>
                        </li>
                        <#assign index++/>
                    </#list>
                </#if>
            </ul>

            <#if localizedBodies??>
                <#assign index=0>
                <#list localizedBodies as body>
                    <div name="input_description_container" id="input_description_container_${body.localeCode}" <#if index != 0>hidden</#if>>
                        <div id="input_description_${body.localeCode}" data-tiny-editor style="height: 300px; overflow: auto; border: none; background: #f8f9fa; border-radius: .6rem"
                             data-formatblock="no"
                             data-underline="no"
                             data-fontname="no"
                             data-forecolor="no"
                             data-justifyleft="no"
                             data-justifycenter="no"
                             data-justifyright="no"
                             data-insertorderedlist="no"
                             data-outdent="no"
                             data-indent="no"
                             data-remove-format="no">
                            ${body.description!''}
                        </div>
                    </div>
                    <#assign index++/>
                </#list>
            </#if>
        </div>
    </div>




    <div class="block_container">
        <div class="container-xl block">
            <h2 class="text-start"><@spring.message "edit_post.title.h2.features"/></h2>

            <div id="features_invalid" class="alert alert-danger" role="alert" hidden><@spring.message code="edit_post.invalids.features"/></div>

            <ul class="nav nav-pills nav-justified pb-3" id="locale_features">
                <#if localizedBodies??>
                    <#assign index=0>
                    <#list localizedBodies as body>
                        <li class="nav-item">
                            <a class="nav-link <#if index==0>active</#if>" onclick="changeFeaturesLocale(event)" id="locale_features_${body.localeCode}">${body.localeCode}</a>
                        </li>
                        <#assign index++/>
                    </#list>
                </#if>
            </ul>

            <#if localizedBodies??>
                <#assign index=0>
                <#list localizedBodies as body>
                    <div name="input_features_container" id="input_features_container_${body.localeCode}" <#if index != 0>hidden</#if>>
                        <div id="input_features_${body.localeCode}" data-tiny-editor style="height: 300px; overflow: auto; border: none; background: #f8f9fa; border-radius: .6rem"
                             data-formatblock="no"
                             data-underline="no"
                             data-fontname="no"
                             data-forecolor="no"
                             data-justifyleft="no"
                             data-justifycenter="no"
                             data-justifyright="no"
                             data-insertorderedlist="no"
                             data-outdent="no"
                             data-indent="no"
                             data-remove-format="no">
                            ${body.features!''}
                        </div>
                    </div>
                    <#assign index++/>
                </#list>
            </#if>

        </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container">
            <div class="row row-cols-1 row-cols-md-3">
                <div class="col mb-3">
                    <button class="btn btn-danger mb-3 w-100" onclick="disablePost()" type="button"><@spring.message "edit_post.buttons.disable"/></button>
                </div>
                <div class="col mb-3">
                    <button class="btn btn-success mb-3 w-100" onclick="soldOutPost()" type="button"><@spring.message "edit_post.buttons.sold_out"/></button>
                </div>
                <div class="col mb-3">
                    <button id="btn_submit_user" class="btn btn-primary mb-3 w-100" onclick="savePostUser()" type="submit"><@spring.message "edit_post.buttons.submit"/></button>
                    <#if security.know && security.auth_user.isAdmin()>
                        <button id="btn_submit_sudo" class="btn btn-light mb-3 w-100" onclick="savePostSudo()" type="submit">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="currentColor" class="bi bi-exclamation-triangle-fill me-3" viewBox="0 0 16 16">
                                <path d="M8.982 1.566a1.13 1.13 0 0 0-1.96 0L.165 13.233c-.457.778.091 1.767.98 1.767h13.713c.889 0 1.438-.99.98-1.767L8.982 1.566zM8 5c.535 0 .954.462.9.995l-.35 3.507a.552.552 0 0 1-1.1 0L7.1 5.995A.905.905 0 0 1 8 5zm.002 6a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                            </svg>
                            <@spring.message "edit_post.buttons.sudo_submit"/></button>
                    </#if>
                </div>
        <#--        <div class="container-xl block d-flex justify-content-end row">-->
        <#--        </div>-->
            </div>
        </div>
    </div>


    <template id="post_image_template">
        <@item.post_image/>
    </template>

    <script src="/static/js/editPost.js"></script>
    <script src="/static/node_modules/tiny-editor/dist/bundle.js"></script>
</@common.page>