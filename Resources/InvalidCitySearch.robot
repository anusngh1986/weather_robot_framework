*** Settings ***
Documentation   Creating high-level keywords for low level keywords
Resource    ../Resources/PO/InValidSearch.robot

*** Keywords ***
Search with Many Invalid Values
    [Arguments]  ${InvalidLocationScenarios}
    :FOR  ${LocationScenario}  IN  @{InvalidLocationScenarios}
    \  run keyword and continue on failure   InValidSearch.Navigate To
    \  run keyword and continue on failure  Attempt Login  ${LocationScenario}
    \  run keyword and continue on failure  Verify Login Page Error Message  ${LocationScenario}

Navigate to Sign In Page
    InValidSearch.Navigate To

Attempt Login
    [Arguments]  ${LocationDetails}
    InValidSearch.Enter Location  ${LocationDetails}
    InValidSearch.Click Submit
    Sleep  1s

Verify Login Page Error Message
    [Arguments]  ${ExpectedErrorMessage}
    InValidSearch.Verify Error Message  ${ExpectedErrorMessage}