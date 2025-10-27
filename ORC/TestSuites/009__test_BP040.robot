*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/CreateJobOffer.robot
Documentation  Present and Manage Offers ( Create an offer for external candidate in saved status)
...            Prerequisite:  Requisition has Active Application
...            Environment Specific Data:  Recruiter Username; HRBP; Collaborator
...            Reusable Data: Offer Action;Employee Type;Assignment Status;Proposed Person Type;Payroll;Tax Reporting Input;Candidate Facing Documents;Internal Documents;Offer Letter;Contract Type;Union Dues Retention;OMERS;Action
...            Dynamic Data: Employee Start Date;Salary Basis;Salary Amount;Contract Start Date;Contract End Date;Expiration Date
...            Automation Data: Requisition_ID (Get from BP001); Candidate (Name Get from BP017)



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP040.json
${csv_path}  ./CSV/td_BP040.csv
${prerequisites_json_path}  ./TestData/td_BP001.json  #If we want to run BP040 seperately - Update BP001 Json
${prerequisites_json_path2}  ./TestData/td_BP017.json  #If we want to run BP040 seperately - Update BP017 Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv
*** Test Cases ***

Scenario: Present and Manage Offers ( Create an offer for external candidate )
    [Tags]  ExternalNewHire
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Requisition_ID  ${prerequisites_data}[RequisitionId]
    ${prerequisites_data2}=  readJson  ${prerequisites_json_path2}
    appendtojson  ${json_path}  Candidate  ${prerequisites_data2}[Candidate Name]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3 - 4
    Search for requisition id  ${data}[Requisition_ID]
    Log  Step 5
    Click on Active Applications
    Log  Step 6
    Select Application  ${data}[Candidate]
    Log  Step 7
    Click on Actions and Select  ${data}
    Log  Step 8 - 9
    Select Sections
    Log  Step 10 - 11
    Fill When and Why  ${data}
    Log  Step 12 - 13
    Fill Assignment Info  ${data}
    Log  Step 14 - 15
    Fill Offer Team  ${common_data}
    Log  Step 16 - 17
    Fill Payroll Info  ${data}
    Log  Step 18 - 19
    Fill Salary  ${data}
    Log  Step 20 - 21
    Fill Attachments  ${data}
    Log  Step 22 - 23
    Fill Additional Info  ${data}
    Log  Step 24 - 28
    Fill Offer Letter  ${data}
    Log  Step 29
#    Click on Save
    Click on Submit
    Logout



