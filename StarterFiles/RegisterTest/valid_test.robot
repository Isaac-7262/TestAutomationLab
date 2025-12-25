*** Settings ***
Resource    resource.robot

*** Test Cases ***
Open Workshop Registration Page
	Open Workshop Registration Page
    Workshop Registration Page Should Be Open
	[Teardown]    Close Browser
	
Register Success
    Open Workshop Registration Page
	Register Success    ${FIRSTNAME}    ${LASTNAME}    ${ORGANIZATION}    ${EMAIL}    ${PHONE}
	Submit Click
	Success Page Should Be Open
	[Teardown]    Close Browser
	
Register Success No Organization Info
	Open Workshop Registration Page
	Register Success    ${FIRSTNAME}    ${LASTNAME}    ${empty}    ${EMAIL}    ${PHONE}
	Submit Click
	Success Page Should Be Open
	[Teardown]    Close Browser