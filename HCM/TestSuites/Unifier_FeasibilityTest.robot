*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Library  DataDriver  ../CSV/td_Unifier_Test.csv
Documentation  Feasibility Test
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login_user
...            Reusable Data:  Property Workspace Name
...            Dynamic Data:  Not Applicable

*** Settings ***

Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Unifier Test Sample

*** Variables ***
${json_path}    ./TestData/td_Unifier_Test.json
${csv_path}  ./CSV/td_Unifier_Test.csv

*** Test Cases ***
Unifier Test Execution with - ${Id} ${login_user} ${property_workspace_name}
    [Tags]  UnifierTest345678

*** Keywords ***
Unifier Test Sample
    [Arguments]  ${Id}  ${login_user}  ${property_workspace_name}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Click on home icon in landing Page
    Click on + Icon and Select Property Workspace  ${property_workspace_name}
