*** Settings ***
Documentation   Creating high-level keywords for low level keywords
Resource    ../Resources/PO/ValidSearch.robot

*** Keywords ***
Login with Many Valid Values
    [Arguments]  ${ValidLocationScenarios}
    :FOR  ${LocationScenario}  IN  @{ValidLocationScenarios}
    \  run keyword and continue on failure   ValidSearch.Navigate To
    \  run keyword and continue on failure  Attempt Search  ${LocationScenario}
    \  run keyword and continue on failure  Verify Search Page Success Message  ${LocationScenario}

Navigate to Sign In Page
    ValidSearch.Navigate To

Attempt Search
    [Arguments]  ${LocationDetails}
    ValidSearch.Enter Location  ${LocationDetails}
    ValidSearch.Click Submit
    Sleep  1s

Verify Search Page Success Message
    [Arguments]  ${ExpectedMessage}
    ValidSearch.Verify Error Message  ${ExpectedMessage}