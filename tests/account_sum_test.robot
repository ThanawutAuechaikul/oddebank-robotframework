*** Settings ***
Resource          resource/resource.robot


*** Test Cases ***
We should see Account Number and Account Balance in Account Summary section.
    Open Browser To Account Summary Page
    Element Should Contain    xpath=//div[@class="card-header"]    Account Summary
    ${Account Number} =    Get Text    xpath=//span[@id="accountNumber"]
    ${Account Balance} =    Get Text    xpath=//span[@id="accountBalance"]
    Should Not Be Empty    ${Account Number}    Account Number should not be empty
    Should Not Be Empty    ${Account Balance}    Account Balance should not be empty
    [Teardown]    Close Browser


We should see pie chart rendered.
    Open Browser To Account Summary Page
    Element Should Be Visible    xpath=//iframe[@class="chartjs-hidden-iframe"]    We should see pie chart rendered.
    [Teardown]    Close Browser

We should see Recent Transaction History table.    
    Open Browser To Account Summary Page
    Element Should Be Visible    xpath=//table[@id="transactionTable"]    We should see recent transaction table.
    [Teardown]    Close Browser

We should see correct transaction date format displayed in Recent Transaction History table.
    Open Browser To Account Summary Page
    ${count} =    Get Matching Xpath Count    //table[@id="transactionTable"]/tbody/tr
    :FOR    ${index}    IN RANGE    ${count}
    \    ${text} =    Get Text    xpath=//table[@id="transactionTable"]/tbody/tr[${index+1}]/td[1]
    \    Get Regexp Matches   ${text}    ${DATE TIME FORMAT} 
    [Teardown]    Close Browser

