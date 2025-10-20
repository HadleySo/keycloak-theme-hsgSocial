<#macro logoutOtherSessions>
    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
        <div class="${properties.kcFormOptionsWrapperClass!}">
            <div class="checkbox form-group">
                <div class="multiple-choice">
                    <input type="checkbox" id="logout-sessions" class="${properties.kcCheckboxLabelClass}" name="logout-sessions" value="on">
                    <label for="logout-sessions">${msg("logoutOtherSessions")}</label>
                </div>
            </div>
        </div>
    </div>
</#macro>
