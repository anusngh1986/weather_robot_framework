*** Settings ***
Documentation   Demo Weather page testing using Robot-framework searching valid cities
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/DataManager.robot
Resource  ../Resources/ValidCitySearch.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/*

*** Variables ***

*** Test Cases ***
Should see correct messages with invalid city name
    log to console   ${HOME_BASE_URL.${ENVIRONMENT}}
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data  ${VALID_CITY_PATH_CSV}
    ValidCitySearch.Login with Many Valid Values  ${InvalidLoginScenarios}