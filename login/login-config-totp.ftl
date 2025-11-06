<#import "template.ftl" as layout>
<@layout.registrationLayout displayInfo=true; section>
    <#if section = "title">
        ${msg("loginTotpTitle")}
    <#elseif section = "header">
        ${msg("loginTotpTitle")}
    <#elseif section = "form">
        <ol id="kc-totp-settings" class="list list-number">
            <li>
                <p>${msg("loginTotpStep1")}</p>

                <ul class="list list-bullet">
                    <li>2FAS </li>
                    <li>Apple Passwords </li>
                    <li>DUO</li>
                    <li>Stratum </li>
                    <li>Microsoft Authenticator</li>
                    <li>Google Authenticator</li>
                </ul>
            </li>
            <li>
                <p>${msg("loginTotpStep2")}</p>
                <img id="kc-totp-secret-qr-code" src="data:image/png;base64, ${totp.totpSecretQrCode}" alt="Figure: Barcode"><br/>
                <span class="code" style="user-select: all; -moz-user-select: all; -webkit-user-select: all;">${totp.totpSecretEncoded}</span>
                <ul style="padding-left: 5px; padding-top:15px; padding-bottom:15px;">
                    <li id="kc-totp-type">${msg("loginTotpType")}: ${msg("loginTotp." + totp.policy.type)}</li>
                    <li id="kc-totp-algorithm">${msg("loginTotpAlgorithm")}: ${totp.policy.getAlgorithmKey()}</li>
                    <li id="kc-totp-digits">${msg("loginTotpDigits")}: ${totp.policy.digits}</li>
                    <#if totp.policy.type = "totp">
                        <li id="kc-totp-period">${msg("loginTotpInterval")}: ${totp.policy.period}</li>
                    <#elseif totp.policy.type = "hotp">
                        <li id="kc-totp-counter">${msg("loginTotpCounter")}: ${totp.policy.initialCounter}</li>
                    </#if>
                </ul>
            </li>
            <li>
                <p>${msg("loginTotpStep3")}</p>
            </li>
        </ol>
        <form action="${url.loginAction}" class="${properties.kcFormClass!}" id="kc-totp-settings-form" method="post">
            <div class="${properties.kcFormGroupClass!}">
                <div class="${properties.kcLabelWrapperClass!}">
                    <label for="totp" class="${properties.kcLabelClass!}">${msg("loginOtpOneTime")}</label>
                </div>
                <div class="${properties.kcInputWrapperClass!}">
                    <input type="text" id="totp" name="totp" autocomplete="off" class="${properties.kcInputClass!}" />
                </div>
                <input type="hidden" id="totpSecret" name="totpSecret" value="${totp.totpSecret}" />
            </div>

            <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doSubmit")}"/>
        </form>
    </#if>
</@layout.registrationLayout>
