<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=false; section>
<!-- template: select-authenticator.ftl -->

    <#if section = "header" || section = "show-username">
        <#if section = "header">
            ${msg("loginChooseAuthenticator")}
        </#if>
    <#elseif section = "title">
        ${msg("loginChooseAuthenticator")}
    <#elseif section = "form">

    <ul class="${properties.kcSelectAuthListClass!}" role="list" style="padding: 0px;">
        <#list auth.authenticationSelections as authenticationSelection>
            <li class="hsgis-kcSelectAuthListItemWrapperClass" style="padding:15px; margin-bottom: 10px; border: 2px solid #0b0c0c;">
                <form id="kc-select-credential-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <input type="hidden" name="authenticationExecution" value="${authenticationSelection.authExecId}">
                </form>
                <div class="${properties.kcSelectAuthListItemClass!}" onclick="document.forms[${authenticationSelection?index}].requestSubmit()">
                    <div class="pf-v5-c-data-list__item-content">
                        <div class="${properties.kcSelectAuthListItemIconClass!}">
                            <i class="${properties['${authenticationSelection.iconCssClass}']!authenticationSelection.iconCssClass} ${properties.kcSelectAuthListItemIconPropertyClass!}"></i>
                        </div>
                        <div class="${properties.kcSelectAuthListItemBodyClass!}">
                            <h3 class="${properties.kcSelectAuthListItemHeadingClass!}">
                                ${msg('${authenticationSelection.displayName}')}
                            </h3>
                        </div>
                        <div class="${properties.kcSelectAuthListItemDescriptionClass!}">
                            ${msg('${authenticationSelection.helpText}')}
                        </div>
                    </div>
                    <div class="${properties.kcSelectAuthListItemFillClass!}">
                        <i class="${properties.kcSelectAuthListItemArrowIconClass!}" aria-hidden="true"></i>
                    </div>
                </div>
            </li>
        </#list>
    </ul>

    <style>
        .hsgis-kcSelectAuthListItemWrapperClass:hover {
            outline: 3px solid #ffbf47;
            outline-offset: 0;
        }
    </style>

    </#if>
</@layout.registrationLayout>
