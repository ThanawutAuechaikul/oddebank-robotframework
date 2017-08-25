*** Settings ***
Resource          resource.robot

*** Test Cases ***
Validate Account Summary section
    Open Browser To Account Summary Page
    Element Should Contain    xpath=//div[@class="card-header"]    Account Summary
    ${Account Number} =    Get Text    xpath=//span[@id="accountNumber"]
    ${Account Balance} =    Get Text    xpath=//span[@id="accountBalance"]
    Should Not Be Empty    ${Account Number}    Account Number should not be empty
    Should Not Be Empty    ${Account Balance}    Account Balance should not be empty
    [Teardown]    Close Browser