<#macro termsAcceptance>
    <#if termsAcceptanceRequired??>
        <div class="form-group">
            <div class="${properties.kcInputWrapperClass!}">
                <div class="${properties.kcLabelClass!}">
                    ${msg("termsTitle")} *
                </div>
                <div id="kc-registration-terms-text">
                    ${kcSanitize(msg("termsText"))?no_esc}
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="${properties.kcLabelWrapperClass!} multiple-choice">
                <input type="checkbox" id="termsAccepted" name="termsAccepted" class="${properties.kcCheckboxInputClass!}"
                       aria-invalid="<#if messagesPerField.existsError('termsAccepted')>true</#if>"
                />
                <label for="termsAccepted" >${msg("acceptTerms")}</label>
            </div>

        </div>
    </#if>
</#macro>