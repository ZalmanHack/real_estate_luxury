<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="edit_post.title"/> <@spring.message code="edit_post.title.h1"/> ${post.locationName}</#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1><@spring.message "edit_post.title.h1"/></h1>
                <h2>"${post.locationName}"</h2>
            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container-xl block">
            <h2 class="text-start">Загрузка изображений</h2>
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
                                <button type="button" class="btn btn-outline-danger mt-3" id="btn_delete_img_${image.id}" onclick="deleteImg(event)" >удалить</button>
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
                    <input name="price"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.price}</#if>"
                           class="form-control"
                           id="inputPrice">
                </div>

                <div class="col mb-3">
                    <label for="inputLocationName" class="form-label"><@spring.message "edit_post.title.inputs.location.name"/></label>
                    <input name="locationName"
                           type="text"
                           minlength="1" maxlength="26" required
                           value="<#if post??>${post.locationName}</#if>"
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
                            <option <#if post.locationCityValue == city>selected</#if>>${city}</option>
                        </#list>
                    </select>
                </div>
            </div>

            <div class="row row-cols-1 row-cols-md-2">
                <div class="col mb-3">
                    <label for="inputLocationLatitude" class="form-label"><@spring.message "edit_post.title.inputs.location.latitude"/></label>
                    <input name="locationLatitude"
                           type="number"
                           value="<#if post??>${post.locationLatitude?string("0.######")}</#if>"
                           class="form-control"
                           id="inputLocationLatitude">
                </div>

                <div class="col mb-3">
                    <label for="inputLocationLongitude" class="form-label"><@spring.message "edit_post.title.inputs.location.longitude"/></label>
                    <input name="locationLongitude"
                           type="number"
                           value="<#if post??>${post.locationLongitude?string("0.######")}</#if>"
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

                <input type="radio" class="btn-check" name="real_estate_type" id="radio_land" autocomplete="off <#if realEstateType == "LAND">checked</#if>">
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
                    <input name="area"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.area}</#if>"
                           class="form-control"
                           id="inputArea">
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
                    <input name="beach"
                           type="number"
                           oninput="this.value=this.value.replace(/[^0-9]/g, '').replace(/(\..*)\./g, '$1');"
                           value="<#if post??>${post.beach}</#if>"
                           class="form-control"
                           id="inputBeach">
                </div>
            </div>
        </div>
    </div>



    <div class="block_container">
        <div class="container-xl block">

            <h2 class="text-start">Описание</h2>
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
            <h2 class="text-start">Особенности</h2>
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

    <div class="block_container">
        <div class="container-xl block d-flex justify-content-end row">
            <button class="btn btn-danger mb-3" type="button">Отключить</button>
            <button class="btn btn-primary mb-3 ms-3" onclick="savePost(event)" type="submit">Отправить на рассмотрение</button>
        </div>
    </div>


    <template id="post_image_template">
        <@item.post_image/>
    </template>

    <script src="/static/js/editPost.js"></script>
    <script src="/static/node_modules/tiny-editor/dist/bundle.js"></script>
</@common.page>