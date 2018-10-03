*** Settings ***
Documentation   Demo Weather page testing using Robot-framework
Resource  ../Data/InputData.robot
Resource  ../Resources/Common.robot
Resource  ../Resources/DataManager.robot
Resource  ../Resources/PageLinkValidation.robot

Test Setup  Common.Begin Web Test
Test Teardown  Common.End Web Test

# robot -d results tests/*

*** Variables ***

*** Test Cases ***
Able to see all links on the page
     PageLinkValidation.Search Link on the page