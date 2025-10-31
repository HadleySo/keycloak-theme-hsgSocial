<#import "template.ftl" as layout>
<@layout.registrationLayout ; section>
    <#if section = "header">
        ${kcSanitize(msg("webauthn-error-title"))?no_esc}
    <#elseif section = "form">

        <script type="text/javascript">
            refreshPage = () => {
                document.getElementById('isSetRetry').value = 'retry';
                document.getElementById('executionValue').value = '${execution}';
                document.getElementById('kc-error-credential-form').requestSubmit();
            }
        </script>

        <form id="kc-error-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}"
              method="post" hidden="hidden">
            <input type="hidden" id="executionValue" name="authenticationExecution"/>
            <input type="hidden" id="isSetRetry" name="isSetRetry"/>
        </form>
        <div style="display: flex; flex-direction: row;">
            <button class="${properties.kcButtonClass!} button" onclick="refreshPage()" type="submit" name="" id="kc-try-again" style="margin-right: 5px;">
                ${msg("doTryAgain")}
            </button>
            <#if !isSetRetry?has_content && isAppInitiatedAction?has_content>
                <form class="${properties.kcFormClass!}" action="${url.loginAction}"
                        id="kc-webauthn-settings-form" method="post">
                    <button class="${properties.kcButtonClass!} button-alt" type="submit" name="cancel-aia" id="cancelWebAuthnAIA">
                        ${msg("doCancel")}
                    </button>
                </form>
            </#if>
        </div>
       
    </#if>
</@layout.registrationLayout>