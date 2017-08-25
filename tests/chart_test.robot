*** Settings ***
Resource          resource/resource.robot

*** Test Cases *** 
We should see pie chart redered.
    Open Browser To Account Summary Page
    Element Should Be Visible    xpath=//iframe[@class="chartjs-hidden-iframe"]    We should see pie chart redered.
    [Teardown]    Close Browser

        