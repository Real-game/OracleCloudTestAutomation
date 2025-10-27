*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Library  ../Helpers/Helpers.py
Library  ../keywords/CommonKeywords.py
Resource  ../PageObjects/ReportsAndAnalytics.robot
Resource  ../PageObjects/Catalog.robot
Resource  ../PageObjects/PersonManagement.robot

Documentation  Verify Absence - Employee with Vacation Elector
...            Prerequisite:  Not Applicable
...            Environment Specific Data:  Login User
...            Reusable Data:  Report Name
...            Dynamic Data:  Not Applicable

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_PAY_TC072_Verify_Absence_Employee_With_Vacation_Elector.json
${csv_path}  ./CSV/td_PAY_TC072_Verify_Absence_Employee_With_Vacation_Elector.csv

*** Test Cases ***
Scenario: Verify Absence - Employee with Vacation Elector
    [Tags]  PayrollAbsenceTestCase  ModifyData
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 1 - 3
    Login Using  ${data}[Login User]
    Log  Step 4 - 6
    click on Nevigator
    Select On Tools
    Click Link Reports and Analytics
    Log  Step 7
    Click Browse Catalog Button
    Log  Step 8
    Expand Shared Folders
    Log  Step 9
    Expand Custom
    Log  Step 10 - 11
    Expand Metrolinx
    Log  Step 12
    Expand Reports
    Log  Step 13
    Expand Absence Reports
    Log  Step 14
    Select HR-REP-108 Folder
    Log  Step 15
    Select And Open Report  ${data}[Report Name]
    Log  Step 16 - 17
    ${current_date}=  get_current_date_dd_mmmm_yyyy
    Sleep  20s
    Set Effective End Date And Click Apply  ${current_date}
    Sleep  20s
    ${text}  Extract the report content  xdo:docframe0

    ## extracting the person number from the generated report
    ${splitted_text}=  get_splitted_string  ${text}
    ${index_num}=  extract_the_index  ${splitted_text}[0]  PersonNumber
    ${occurrence_num}=  extract_the_occurrence  ${splitted_text}[0]  ${index_num}  |
    ${initial_index_value}=  extract_the_index_text  ${splitted_text}[1]  ${occurrence_num}  |
    ${final_occurrence_index1}=   Set Variable  ${1}
    ${index_num_initial}=  Evaluate  ${initial_index_value}+${final_occurrence_index1}
    ${index_num_final}=  Evaluate  ${occurrence_num}+${final_occurrence_index1}
    ${final_index_value}=  extract_the_index_text  ${splitted_text}[1]  ${index_num_final}  |
    ${person_text}=  extract_the_text  ${splitted_text}[1]  ${index_num_initial}  ${final_index_value}
    Log  extracted person number is ${person_text}
    Close Window

    ##Vacation Elector selection
    ${list}=  Get Window Handles
    Switch Window  ${list}[0]
    Click on Homepage
    Go To My Client Group
    Search Person Number and Click Actions  ${person_text}
    Click on Personal and Employment Option
    Click on Person link
    Click on Vacation Elector link
