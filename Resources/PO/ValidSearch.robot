*** Settings ***
Library  Selenium2Library

*** Variables ***
${YOUR_CITY_NAME} =    xpath=//input[@placeholder='Your city name']
${SERACH_BUTTON} =    xpath=(//BUTTON[@type='submit'])[2]

*** Keywords ***
Navigate To
    go to  ${BASE_URL.${ENVIRONMENT}}
    Wait Until Element Is Enabled   xpath=//input[@placeholder='Your city name']

Enter Location
    [Arguments]  ${LocationDetails}
    ${Location}    Catenate  SEPARATOR=,  ${LocationDetails[0]}  ${LocationDetails[1]}
    run keyword unless  '${LocationDetails[0]}' == '#BLANK'  Input Text  ${YOUR_CITY_NAME}  ${Location}
    sleep   5s

Click Submit
    Click Button  ${SERACH_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage[2]}

Clear Input Fields
    Clear Element Text  ${YOUR_CITY_NAME}