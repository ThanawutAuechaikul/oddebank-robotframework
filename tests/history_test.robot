*** Settings ***
Resource          resource/resource.robot

*** Test Cases ***
Validate transaction history table
    Open Browser To Account Summary Page
    Element Should Be Visible    xpath=//div[@class="paginationnav"]    We should see paging navigation bar.
    Element Should Be Visible    xpath=//table[@id="transactionTable"]/tbody/tr/td[@class="currency"]    We should see transaction data in transaction table.
    [Teardown]    Close Browser
    
