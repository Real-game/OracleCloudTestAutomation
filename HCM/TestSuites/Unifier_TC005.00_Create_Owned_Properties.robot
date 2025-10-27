*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierOwnedProperties.robot
Resource  ../PageObjects/UnifierCreateNewOwnedProperties.robot

*** Settings ***


Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_BP001.json
#${csv_path}  ./CSV/td_BP001.csv
*** Test Cases ***

Scenario: Create owned properties
    [Tags]  OwnedPropertyTest  ModifyData
    #generatejson  ${csv_path}  ${json_path}
    #${data}=  readJson  ${json_path}
    Log  Step 1
    Unifier Login Using  V-ACC-Senthil.Thangaraj@metrolinx.com
    Log  Step 2
    Click on home icon in landing Page
    Click on Owned Properties under CRE Master Log
    Click on Create Owned Properties button  PROP-00002 : CANPA GUIDEWAY
    Validate Property Information block  OPEX  Owned
    Validate Title Information block   Jayapal  Raghavi  Premkumar  78780
    Validate Address Information block  East Street  Toronto
    Validate Property Use Block  MX Owned  Yes  Future Description  07/24/2023  Transitional Area Comments
    Validate PIN Mileage Survey Block  01010101  02020202  Survey plans value  5000  Mileage Comments
    Validate Area Calculation Block   Land  Yes  2400  3  2  Area comments
    Validate building demolitions block  07/24/2023  Demolition Comments
    Validate property disposed details block   FULL  07/24/2023  70000  2400  Disposition details  MPM Company
    Validate Expropriation Details block  Yes  Yes  Yes  Section 24  Expropriation Comments
    Submit Owned Property
    Sleep  10s