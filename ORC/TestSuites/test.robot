#*** Settings ***
#Library  String
#Library  Selenium2Library
#Library  CSVLib
#Library   ../Keywords/CommonKeywords.py
#Resource  ../Keywords/CommonKeywords.robot
#Resource  ../Helpers/SetupAndTeardown.robot
#Resource  ../PageObjects/Login.robot
#Library  ../Helpers/Helpers.py
#
#
#*** Settings ***
#
#Suite Setup  Before Suite
#Suite Teardown  After Suite
#Test Teardown  After Test
#
#*** Variables ***
#
#
#*** Test Cases ***
#
#Scenario: Test Login
#    Login Using  WORKBRAIN
##    ${data}=   Read CSV As Single List     ./TestData/CSTS_EMPLOYEE.csv_20210513_072308
##    Log To Console   ${data}
#    ${result} =    identify row col    ./TestData/CSTS_EMPLOYEE.csv_20210513_072308    0    2
#    Log To Console  ${result}
#    Log To Console  DONE

*** Settings ***
Library    SeleniumLibrary

*** Test Cases ***
Open Browser with Chrome Options
    ${options}=    Evaluate    sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${options}    add_argument    --start-maximized
    Call Method    ${options}    add_argument    --disable-notifications
    Open Browser    https://www.google.com    browser=chrome    options=${options}
    Title Should Be    Google
    [Teardown]    Close All Browsers
