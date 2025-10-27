*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierOwnedProperties.robot
Resource  ../PageObjects/UnifierCreateNewOwnedProperties.robot
Documentation  Remediation/restoration end date cannot be earlier than remediation/restoration start date in Owned property Line item "Environmental Condition".
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name:Contract Receivable Name to be present in Tasks
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
#${json_path}    ./TestData/td_BP001.json
#${csv_path}  ./CSV/td_BP001.csv
*** Test Cases ***

Scenario: Remediation/restoration end date cannot be earlier than remediation/restoration start date in Owned property Line item "Environmental Condition".
    [Tags]  NegativeTestNS04  ModifyData
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
    Validate Property Use Block  MX Owned  Yes  Future Description  07/25/2023  Transitional Area Comments
    Validate PIN Mileage Survey Block  01010101  02020202  Survey plans value  5000  Mileage Comments
    Validate Area Calculation Block   Land  Yes  2400  3  2  Area comments
    Validate building demolitions block  07/25/2023  Demolition Comments
    Validate property disposed details block   FULL  07/25/2023  70000  2400  Disposition details  MPM Company
    Validate Expropriation Details block  Yes  Yes  Yes  Section 24  Expropriation Comments
    Click on Environmental Condition tab
    Click on Add environmental condition button
    Add environmental condition line item without restoration clause   New Remediation Item  Yes  Property is contaminated  7300  5000  Environmental claim comment
    ${today_date}=  Get Current Date MM DD YYYY
    ${yesterday_date}=   Get Yesterday Date MM DD YYYY
    Add remediation or restoration clause  Yes  ENVIRONMENTAL  FULL  ${today_date}  ${yesterday_date}  7870  20  Text added
    Save the environment condition
    Validate the error message   Date Validation : remediation/restoration end date cannot be earlier than remediation/restoration start date
