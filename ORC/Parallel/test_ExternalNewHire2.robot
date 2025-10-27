*** Settings ***
Library   ../Helpers/Helpers.py
Library   Selenium2Library
Library   BuiltIn
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../Helpers/Config.robot
Resource  ../PageObjects/PostingDetail.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/CreateJobOffer.robot
Resource  ../PageObjects/PendingEmployees.robot

*** Settings ***

Suite Setup  Before Suite Start
Test Setup  Before Test
Suite Teardown  After Suite
Test Teardown  After Test Run

*** Variables ***
${json_path}    ./TestData/td_ExternalNewHireB.json
${csv_path}  ./CSV/td_ExternalNewHireB.csv
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***
Scenario 1: Create Job Requisition in Draft status
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}
    Log  Step 1 -3
    Login Using  ${common_data}[Hiring Manager Login]
    Log  Step 4
    click on homepage
    Log  Step 5 -6
    Go to my team hiring
    Log  Step 7
    Click on add button
    Log  Step 8 - 26
    Create a Requisition  ${data}  ${common_data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  Requisition ID  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout

Scenario 2: Submit a Job Requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  5s
    Login Using  ${common_data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id without detail link  ${data}[Requisition ID]
    Submit Job Requisition by Reviewer  ${data}
    Logout

Scenario 3: Post Job Requisition
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Login Using  ${common_data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id    ${data}[Requisition ID]
    Sleep  3s
    Click on Actions dropdown
    Click on Move to Posting
    Edit Internal Career Site Posting Information   ${data}[External career site Expiry date]
    Sleep  2s
    Edit External Career Site Posting Information Section   ${data}[External career site Expiry date]
    Logout
    Sleep  480s

Scenario 4: Carrer Portals ( Apply to a job (External Candidate) )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 1 - 5
    Sleep  3s
    Launch Browser  ${ext_URL}  ${Browser}
#    Execute Javascript   window.open('https://fa-ehtc-dev9-saasfaprod1.fa.ocs.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1');
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[1]
    ExternalSiteHomepage.Search Requisition  ${data}[Requisition ID]
    Log  Step 6
    Click on Apply Now
    Log  Step 7 - 9
    Enter Email  ${data}[Email]
    Log  Step 10 - 22
    Fill Personal Info  ${data}
    Log  Step 23
    Click on Submit Application
    Sleep  20s
    ${candidate_name}=  convertToCandidateName  ${data}[First Name]  ${data}[Last Name]
    Log to console  name: ${candidate_name}
    appendtojson  ${json_path}  Candidate Name  ${candidate_name}
    generatecsv  ${json_path}  ${csv_path}

Scenario 5: Present and Manage Offers ( Create an offer for external candidate )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  3s
    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Go to my client group hiring
    Log  Step 3 - 4
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 5
    Click on Active Applications
    Log  Step 6
    Select Application  ${data}[Candidate Name]
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
    Click on Submit
    Logout

Scenario 6: HM Approve Offer
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  3s
    Log  Step 1
    Login Using  ${common_data}[Hiring Manager Login]
    Log  Step 2
    click on homepage
    Log  Step 3 - 4
    Go to my team hiring
    Log  Step 5 - 7
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 8
    Click on Active Applications
    Log  Step 9
    Select Application  ${data}[Candidate Name]
    Log  Step 10 - 13
    Review Offer and Take Action  ${data}[Notification Action]
    Logout

Scenario 7: Recruiter extend Offer
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  3s
    Log  Step 1
    Login Using  ${common_data}[Recruiter user]
    Log  Step 2
    click on homepage
    Log  Step 3 - 4
    Go to my client group hiring
    Log  Step 5 - 7
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 8
    Click on Active Applications
    Log  Step 9
    Select Application  ${data}[Candidate Name]
    Log  Step 10 - 14
    Click on Actions and Select Extend Offer
    Logout

Scenario 8: Recruiter accepts Offer behalf of candidate
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  3s
    Log  Step 1 - 3
    Login Using  ${common_data}[Recruiter user]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7 - 9
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 10
    Click on Active Applications
    Log  step 11
    Select Application  ${data}[Candidate Name]
    Log  Step 12 - 15
    Recruiter Accept Offer from Actions
    Logout

Scenario 9: Additional Information Provided for Candidate (Candidate provide personal info (External))
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1 - 15
    Sleep  3s
    Mailinator Respond to Additional Info Required  ${data}[Email]
    Log  Step 16 - 18
    Select Date of Birth Value under Personal Info  ${data}[Date of Birth]
    Log  Step 19 - 23
    Enter National Identifier details under Personal Info  ${data}[Social Insurance Number]
    Log  Step 24 - 25
    Select Gender value under Personal Info  ${data}[Gender]
    Log  Step 26
    Enter E-Signature under Personal Info  ${data}[First Name]  ${data}[Last Name]
    Log  Step 27 - 28
    Click Submit Button under Personal Info
    Sleep  5s

Scenario 10: Move the external candidate to HR
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1 - 3
    Login Using  ${common_data}[Recruiter user]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client group hiring
    Log  Step 7 - 9
    Search for requisition id  ${data}[Requisition ID]
    Log  Step 10
    Click on Active Applications
    Log  Step 11
    Select Application  ${data}[Candidate Name]
    Log  Step 12 - 15
    Click on Actions and Select Move to HR
    Logout

Scenario 11: Convert PW to Employee ( Convert Pending Worker to Employee )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Sleep  3s
    Log  Step 1 - 3
    Login Using  ${common_data}[Journeys Specialist User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Pending Employees
    Log  Step 8
    ${candidate_name}=  getNameFromCandidateName  ${data}[First Name]  ${data}[Last Name]
    Log  name: ${candidate_name}
    Log  Step 9 - 13
    Take Action on Pending Employee  ${candidate_name}  ${data}[Pending Employee Action]
    Sleep  5s
    Logout
    appendtojson  ${json_path}  Final Candidate  ${candidate_name}
    generatecsv  ${json_path}  ${csv_path}