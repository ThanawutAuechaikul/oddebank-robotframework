*** Settings ***
Documentation     A resource file with reusable keywords and variables.
...
...               The system specific keywords created here form our own
...               domain specific language. They utilize keywords provided
...               by the imported Selenium2Library.
Library           Selenium2Library
Library           String

*** Variables ***
${APP URL}         http://52.221.213.168:8080/app
${BROWSER}        Chrome
${DELAY}          0
${ACCOUNT SUMMARY URL}      ${APP URL}
${DATE TIME FORMAT}    ^(January|February|March|April|May|June|July|August|September|October|November|December)\s+[0-9]{1,2},\s[0-9]{4}\s[0-9]{2}:[0-9]{2}:[0-9]{2}$

*** Keywords ***
Open Browser To Account Summary Page
    Open Browser    ${ACCOUNT SUMMARY URL}    ${BROWSER}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}