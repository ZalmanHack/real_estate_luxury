<#import 'parts/common.ftl' as common>
<#import "/spring.ftl" as spring>
<#import "parts/item.ftl" as item>

<#--Также можно еще:-->
<#--<#assign title> <@spring.message code="home.title"/> + какой то текст </#assign>-->
<#assign title><@spring.message code="sign_up.title"/></#assign>

<@common.page title>
    <div class="img_parallax" style="background-image: url('/static/img/bg.jpg');">
        <#-- в диве был screen-50 -->
        <div class="block_container dark-50 text-light after_navbar">
            <div class="container_center block">
                <h1>Редактирование поста</h1>
            </div>
        </div>
    </div>

    <div class="block_container">
        <div class="container-xl block">
            <h2>Загрузка изображений</h2>
            <div class="" id="control_images_container">

                <div class="input-group py-3" id="img_upload_control">
                    <input type="file" class="form-control" accept="image/*" id="upload_img_input" aria-describedby="upload_img_button" aria-label="Upload">
                    <button class="btn btn-dark" type="button" id="upload_img_button" onclick="">Загрузить</button>
                </div>
                <div id="img_upload_progress_container" hidden>
                    <div class="d-flex align-items-center" style="height: 70px;">
                        <div class="progress w-100">
                            <div class="progress-bar" id="img_upload_progress" role="progressbar" style="width: 50%" aria-valuenow="0" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>



                <div class="files_container" id="images_container">

                </div>


            </div>
        </div>
    </div>


    <div class="block_container">
        <div class="container">
            <h2 class="text-start"><@spring.message "real_estate.show.specifications"/></h2>
            <div class="row row-cols-1 row-cols-md-3">
                <div class="col mb-3">
                    <label for="inputLastName" class="form-label"><@spring.message "sign_up.inputs.last_name"/> <span class="text-danger">*</span></label>
                    <input name="lastName"
                           type="text"
                           minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                           value="<#if user??>${user.lastName}</#if>"
                           class="form-control ${(lastNameError??)?string("is-invalid","")}"
                           id="inputLastName">
                    <div class="invalid-feedback">
                        <#if lastNameError??> ${lastNameError} <#else> <@spring.message "sign_up.inputs.last_name.invalid"/> </#if>
                    </div>
                </div>

                <div class="col mb-3">
                    <label for="inputLastName" class="form-label"><@spring.message "sign_up.inputs.last_name"/> <span class="text-danger">*</span></label>
                    <input name="lastName"
                           type="text"
                           minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                           value="<#if user??>${user.lastName}</#if>"
                           class="form-control ${(lastNameError??)?string("is-invalid","")}"
                           id="inputLastName">
                    <div class="invalid-feedback">
                        <#if lastNameError??> ${lastNameError} <#else> <@spring.message "sign_up.inputs.last_name.invalid"/> </#if>
                    </div>
                </div>

                <div class="col mb-3">
                    <label for="inputLastName" class="form-label"><@spring.message "sign_up.inputs.last_name"/> <span class="text-danger">*</span></label>
                    <input name="lastName"
                           type="text"
                           minlength="1" maxlength="26" pattern="[A-Za-zА-ЯЁа-яё]{1,26}" required
                           value="<#if user??>${user.lastName}</#if>"
                           class="form-control ${(lastNameError??)?string("is-invalid","")}"
                           id="inputLastName">
                    <div class="invalid-feedback">
                        <#if lastNameError??> ${lastNameError} <#else> <@spring.message "sign_up.inputs.last_name.invalid"/> </#if>
                    </div>
                </div>
            </div>

        </div>
    </div>



    <div class="block_container">
        <div class="container-xl block">
            <h2>Описание</h2>
            <ul class="nav nav-pills nav-justified pb-3">
                <li class="nav-item">
                    <a class="nav-link active" href="#">en</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ru</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">es</a>
                </li>
            </ul>
            <div class="" data-tiny-editor style="height: 300px; overflow: auto; border: none; background: #f8f9fa; border-radius: .6rem"
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
                <p></p>
            </div>
        </div>
    </div>




    <div class="block_container">
        <div class="container-xl block">
            <h2>Особенности</h2>
            <ul class="nav nav-pills nav-justified pb-3">
                <li class="nav-item">
                    <a class="nav-link active" href="#">en</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">ru</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">es</a>
                </li>
            </ul>
            <div class="" data-tiny-editor style="height: 300px; overflow: auto; border: none; background: #f8f9fa; border-radius: .6rem"
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
                <p></p>
            </div>
        </div>
    </div>


    <template id="post_image_template">
        <@item.post_image/>
    </template>

    <script src="/static/js/editPost.js"></script>
    <script src="/static/node_modules/tiny-editor/dist/bundle.js"></script>
</@common.page>