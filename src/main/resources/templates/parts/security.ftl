<#assign know = Session.SPRING_SECURITY_CONTEXT??>

<#if know>
    <#assign
    auth_user = Session.SPRING_SECURITY_CONTEXT.authentication.principal
    id = auth_user.getId()
    >
<#else>
    <#assign
    id = 0
    >
</#if>
