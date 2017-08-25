*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library

*** Variables ***
${APP URL}         http://52.221.213.168:8080/app
${BROWSER}        Chrome
${DELAY}          0
${ACCOUNT SUMMARY URL}      ${APP URL}

*** Keywords ***
Open Browser To Account Summary Page
    Open Browser    ${ACCOUNT SUMMARY URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}