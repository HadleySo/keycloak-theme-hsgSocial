<#import "template.ftl" as layout>
<#import "passkeys.ftl" as passkeys>
<@layout.registrationLayout displayInfo=social.displayInfo; section>
    <#if section = "title">
        ${msg("loginTitle",(realm.displayName!''))}
    <#elseif section = "header">
        ${msg("loginTitleHtml",(realm.displayNameHtml!''))?no_esc}
    <#elseif section = "form">
        <#if realm.password>
            <form id="kc-form-login" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="username" class="${properties.kcLabelClass!}"><#if !realm.loginWithEmailAllowed>${msg("username")}<#elseif !realm.registrationEmailAsUsername>${msg("usernameOrEmail")}<#else>${msg("email")}</#if></label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <#if usernameEditDisabled??>
                            <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" disabled />
                        <#else>
                            <input id="username" class="${properties.kcInputClass!}" name="username" value="${(login.username!'')}" type="text" autofocus autocomplete="${(enableWebAuthnConditionalUI?has_content)?then('section-${realm.name} username webauthn', 'section-${realm.name} username')}" />
                        </#if>
                    </div>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div class="${properties.kcLabelWrapperClass!}">
                        <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                    </div>

                    <div class="${properties.kcInputWrapperClass!}">
                        <input id="password" class="${properties.kcInputClass!}" name="password" type="password" autocomplete="section-${realm.name} password" />
                    </div>
                </div>


                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <#if realm.rememberMe && !usernameEditDisabled??>
                            <div class="checkbox ${properties.kcFormGroupClass}">
                                <div class="multiple-choice">
                                    <#if login.rememberMe??>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3" checked>
                                        <label for="rememberMe" class="${properties.kcCheckboxLabelClass}">${msg("rememberMe")}</label>
                                    <#else>
                                        <input id="rememberMe" name="rememberMe" type="checkbox" tabindex="3">
                                        <label for="rememberMe" class="${properties.kcCheckboxLabelClass}">${msg("rememberMe")}</label>
                                    </#if>
                                </div>
                            </div>
                        </#if>
                    </div>

                    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!} ${properties.kcFormGroupClass}">
                        <div class="${properties.kcFormButtonsWrapperClass!}">
                            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" name="login" id="kc-login" type="submit" value="${msg("doLogIn")}"/>
                        </div>
                    </div>

                        <div class="${properties.kcFormOptionsWrapperClass!} ${properties.kcFormGroupClass}">
                            <#if realm.resetPasswordAllowed>
                                <p><a href="${url.loginResetCredentialsUrl}">${msg("doForgotPassword")}</a></p>
                            </#if>
                        </div>
            </form>
        </#if>

    <#elseif section = "info" >
        <#if realm.password && realm.registrationAllowed && !usernameEditDisabled??>
            <div id="kc-registration">
                <h2 class="heading-medium">${msg("noAccount")}</h2>
                <p><a href="${url.registrationUrl}">${msg("registerLink")}</a></p>
            </div>
        </#if>
    <#elseif section = "socialProviders" >


        <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">

            <#if auth.authenticationSelections?size gt 1 >
                <h2 class="heading-medium">${msg("identity-provider-login-label")}</h2>
            <#elseif enableWebAuthnConditionalUI?has_content>
                <h2 class="heading-medium">${msg("identity-provider-login-label")}</h2>
            <#elseif social.providers?has_content>
                <h2 class="heading-medium">${msg("identity-provider-login-label")}</h2>
            </#if>

            <div class="${properties.kcSelectAuthListClass!}">
                <#list auth.authenticationSelections as authenticationSelection>
                    <#if '${authenticationSelection.displayName}' != "auth-username-password-form-display-name">
                        <button class="${properties.kcButtonClass!} button-alt" type="submit" name="authenticationExecution" value="${authenticationSelection.authExecId}">
                            ${msg('${authenticationSelection.displayName}')}
                        </button>
                    </#if>
                </#list>
                <#if auth.authenticationSelections?size gt 1 >
                    <hr>
                </#if>
            </div>
        </form>
        <@passkeys.conditionalUIData />

        <#if realm.password && social?? && social.providers?has_content>
            <div id="kc-social-providers" class="${properties.kcFormSocialAccountSectionClass!}"> 
                <p style="text-align:left; font-size: medium;">
                    By clicking the buttons below, you consent to the transfer of your request to the provider and to request your user id, login name, name, and e-mail for authenticating you.
                </p>

                <#list social.providers as p>
                    <a id="social-${p.alias}" class="button button-alt"
                            type="button" href="${p.loginUrl}">
                        ${p.displayName!}
                    </a>
                </#list>
            </div>
        </#if>




    </#if>
    
</@layout.registrationLayout>
