*** Settings ***
Resource          resource/resource.robot

*** Test Cases ***
Test invalid account format
    Open Browser    ${ACCOUNT SUMMARY URL}      ${BROWSER}
    Click Link   Transfer
    Element Should Be Disabled      submitBtn
    Input Text   toAccount          123456
    Input Text   amount             10.00
    Click Element   remark
    Element Should Be Disabled      submitBtn


Test invalid amount (less than zero)
    Reload Page
    Element Should Be Disabled      submitBtn
    Input Text   toAccount          4558874144
    Input Text   amount             -10.00
    Click Element   remark
    Element Should Be Disabled      submitBtn

Test invalid amount (greater than balance)
    Reload Page
    Input Text   toAccount          4558874144
    Input Text   amount             1000000000000.00
    Click Element   remark
    Element Should Be Disabled      submitBtn

Test non-existing destination account
    Reload Page
    Input Text   toAccount          0000000000
    Input Text   amount             10.00
    Click Element   remark
    Element Should Be Enabled       submitBtn
    Click Element                   submitBtn
    Location Should Be              ${APP URL}/transfer.html
    Close Browser