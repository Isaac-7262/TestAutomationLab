*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${SERVER}    localhost:7272
${BROWSER}    Chrome
${DELAY}    0 
${FIRSTNAME}    Somyod    
${LASTNAME}    Sodsai
${ORGANIZATION}    CS KKU
${EMAIL}    somyod@kkumail.com
${PHONE}    091-001-1234
${REG URL}    http://${SERVER}/StarterFiles/Registration.html
${SUCCESS}    http://${SERVER}/StarterFiles/Success.html
${ERROR URL}    http://${SERVER}/StarterFiles/Registration.html

*** Keywords ***
Open Workshop Registration Page
    Open Browser    ${REG URL}    ${BROWSER}
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
    Title Should Be    Success
    Element Text Should Be    xpath=//body//h2    We will send a confirmation to your email soon.