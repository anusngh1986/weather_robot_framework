*** Settings ***
Resource    ../Resources/PO/HrefValidation.robot

*** Keywords ***
Search Link on the page
    Navigate to Sign In Page
    Get All Links
    #Log All the Links on the page to console



Navigate to Sign In Page
    HrefValidation.Navigate To

Attempt Search
    [Arguments]  ${LocationDetails}
    ValidSearch.Enter Location  ${LocationDetails}
    ValidSearch.Click Submit
    Sleep  1s

Verify Search Page Success Message
    [Arguments]  ${ExpectedMessage}
    ValidSearch.Verify Error Message  ${ExpectedMessage}