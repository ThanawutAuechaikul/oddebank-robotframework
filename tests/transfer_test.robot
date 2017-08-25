*** Settings ***
Resource          resource/resource.robot

*** Test Cases ***
Validate transfer flow (Click cancel from Preview)
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
    Wait Until Element Is Visible   cancelBtn
    Location Should Contain     transferPreview

    Element Should Contain     toAccount    455-887-414-4
    Element Should Contain     amount       10.00
    Element Should Contain     remark       Transfer 10.00 to 4558874144

    Click Element   cancelBtn
    Wait Until Element Is Visible   submitBtn
    Location Should Contain     transfer

    Close Browser


*** Test Cases ***
Validate transfer flow (Happy Path)
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
    Wait Until Element Is Visible   cancelBtn
    Location Should Contain     transferPreview

    Element Should Contain     toAccount    455-887-414-4
    Element Should Contain     amount       10.00
    Element Should Contain     remark       Transfer 10.00 to 4558874144

    Click Element   confirmBtn
    Wait Until Element Is Visible   isSentEmail
    Location Should Contain     transferSummary

    Input Text      receiveRemark   receive 10 Baht from 098-765-432-1
    Click Element   updateBtn
    Wait Until Element Is Visible   pieChart
    Location Should Contain     index

    Close Browser
