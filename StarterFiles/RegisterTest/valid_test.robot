*** Settings ***
Resource    resource.robot

*** Test Cases ***
UAT-Lab04-001-TC-001 Open Workshop Registration Page
	Open Workshop Registration Page
    Workshop Registration Page Should Be Open
	[Teardown]    Close Browser
	
UAT-Lab04-001-TC-002 Register Success With Organization
    Open Workshop Registration Page
	Register Success    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
	Submit Click
	Success Page Should Be Open
	[Teardown]    Close Browser
	
UAT-Lab04-001-TC-003 Register Success Without Organization
	Open Workshop Registration Page
	Register Success    ${FIRSTNAME}    ${LASTNAME}    ${empty}    ${EMAIL}    ${PHONE}
	Submit Click
	Success Page Should Be Open
	[Teardown]    Close Browser