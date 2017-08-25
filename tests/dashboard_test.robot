*** Settings ***
Library           Selenium2Library

*** Variables ***
${SERVER}       52.221.213.168:8080
${APP URL}      http://${SERVER}/app
${TIMEOUT}      60

*** Test Cases *** 
Show account summary detail
    Open Browser    ${APP URL}    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    id=accountNumber    ${TIMEOUT}
    Page Should Contain     Account Number : 0987654321
    Page Should Contain     Balance (THB) :
    [Teardown]    Close Browser