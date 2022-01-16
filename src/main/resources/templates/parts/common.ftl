<#import "/spring.ftl" as spring/>
<#import "security.ftl" as security/>
<#import "loader.ftl" as loader/>

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="navbar-air">
        <div class="container-xxl">
            <button id="navbar-toggler" class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-lg-0 ms-auto">
                    <li class="nav-item px-2">
                        <a class="nav-link active" aria-current="page" href="/home"><@spring.message "navbar.main"/></a>
                    </li>
<#--                    <li class="nav-item px-2">-->
<#--                        <a class="nav-link" href="/#real_estate_info_block"><@spring.message "navbar.immigration"/></a>-->
<#--                    </li>-->
                    <li class="nav-item px-2">
                        <a class="nav-link" href="/real_estate"><@spring.message "navbar.real_estate"/></a>
                    </li>
<#--                    <li class="nav-item px-2">-->
<#--                        <a class="nav-link" href="#"><@spring.message "navbar.about"/></a>-->
<#--                    </li>-->

                    <li class="nav-item ps-2">
                        <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#feedbackModal"><@spring.message "navbar.callback"/></a>
                    </li>

                    <li class="nav-item ps-2">
                        <a class="nav-link" href="#real_estate_footer_contacts"><@spring.message "navbar.contacts"/></a>
                    </li>


                    <li class="nav-item px-2 dropdown ps-2 pe-5">
                        <a class="nav-link dropdown-toggle" href="#"
                           id="navbarDropdown" role="button"
                           data-bs-toggle="dropdown"
                           aria-expanded="false"><@spring.message "navbar.language"/></a>
                        <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <li><a class="dropdown-item" href="?language=en">English <!></a></li>
                            <li><a class="dropdown-item" href="?language=es">Español <!></a></li>
                            <li><a class="dropdown-item" href="?language=ru">Русский <!></a></li>
                        </ul>
                    </li>



                    <#if security.know>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarScrollingDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                ${security.auth_user.username}
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarScrollingDropdown">
                                <li><a class="dropdown-item" href="#"><@spring.message "navbar.auth.profile"/></a></li>
                                <li><a class="dropdown-item" href="#"><@spring.message "navbar.auth.settings"/></a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item text-danger" href="/logout"><@spring.message "navbar.auth.logout"/></a></li>
                            </ul>
                        </li>
                    <#else>
                        <li class="nav-item ms-2">
                            <a href="/login" id="btn-navbar-login" class="nav-link"><@spring.message "navbar.auth.sign_in"/></a>
                        </li>
                        <li class="nav-item ms-2">
                            <a href="/registration" id="btn-regist" class="btn btn-outline-light"><@spring.message "navbar.auth.sign_up"/></a>
                        </li>
                    </#if>


                </ul>
            </div>
        </div>
    </nav>
</#macro>


<#macro footer>
    <div class="block_container light-100 before_footer">
    </div>
    <div class="footer">
        <!-- Footer -->
        <footer class="text-center text-lg-start bg-light text-muted" id="real_estate_footer_contacts">
            <section
                    class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
                <div class="me-5 d-none d-lg-block">
                    <span><@spring.message "navbar.social_info"/></span>
                </div>
                <div>
                    <a href="mailto:coconutvillages@gmail.com" class="me-4 text-reset text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><path d="M0 0h24v24H0V0z" fill="none"/>
                            <path d="M12 1.95c-5.52 0-10 4.48-10 10s4.48 10 10 10h5v-2h-5c-4.34 0-8-3.66-8-8s3.66-8 8-8 8 3.66 8 8v1.43c0 .79-.71 1.57-1.5 1.57s-1.5-.78-1.5-1.57v-1.43c0-2.76-2.24-5-5-5s-5 2.24-5 5 2.24 5 5 5c1.38 0 2.64-.56 3.54-1.47.65.89 1.77 1.47 2.96 1.47 1.97 0 3.5-1.6 3.5-3.57v-1.43c0-5.52-4.48-10-10-10zm0 13c-1.66 0-3-1.34-3-3s1.34-3 3-3 3 1.34 3 3-1.34 3-3 3z"/>
                        </svg>
                    </a>
                    <a href="https://api.whatsapp.com/send?phone=18095041326&text=&source=&data=" target="_blank" rel="noopener noreferrer" class="me-4 text-reset text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" height="24px" viewBox="0 0 24 24" width="24px" fill="currentColor"><g><rect fill="none" height="24" width="24" y="0"/>
                            </g><g><g><g><path d="M19.05,4.91C17.18,3.03,14.69,2,12.04,2c-5.46,0-9.91,4.45-9.91,9.91c0,1.75,0.46,3.45,1.32,4.95L2.05,22l5.25-1.38 c1.45,0.79,3.08,1.21,4.74,1.21h0c0,0,0,0,0,0c5.46,0,9.91-4.45,9.91-9.91C21.95,9.27,20.92,6.78,19.05,4.91z M12.04,20.15 L12.04,20.15c-1.48,0-2.93-0.4-4.2-1.15l-0.3-0.18l-3.12,0.82l0.83-3.04l-0.2-0.31c-0.82-1.31-1.26-2.83-1.26-4.38 c0-4.54,3.7-8.24,8.24-8.24c2.2,0,4.27,0.86,5.82,2.42c1.56,1.56,2.41,3.63,2.41,5.83C20.28,16.46,16.58,20.15,12.04,20.15z M16.56,13.99c-0.25-0.12-1.47-0.72-1.69-0.81c-0.23-0.08-0.39-0.12-0.56,0.12c-0.17,0.25-0.64,0.81-0.78,0.97 c-0.14,0.17-0.29,0.19-0.54,0.06c-0.25-0.12-1.05-0.39-1.99-1.23c-0.74-0.66-1.23-1.47-1.38-1.72c-0.14-0.25-0.02-0.38,0.11-0.51 c0.11-0.11,0.25-0.29,0.37-0.43c0.12-0.14,0.17-0.25,0.25-0.41c0.08-0.17,0.04-0.31-0.02-0.43c-0.06-0.12-0.56-1.34-0.76-1.84 c-0.2-0.48-0.41-0.42-0.56-0.43C8.86,7.33,8.7,7.33,8.53,7.33c-0.17,0-0.43,0.06-0.66,0.31C7.65,7.89,7.01,8.49,7.01,9.71 c0,1.22,0.89,2.4,1.01,2.56c0.12,0.17,1.75,2.67,4.23,3.74c0.59,0.26,1.05,0.41,1.41,0.52c0.59,0.19,1.13,0.16,1.56,0.1 c0.48-0.07,1.47-0.6,1.67-1.18c0.21-0.58,0.21-1.07,0.14-1.18S16.81,14.11,16.56,13.99z"/></g></g></g>
                        </svg>
                    </a>
                    <a href="https://www.instagram.com/realestateluxury.do/" target="_blank" rel="noopener noreferrer" class="me-4 text-reset text-decoration-none">
                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="currentColor">
                            <path d="M12 2.163c3.204 0 3.584.012 4.85.07 3.252.148 4.771 1.691 4.919 4.919.058 1.265.069 1.645.069 4.849 0 3.205-.012 3.584-.069 4.849-.149 3.225-1.664 4.771-4.919 4.919-1.266.058-1.644.07-4.85.07-3.204 0-3.584-.012-4.849-.07-3.26-.149-4.771-1.699-4.919-4.92-.058-1.265-.07-1.644-.07-4.849 0-3.204.013-3.583.07-4.849.149-3.227 1.664-4.771 4.919-4.919 1.266-.057 1.645-.069 4.849-.069zm0-2.163c-3.259 0-3.667.014-4.947.072-4.358.2-6.78 2.618-6.98 6.98-.059 1.281-.073 1.689-.073 4.948 0 3.259.014 3.668.072 4.948.2 4.358 2.618 6.78 6.98 6.98 1.281.058 1.689.072 4.948.072 3.259 0 3.668-.014 4.948-.072 4.354-.2 6.782-2.618 6.979-6.98.059-1.28.073-1.689.073-4.948 0-3.259-.014-3.667-.072-4.947-.196-4.354-2.617-6.78-6.979-6.98-1.281-.059-1.69-.073-4.949-.073zm0 5.838c-3.403 0-6.162 2.759-6.162 6.162s2.759 6.163 6.162 6.163 6.162-2.759 6.162-6.163c0-3.403-2.759-6.162-6.162-6.162zm0 10.162c-2.209 0-4-1.79-4-4 0-2.209 1.791-4 4-4s4 1.791 4 4c0 2.21-1.791 4-4 4zm6.406-11.845c-.796 0-1.441.645-1.441 1.44s.645 1.44 1.441 1.44c.795 0 1.439-.645 1.439-1.44s-.644-1.44-1.439-1.44z"/>
                        </svg>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-linkedin"></i>
                    </a>
                    <a href="" class="me-4 text-reset">
                        <i class="fab fa-github"></i>
                    </a>
                </div>
            </section>
            <section class="">
                <div class="container text-center text-md-start mt-5">
                    <div class="row mt-3">
                        <div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                Real Estate Luxury
                            </h6>
                            <p><@spring.message "home.title.text"/></p>
                        </div>
                        <div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                <@spring.message "navbar.useful_links"/>
                            </h6>
                            <p><a href="/home" class="text-reset"><@spring.message "navbar.main"/></a></p>
                            <p><a href="real_estate/" class="text-reset"><@spring.message "navbar.real_estate"/></a></p>
                            <p><a href="#" data-bs-toggle="modal" data-bs-target="#feedbackModal" class="text-reset"><@spring.message "navbar.callback"/></a></p>
                        </div>
                        <!-- Grid column -->

                        <!-- Grid column -->
                        <div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
                            <h6 class="text-uppercase fw-bold mb-4">
                                <@spring.message "navbar.contacts"/>
                            </h6>
                            <p>
                                <a class="text-reset text-decoration-none" href="https://www.instagram.com/realestateluxury.do/" target="_blank" rel="noopener noreferrer">
                                    @realestateluxury.do
                                </a>
                            </p>
                            <p>
                                <a href="mailto:coconutvillages@gmail.com" class=" text-reset text-decoration-none">
                                    coconutvillages@gmail.com
                                </a>
                            </p>
                            <p class=" text-reset text-decoration-none">
                                +1 809 504 13 26
                            </p>
                        </div>
                    </div>
                </div>
            </section>
            <div class="text-center p-4" style="background-color: rgba(0, 0, 0, 0.05);">
                © 2022 Copyright:
                <a class="text-reset fw-bold" href="https://real-estate-luxury.com/">real-estate-luxury.com</a>
            </div>
            <!-- Copyright -->
        </footer>
        <!-- Footer -->
    </div>
</#macro>

<#macro callback_modal>
    <!-- Modal -->
    <div class="modal fade" id="feedbackModal" tabindex="-1" aria-labelledby="feedbackModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <form id="modalFeedback">
                    <div class="modal-header">
                        <h5 class="modal-title" id="feedbackModalLabel"><@spring.message "modal_callback"/></h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="alert alert-danger mb-3" role="alert" id="modalAlertError" hidden>
                            <@spring.message "modal_callback.error"/>
                        </div>
                        <div class="mb-3">
                            <label for="emailCallbackInput" class="form-label" ><@spring.message "modal_callback.email"/> <span class="text-danger">*</span></label>
                            <input name="email"  type="email" minlength="1" maxlength="100" pattern="(^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$)" class="form-control" id="emailCallbackInput" placeholder="name@example.com" required>
                            <div class="invalid-feedback" id="modalEmailInvalidFeedback">
                                <@spring.message "modal_callback.email.invalid"/>
                            </div>
                            <#--                        is-invalid-->
                        </div>


                        <div class="mb-3">
                            <label for="nameCallbackInput" class="form-label"><@spring.message "modal_callback.name"/> <span class="text-danger">*</span></label>
                            <input type="text" name="name" minlength="1" maxlength="50" class="form-control" id="nameCallbackInput" placeholder="" required>
                            <div class="invalid-feedback" id="modalNameInvalidFeedback">
                                <@spring.message "modal_callback.name.invalid"/>
                            </div>
                        </div>
                        <div class="mb-3">
                            <label for="questionCallbackTextarea" class="form-label"><@spring.message "modal_callback.question"/> <span class="text-danger">*</span></label>
                            <textarea name="question" minlength="1" rows="10" maxlength="1024" class="form-control" id="questionCallbackTextarea" rows="3" required></textarea>
                            <div class="invalid-feedback" id="modalQuestionInvalidFeedback">
                                <@spring.message "modal_callback.question.invalid"/>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" id="modalButtonFeedback" class="btn btn-primary"><@spring.message "modal_callback.send"/>
                            <span class="spinner-border spinner-border-sm" role="status" aria-hidden="true" id="modalButtonLoader" hidden></span>
                        </button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</#macro>

<#macro page title>
    <!DOCTYPE html>
    <html lang="<@spring.message 'navbar.language.code'/>">
    <head>
        <title>${title}</title>
        <meta charset="UTF-8">
        <!-- Для корректного отображения на рэкранах с разной плотностью -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="_csrf" content="${_csrf.token}"/>
        <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <link rel="shortcut icon" href="/static/favicon.ico">
        <link rel="stylesheet" href="/static/css/style.css">
        <link rel="stylesheet" href="/static/node_modules/@splidejs/splide/dist/css/splide.min.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
        <link rel="stylesheet" href="/static/intl_tel_input/css/intlTelInput.css">
    </head>
    <body>
    <@callback_modal/>
    <div class="wrapper">
        <@navbar/>
        <#nested>
        <@footer/>
    </div>

    <template id="loader_template">
        <@loader.loader/>
    </template>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="/static/js/script.js"></script>
    <script src="/static/node_modules/@splidejs/splide/dist/js/splide.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"
            integrity="sha512-XQoYMqMTK8LvdxXYG3nZ448hOEQiglfqkJs1NOQV44cWnUrBc8PkAOcXy20w0vlaXaVUearIOBhiXZ5V3ynxwA=="
            crossorigin=""></script>
    <script src="/static/intl_tel_input/js/intlTelInput.min.js"></script>
    </body>
    </html>
</#macro>