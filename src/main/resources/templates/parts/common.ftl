<#import "/spring.ftl" as spring/>
<#import "loader.ftl" as loader/>

<#macro navbar>
    <nav class="navbar navbar-expand-lg navbar-light fixed-top" id="navbar-air">
        <div class="container-xxl">
            <button id="navbar-toggler" class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mb-lg-0 ms-auto me-4">
                    <li class="nav-item px-2">
                        <a class="nav-link active" aria-current="page" href="/"><@spring.message "navbar.main"/></a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link" href="#"><@spring.message "navbar.immigration"/></a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link" href="/real_estate"><@spring.message "navbar.real_estate"/></a>
                    </li>
                    <li class="nav-item px-2">
                        <a class="nav-link" href="#"><@spring.message "navbar.about"/></a>
                    </li>
                    <li class="nav-item ps-2 pe-5">
                        <a class="nav-link" href="#"><@spring.message "navbar.contacts"/></a>
                    </li>

                    <li class="nav-item px-2 dropdown">
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
                </ul>
            </div>
        </div>
    </nav>
</#macro>


<#macro footer>
    <div class="block_container light-100 before_footer">
    </div>
    <div class="footer">
        Soon!
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
        <link rel="stylesheet" href="/static/css/style.css">
        <link rel="stylesheet" href="/static/node_modules/@splidejs/splide/dist/css/splide.min.css">
        <link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css"
              integrity="sha512-xodZBNTC5n17Xt2atTPuE1HxjVMSvLVW9ocqUKLsCC5CXdbqCmblAshOMAS6/keqq/sMZMZ19scR4PsZChSR7A=="
              crossorigin=""/>
    </head>
    <body>
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
    </body>
    </html>
</#macro>