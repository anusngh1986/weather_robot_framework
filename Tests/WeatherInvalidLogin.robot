*** Settings ***
Documentation   Demo Weather page testing using Robot-framework for  invalid login
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/WeatherSignIn.robot
Resource  ../Resources/DataManager.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/WeatherInvalidLogin.robot

*** Variables ***

*** Test Cases ***
Should see correct error messages with invalid logins
    ${InvalidLoginScenarios} =  DataManager.Get CSV Data  ${INVALID_CREDENTIALS_PATH_CSV}
    WeatherSignIn.Login with Many Invalid Credentials  ${InvalidLoginScenarios}
