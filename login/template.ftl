<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true>
<!DOCTYPE html>


<head>
    <meta charset="utf-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="robots" content="noindex, nofollow">

    <#if properties.meta?has_content>
        <#list properties.meta?split(' ') as meta>
            <meta name="${meta?split('==')[0]}" content="${meta?split('==')[1]}"/>
        </#list>
    </#if>
    <title>${msg("loginTitle",(realm.displayName!''))}</title>


    <link href="${url.resourcesPath}/vendor/hsgis_template/stylesheets/hsgis-template.css?0.22.1" media="screen" rel="stylesheet" />
    <link href="${url.resourcesPath}/vendor/hsgis_template/stylesheets/hsgis-template-print.css?0.22.1" media="print" rel="stylesheet" />

    <link href="${url.resourcesPath}/vendor/hsgis_template/stylesheets/fonts.css?0.22.1" media="all" rel="stylesheet" />
    
    <link rel="shortcut icon" href="${url.resourcesPath}/assets/favicon.ico" type="image/x-icon" />

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta property="og:image" content="${url.resourcesPath}/vendor/hsgis_template/images/opengraph-image.png?0.22.1">




    <link href="${url.resourcesPath}/css/hsgis_elements.css" rel="stylesheet" type="text/css">
    

    <#if properties.styles?has_content>
        <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
    <#if properties.scripts?has_content>
        <#list properties.scripts?split(' ') as script>
            <script src="${url.resourcesPath}/${script}" type="text/javascript"></script>
        </#list>
    </#if>
    <#if scripts??>
        <#list scripts as script>
            <script src="${script}" type="text/javascript"></script>
        </#list>
    </#if>
</head>

<body class="${properties.kcBodyClass!}">
    <script>document.body.className = ((document.body.className) ? document.body.className + ' js-enabled' : 'js-enabled');</script>



    <div id="skiplink-container">
      <div>
        <a href="#content" class="skiplink">Skip to main content</a>
      </div>
    </div>
    <div id="global-cookie-message">

        <p>${msg("providerName")} uses cookies to make this site function. The <a href="${msg("privacyPolicy")}" target="_blank">privacy policy</a> & <a href="https://www.hadleyso.com/" target="_blank">service provider</a></p>

    </div>
    <header role="banner" id="global-header" class="${properties.kcHeaderClass!} with-proposition">
      <div class="header-wrapper">
        <div class="header-global">
          <div class="header-logo">
            <a href="https://www.hadleyso.com/" id="logo" class="content">
             ${realm.displayName}
            </a>
          </div>
        </div>
      </div>
    </header>

    <div id="global-header-bar"></div>


    <main id="content" role="main" style="min-height: 80vh">
        <div><#nested "back"></div>

        <div class="grid-row">
            <div class="column-one-half">
                <h1 class="heading-large"><#nested "title"></h1>


                <div id="kc-container" class="${properties.kcContainerClass!}">
                    <div id="kc-container-wrapper" class="${properties.kcContainerWrapperClass!}">


                        <#if realm.internationalizationEnabled>
                            <div id="kc-locale" class="${properties.kcLocaleClass!}">
                                <div id="kc-locale-wrapper" class="${properties.kcLocaleWrapperClass!}">
                                    <div class="kc-dropdown" id="kc-locale-dropdown">
                                        <a href="#" id="kc-current-locale-link">${locale.current}</a>
                                        <ul>
                                            <#list locale.supported as l>
                                                <li class="kc-dropdown-item"><a href="${l.url}">${l.label}</a></li>
                                            </#list>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </#if>

                        <div id="kc-content" class="${properties.kcContentClass!}">
                            <div id="kc-content-wrapper" class="${properties.kcContentWrapperClass!}">

                                <#if displayMessage && message?has_content>
                                    <#if message.type = 'error'>
                                        <div class="error-summary" role="group" aria-labelledby="error-summary-heading-example-1" tabindex="-1">
                                            <h1 class="heading-medium error-summary-heading" id="error-summary-heading-example-1">
                                                There is a problem
                                            </h1>

                                            <ul class="error-summary-list" id="error-details">
                                                <li>${message.summary}</li>
                                            </ul>
                                        </div>
                                    <#else>
                                        <div class="${properties.kcFeedbackAreaClass!}">
                                            <div class="alert alert-${message.type}"><p>
                                                <#if message.type = 'success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                                                <#if message.type = 'warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                                                <#if message.type = 'info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                                                <span class="kc-feedback-text">${message.summary}</span></p>
                                            </div>
                                        </div>
                                    </#if>
                                </#if>

                                <div id="kc-form" class="${properties.kcFormAreaClass!}">
                                    <div id="kc-form-wrapper" class="${properties.kcFormAreaWrapperClass!}">
                                        <#nested "form">

                                        <#if displayInfo>
                                            <div id="kc-info" class="${properties.kcSignUpClass!}">
                                                <div id="kc-info-wrapper" class="${properties.kcInfoAreaWrapperClass!}">
                                                    <#nested "info">
                                                </div>
                                            </div>
                                        </#if>

                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="column-one-half" id="right-half">
                <#nested "socialProviders">
                <#nested "info">

            </div>
        </div>
    </main>


    <#-- Start footer -->

    <footer class="group js-footer" id="footer" role="contentinfo">

        <div class="footer-wrapper">
            <div class="footer-meta">
                <div class="footer-meta-inner">

                    <div class="footer-licence">
                        <p>Data is processed and stored in the United States in accordance with applicable laws and regulations. 
                        By using this service, you consent to the transfer, processing, and storage of your data in the United States.
                        <a href="${msg("privacyPolicy")}">Privacy Policy</a>
                        <br><br></p>
                        
                        <small>
                            <p>Copyright &copy; ${.now?string('yyyy')} Hadley So or affiliates. All rights reserved. <br><br></p>
                            <p>Service provider: &ensp;<a href="https://www.hadleyso.com"><img src="https://static.hadleyso.com/o365-logo.png" style="max-height: 25px; margin-bottom: -10px;"/></a></p>
                        </small>
                    </div>
                </div>

                <div class="copyright">
                    <small>
                    Contains public sector information licensed under the <a href="https://www.nationalarchives.gov.uk/doc/open-government-licence/version/3/" target="_blank"> Open Government Licence v3.0</a>. 
                    Crown copyright &copy; 2017, UK Home Office. Licensed under the Open Government Licence v3.0 and MIT License.
                    </small>
                </div>
            </div>
        </div>
    </footer>

    <div id="global-app-error" class="app-error hidden"></div>

    <script src="${url.resourcesPath}/vendor/hsgis_template/javascripts/hsgis-template.js?0.22.1"></script>

    <script>if (typeof window.HSGIS === 'undefined') document.body.className = document.body.className.replace('js-enabled', '');</script>

    <#-- End footer -->
</body>
</html>
</#macro>
