*** Settings ***
Library  Selenium2Library

*** Variables ***
${SIGN_IN_EMAIL} =          xpath=//INPUT[@id='user_email']
${SIGN_IN_PASSWORD} =       xpath=//INPUT[@id='user_password']
${LOGIN_SUBMIT_BUTTON} =    xpath=(//INPUT[@type='submit'])[1]

*** Keywords ***
Navigate To
    ${SignInUrl} =  Catenate  SEPARATOR=/  ${HOME_BASE_URL.${ENVIRONMENT}}  ${LOGIN_URL}
    go to  ${SignInUrl}

Enter Credentials
    [Arguments]  ${Credentials}
    run keyword unless  '${Credentials[0]}' == '#BLANK'  Input Text  ${SIGN_IN_EMAIL}  ${Credentials[0]}
    run keyword unless  '${Credentials[1]}' == '#BLANK'  Input Text  ${SIGN_IN_PASSWORD}  ${Credentials[1]}

Click Submit
    Click Button  ${LOGIN_SUBMIT_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage[2]}

Clear Input Fields
    Clear Element Text  ${SIGN_IN_EMAIL}
    Clear Element Text  ${SIGN_IN_PASSWORD}