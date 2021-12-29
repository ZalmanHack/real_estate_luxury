<#import "/spring.ftl" as spring>

<#macro loader>
    <div class="d-flex justify-content-center my-3">
        <div class="spinner-border" role="status">
            <span class="visually-hidden"><@spring.message "loader"/></span>
        </div>
    </div>
</#macro>