*** Settings ***
Resource    resource.robot

*** Test Cases ***
UAT-Lab04-002-TC-001 Open Workshop Registration Page
    Open Workshop Registration Page
    Workshop Registration Page Should Be Open

UAT-Lab04-002-TC-002 Empty First Name
    [Template]    Registration Should Fail With Invalid Data
    ${EMPTY}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}    Please enter your first name!!

UAT-Lab04-002-TC-003 Empty Last Name
    [Template]    Registration Should Fail With Invalid Data
    ${FIRSTNAME}    ${EMPTY}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}    Please enter your last name!!

UAT-Lab04-002-TC-004 Empty First Name & Last Name
    [Template]    Registration Should Fail With Invalid Data
    ${EMPTY}    ${EMPTY}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}    Please enter your name!!

UAT-Lab04-002-TC-005 Empty Email
    [Template]    Registration Should Fail With Invalid Data
    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMPTY}    ${PHONE}    Please enter your email!!

UAT-Lab04-002-TC-006 Empty Phone Number
    [Template]    Registration Should Fail With Invalid Data
    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${EMPTY}    Please enter your phone number!!

UAT-Lab04-002-TC-007 Invalid Phone Number
    [Template]    Registration Should Fail With Invalid Data
    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    1234    Please enter a valid phone number, e.g., 081-234-5678, 081 234 5678, or 081.234.5678)

*** Keywords ***
Registration Should Fail With Invalid Data
    [Arguments]    ${firstname}    ${lastname}    ${org}    ${email}    ${phone}    ${expected}
    Fill Registration Form    ${firstname}    ${lastname}    ${org}    ${email}    ${phone}
    Submit Click
    Location Should Be    ${ERROR URL}
    Element Text Should Be    errors    ${expected}