*** Settings ***
Documentation   Demo Weather page testing using Robot-framework seraching invalid cities
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/DataManager.robot
Resource  ../Resources/InvalidCitySearch.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/WeatherInvalidLogin.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid city name
    log to console   ${HOME_BASE_URL.${ENVIRONMENT}}
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data  ${INVALID_CITY_PATH_CSV}
    InvalidCitySearch.Login with Many Invalid Credentials  ${InvalidLoginScenarios}