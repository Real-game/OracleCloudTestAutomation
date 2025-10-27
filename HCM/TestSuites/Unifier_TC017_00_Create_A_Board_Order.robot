*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierBoardOrders.robot
Resource  ../PageObjects/UnifierCreateNewBoardOrders.robot


*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_BP001.json
#${csv_path}  ./CSV/td_BP001.csv
*** Test Cases ***

Scenario: Create board orders
    [Tags]  BoardOrderTestCase  ModifyData
    #generatejson  ${csv_path}  ${json_path}
    #${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Senthil.Thangaraj@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on Board Orders under CRE Master Log
    Click on Create board orders button   PROP-00002 : CANPA GUIDEWAY
    Switch to board order window
    Update board order Status  Active
    Validate board order details  Entity12  89977  Oct/22/2025  889899  Payment structure comments
    Validate board order parties information details   party 1  party 2  party 3  party 4
    Validate Location Information block   location description  5000  7000  WESTON
    Validate board order requirements  CONTR-01430  board order requirement text
    Submit the board order
    Sleep    5s
    page should not contain    Errors and Warnings
