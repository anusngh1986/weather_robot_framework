*** Settings ***
Library  Selenium2Library

*** Variables ***

*** Keywords ***
Begin Web Test
    Open Browser  about:blank  ${BROWSER}
    Maximize Browser Window
    Selenium2Library.Delete All Cookies

End Web Test
    Close All Browsers
