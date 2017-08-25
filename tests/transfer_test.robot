*** Settings ***
Resource          resource/resource.robot

*** Test Cases ***
Validate transfer flow
    Open Browser    ${ACCOUNT SUMMARY URL}      ${BROWSER}
    Click Link   Transfer
    Element Should Be Disabled      submitBtn
    Input Text   toAccount          4558874144
    Element Should Be Disabled      submitBtn
    Input Text   amount             10.00
    Click Element   remark
    Element Should Be Enabled       submitBtn
    Input Text   remark             Transfer 10.00 to 4558874144

    Click Element   submitBtn
    Close Browser
