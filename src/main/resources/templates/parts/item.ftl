<#import "/spring.ftl" as spring>

<#macro real_estate>
    <div class="card card_item mb-3 shadow-sm">
        <div id="card_image"></div>
        <div class="card-body">
            <div class="wrapper">
                <div>
                    <div class="d-flex flex-row me-auto">
                        <span class="badge rounded-pill bg-primary mb-2 me-3" id="card_recovends"></span>
                        <span class="badge rounded-pill bg-dark mb-2 me-3" id="card_real_estate_type"></span>
                    </div>
                    <h3 class="card-title" id="card_title"></h3>
                    <p class="card-text" id="card_description"></p>
                </div>
                <div style="flex: 1 1 auto"></div>
                <div class="d-flex justify-content-end mt-3">
                    <p class="card-text me-3  mb-0"><@spring.message "real_estate.item.from"/></p>
                    <p class="card-text fw-bold  mb-0" id="card_price"></p>
                    <p class="card-text fw-bold  mb-0">$</p>
                </div>
                <a class="btn btn-outline-dark d-flex justify-content-center mt-3 " href="#" role="button"><@spring.message "real_estate.item.open"/></a>
            </div>
        </div>
    </div>
</#macro>

<#macro card_image>
    <img style="height: 300px" src="" class="card-img-top" alt="" id="main_image">
</#macro>

<#macro card_alter_image>
    <div class="card-img-top d-flex bg-dark bg-opacity-10" style="height: 300px" id="alter_main_image">
        <svg xmlns="http://www.w3.org/2000/svg" width="64" height="64" fill="currentColor" class="bi bi-card-image d-block mx-auto my-auto" viewBox="0 0 16 16">
            <path d="M6.002 5.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0z"/>
            <path d="M1.5 2A1.5 1.5 0 0 0 0 3.5v9A1.5 1.5 0 0 0 1.5 14h13a1.5 1.5 0 0 0 1.5-1.5v-9A1.5 1.5 0 0 0 14.5 2h-13zm13 1a.5.5 0 0 1 .5.5v6l-3.775-1.947a.5.5 0 0 0-.577.093l-3.71 3.71-2.66-1.772a.5.5 0 0 0-.63.062L1.002 12v.54A.505.505 0 0 1 1 12.5v-9a.5.5 0 0 1 .5-.5h13z"/>
        </svg>
    </div>
</#macro>

<#macro table_body>
    <tr>
        <td></td>
        <td class="text-end"></td>
    </tr>
</#macro>


<#--                    <table class="table table-sm table-borderless my-3" style="font-size: 0.75rem;">-->
<#--                        <tbody>-->

<#--                        </tbody>-->
<#--                    </table>-->