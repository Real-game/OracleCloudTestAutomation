*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../PageObjects/PostingDetail.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobRequisitionJobFormatting.robot
Documentation  Update Job Requisition
...            Prerequisite:  Requisition in Open - Posted Status
...            Environment Specific Data:  Recruiter Username
...            Reusable Data: Title; URL; Type; Visibility; Use In Offers
...            Dynamic Data: Expiry date; Requisition ID
...            Automation Data: Not Applicable


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP009.json
${csv_path}  ./CSV/td_BP009.csv
*** Test Cases ***

Scenario: Recruiter Updates Requisition Posting Details
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Step 1 - 3
    Login Using  ${data}[Recruiter Username]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7 - 12
    Select an open posted requisition  ${data}[Requisition ID]
    Log  Step 13
    Click on Posting link
    Log  Step 14 - 19
#    Verify Career Site Sections
    Edit Internal Career Site Posting Information   ${data}[Expiry date]
    Log  Step 20 - 25
    Edit External Career Site Posting Information Section  ${data}[Expiry date]
    Sleep  2s
    Log  Step 26
    Click on Job Formatting link
    Log  Step 27 - 28
    Edit Recruiting Organization Description
    Log  Step 29 - 36
    Add Media  ${data}[Title]   ${data}[URL]    ${data}[Type]   ${data}[Visibility]  ${data}[Use In Offers]
    Sleep  20s
    Wait Until Page Contains   ${data}[Title]   20   Added title is not displayed
    Logout