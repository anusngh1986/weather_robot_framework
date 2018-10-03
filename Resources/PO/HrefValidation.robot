*** Settings ***
Library  Selenium2Library
Library    Collections

#*** Variables ***
#${YOUR_CITY_NAME} =    xpath=//input[@placeholder='Your city name']
#${SERACH_BUTTON} =    xpath=(//BUTTON[@type='submit'])[2]
#
*** Keywords ***
Navigate To
     go to  ${BASE_URL.${ENVIRONMENT}}
     Wait Until Element Is Enabled   xpath=//input[@placeholder='Your city name']

Enter Location
    [Arguments]  ${LocationDetails}
    ${Location}    Catenate  SEPARATOR=,  ${LocationDetails[0]}  ${LocationDetails[1]}
    run keyword unless  '${LocationDetails[0]}' == '#BLANK'  Input Text  ${YOUR_CITY_NAME}  ${Location}
    sleep   2s

Click Submit
    Click Button  ${SERACH_BUTTON}

Verify Error Message
    [Arguments]  ${ExpectedErrorMessage}
    Page Should Contain  ${ExpectedErrorMessage[2]}

Clear Input Fields
    Clear Element Text  ${YOUR_CITY_NAME}


Log All the Links on the page to console
    Wait Until Element is Visible  xpath=//a[@href]
    @{elements}=    Get WebElements    xpath=//a[@href]




Get All Links
    [Tags]    Links
    Comment    Count Number Of Linkds on the Page
    ${AllLinksCount}=    Get Matching Xpath Count    xpath=//a[@href]
    Comment    Log links count
    Log    ${AllLinksCount}
    Comment    Create a list to store link texts
    @{LinkItems}    Create List
    Comment    Loop through all links and store links value that has length more than 1 character
    : FOR    ${INDEX}    IN RANGE    1    ${AllLinksCount}
    \    Log to console   ${INDEX}
    \    ${lintext}=    Get Text    xpath=(//a)[${INDEX}]
    \    Log to console   ${lintext}
    \    ${linklength}    Get Length    ${lintext}
    \    Run Keyword If    ${linklength}>1    Append To List    ${LinkItems}    ${lintext}
    ${LinkSize}=    Get Length    ${LinkItems}
    Log    ${LinkSize}
    Comment    Print all links
    : FOR    ${ELEMENT}    IN    @{LinkItems}
    \    Log to console   ${ELEMENT}
