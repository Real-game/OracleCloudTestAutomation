*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../Helpers/Mailosaurs.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/JobRequisitions.robot
Resource  ../PageObjects/CreateJobRequisition.robot
Resource  ../PageObjects/PostingDetail.robot
Resource  ../PageObjects/JobRequisitionOverview.robot
Resource  ../PageObjects/JobApplications.robot
Resource  ../PageObjects/JobRequisitionJobFormatting.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Resource  ../PageObjects/ExternalJobRequisitionPage.robot
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot
Resource  ../PageObjects/ExternalCandidateProfileHomePage.robot
Resource  ../PageObjects/CandidatePage.robot
Resource  ../PageObjects/MoveCandidate.robot
Resource  ../PageObjects/JobRequisitionInterviews.robot
Resource  ../PageObjects/CreateInterviewSchedule.robot
Resource  ../PageObjects/FirstRoundInterview.robot
Resource  ../PageObjects/CreateInterview.robot
Resource  ../PageObjects/SendInterviewInvite.robot
Resource  ../PageObjects/CreateJobOffer.robot
Resource  ../PageObjects/PendingEmployees.robot


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP072.json
${csv_path}  ./CSV/td_BP072.csv
*** Test Cases ***

Scenario: End To End ( External Candidate for Executive position)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    Log  Requisition management(Create/Update/Post)
    Login Using  ${data}[Login User]
    click on homepage
    Go to my team hiring
    Click on add button
    Create Requisition  ${data}
    ${req_id}=  Get Requisition Id
    Logout
    Login Using  ${data}[Recruiter Username]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Submit Job Requisition by Reviewer  ${data}
    Search for requisition id  ${req_id}
    Click on Actions dropdown
    Click on Move to Posting
    Edit Internal Career Site Posting Information   ${data}[Expiry date]
    Edit External Career Site Posting Information Section  ${data}[Expiry date]
    Click on Job Formatting link
    Edit Employer Description
    Sleep  420s

    Log  Candidate creation(MFA in external career site and apply to the requisition)
    Execute Javascript   window.open('https://fa-ehtc-dev10-saasfaprod1.fa.ocs.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1');
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Search Requisition  ${req_id}
    Click on Apply Now
    Enter Email E2E  ${data}[Email]
    Fill Personal Info  ${data}
    Click on Submit Application
    ${applicant_name}=  Get Profile Name
    Sleep  5s

    Log  Candidate screening
    Switch Window  ${list}[0]
    Click on Overview link in the side panel
    Click on Active Applications
    Select Application By Name  ${applicant_name}
    Click on Details
    Review personal details  ${applicant_name}
    Click on Attachments
    Download Attached Files
    Click on Questions Button
#    Click on Extra Info
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Select State  ${data}[Move to State]
    Click on Save
    Click on Move
    Select Phase  ${data}[Next Phase]
    Select State  ${data}[Next State]
    Click on Save
    Click on Back
    Navigate Back

    Log  Create interview schedule
    Click on Interviews
    Click on Add Interview
    Schedule Interview  ${data}
    Publish Interview  ${data}[Interview Schedule]
    Click on First Round Interview
    Click on Add button in First Round Interview page
    Create Interview    ${data}[Interview Date]   ${data}[Start time]    ${data}[End time]    ${data}[Meeting Duration]    ${data}[Web Conference link]    ${data}[Interviewer Name]
    Click on back button in First Round Interview page
    Click on Overview link in the side panel
    Click on Active Applications
    Select Application By Name  ${applicant_name}
    Click on Actions and Select Send Interview Invite
    Select Schedule and Save

    Log  Candidate choosing a slot
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Search for schedule Interview mail
    Switch Window  ${list}[1]
    Reload Page
    Select Slot  ${req_id}

    Log  Offer creation(recruiter)(Depending on the type of requisition application)
    Switch Window  ${list}[0]
    Click on Actions and Select  ${data}
    Select Sections
    Fill When and Why  ${data}
    Fill Assignment Info  ${data}
    Click on Offer Team Continue
    Fill Payroll Info  ${data}
    Fill Salary  ${data}
    Fill Attachments  ${data}
    Fill Additional Info  ${data}
    Fill Offer Letter  ${data}
    Click on Submit
    Click on Details
    Sleep  30s
    Reload Page

    Log  Recruiter accepts the offer on behalf of candidate
    Click on Actions and Select Accept Offer
    Sleep  30s
    Reload Page

    Log  Recruiter clicks on move to HR
    Click on Actions and Select Move to HR
    Sleep  3s
    Logout

    Log  HR converts pending worker to candidate
    Login Using  ${data}[Journeys Specialist User]
    click on homepage
    Go to my client groups show more
    Click on Pending Employees
    Take Action on Pending Employee  ${applicant_name}  ${data}[PW Action]
    Logout