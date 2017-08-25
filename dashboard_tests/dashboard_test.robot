*** Settings ***
Library           Selenium2Library

*** Test Cases *** 
Show account summary detail
    Open Browser    http://localhost:8080/app/index.html    Chrome
    Maximize Browser Window
    Page Should Contain     Account Number : 0987654321
    Page Should Contain     Balance (THB) : 20,300.00
    [Teardown]    Close Browser