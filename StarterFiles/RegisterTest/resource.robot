*** Settings ***
Library    SeleniumLibrary
Library    Collections

*** Variables ***
${SERVER}    localhost:7272
${BROWSER}    Chrome
${DELAY}    0 
${CHROME_BROWSER_PATH}    E:${/}ChromeForTesting${/}chrome-win64${/}chrome.exe
${CHROME_DRIVER_PATH}     E:${/}ChromeForTesting${/}chromedriver-win64${/}chromedriver.exe
${FIRSTNAME}    Somyod    
${LASTNAME}    Sodsai
${ORGANIZATION}    CS KKU
${EMAIL}    somyod@kkumail.com
${PHONE}    091-001-1234
${REG URL}    http://${SERVER}/StarterFiles/Registration.html
${SUCCESS}    http://${SERVER}/StarterFiles/Success.html
${ERROR URL}  http://${SERVER}/StarterFiles/Registration.html

*** Keywords ***
Open Workshop Registration Page
    ${chrome_options}    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys
    ${chrome_options.binary_location}    Set Variable    ${CHROME_BROWSER_PATH}
    ${service}    Evaluate    sys.modules["selenium.webdriver.chrome.service"].Service(executable_path=r"${CHROME_DRIVER_PATH}")    sys
    Create Webdriver    Chrome    options=${chrome_options}    service=${service}
    Go To    ${REG URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}
    Workshop Registration Page Should Be Open

Workshop Registration Page Should Be Open
    Title Should Be    Registration

Register Success
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
    Input Text    firstname    ${FIRSTNAME}
    Input Text    lastname    ${LASTNAME}
    Input Text    organization    ${ORGANIZATION}
    Input Text    email    ${EMAIL}
    Input Text    phone    ${PHONE}

Fill Registration Form
    [Arguments]    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
    Input Text    firstname    ${FIRSTNAME}
    Input Text    lastname    ${LASTNAME}
    Input Text    organization    ${ORGANIZATION}
    Input Text    email    ${EMAIL}
    Input Text    phone    ${PHONE}

Submit Click
    Click Button    registerButton

Success Page Should Be Open
    Location Should Contain    ${SUCCESS}
    Page Should Contain    Thank you for registering with us.
    Page Should Contain    We will send a confirmation to your email soon.