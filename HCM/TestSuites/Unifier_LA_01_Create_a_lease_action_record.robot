*** Settings ***
Library  DataDriver  ../CSV/td_LA_01_Create_a_lease_action_record.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/UnifierLeaseActions.robot
Resource  ../PageObjects/UnifierCreateNewLeaseActions.robot
Documentation  Create a lease action record
...            Prerequisite:
...            Environment Specific Data:  Login User
...            Reusable Data:  Workspace Name,Lease_Action_Progress,Date_Completed,Completion_Action_Details_Comment,Contract Receivable Name to be present in Tasks
...            Dynamic Data: Not applicable


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Create a lease action record

*** Variables ***
${json_path}    ./TestData/td_LA_01_Create_a_lease_action_record.json
${csv_path}  ./CSV/td_LA_01_Create_a_lease_action_record.csv

*** Test Cases ***
Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract with - ${Id} ${login_user} ${property_workspace_name} ${Lease_Action_Progress} ${Date_Completed} ${Completion_Action_Details_Comment}
    [Tags]  LeaseActionTestCase  ModifyData

*** Keywords ***
Validate the error message of Current term Expiry Date cannot be earlier than Current term Start Date for Property Contract
    [Arguments]  ${login_user}  ${property_workspace_name}  ${Lease_Action_Progress}  ${Date_Completed}  ${Completion_Action_Details_Comment}
    Log  Step 1
    Unifier Login Using  ${login_user}
    Log  Step 2
    Click on + Icon and Select Property Workspace  ${property_workspace_name}
    Select Lease Actions form CRE Portfolio Mgmt
    Click on Create lease actions button
    Switch to lease actions window
    Validate lease or contract progress updates block  ${Lease_Action_Progress}  ${Date_Completed}  ${Completion_Action_Details_Comment}
    Validate Workflow Action Details dialog
    ${confirmation_text}=   Extract the lease action number from the confirmation message
    Log  Confirmation message is ${confirmation_text}