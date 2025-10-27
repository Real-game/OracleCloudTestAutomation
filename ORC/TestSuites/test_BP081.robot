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
Resource  ../PageObjects/CurrentJobs.robot
Resource  ../PageObjects/Jobs.robot
Resource  ../PageObjects/JobPage.robot
Resource  ../PageObjects/CompleteJobApplication.robot
Resource  ../PageObjects/ScheduleInterview.robot
Resource  ../PageObjects/JobOffers.robot
Resource    ../PageObjects/CollectFeedback.robot
Documentation  Internal applicant - Transfer OR Promotions - Contract to Permanent
...            Prerequisite: Requisition should be created
...            Environment Specific Data: req_id,Expiry date,Recruiter user,Candidate Name
...            Reusable Data: Not Applicable
...            Dynamic Data: Candidate login,req_id
...            Automation Data:


*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP067.json
${csv_path}  ./CSV/td_BP067.csv

*** Test Cases ***

Scenario: End To End ( Internal Candidate )
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log   Step 1 Requisition Initiation by hiring manager
    Login Using  ${data}[Login user]
    click on homepage
    Go to my team hiring
    Click on add button
    Create Requisition  ${data}
    ${req_id} =  Get Requisition Id
    appendtojson  ${json_path}  RequisitionId  ${req_id}
    generatecsv  ${json_path}  ${csv_path}
    Logout

    Log   Step 2 Requisition submission by recruiter
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Submit Job Requisition by Reviewer  ${data}
    Search for requisition id  ${req_id}
    Click on Actions dropdown
    Click on Move to Posting
    Edit Internal Career Site Posting Information   ${data}[Expiry date]
    Sleep  7s
#    Edit External Career Site Posting Information Section  ${data}[Expiry date]
    Click on Job Formatting link
    Edit Employer Description
    Logout
    Sleep  420s

    Log  Step 3 Internal Candidate apply for a requisition
	Login Using  ${data}[Candidate login]
    click on homepage
    Go to Current Jobs
    Click on Search
    Search Job  ${req_id}
    #Verify Job Details  ${data}[Min sal]  ${data}[Max sal]  ${data}[Job Type]
    Click on Apply
#    Answer Questions  ${data}
    Upload Resume  ${data}[Resume Path]
    Sign Signature  ${data}[E-sign]
    Click on Submit Job Application
#    Click on Submitted Applications
#    Log  Step 5
#    Click on Accept button
#    Log  Step 6
#    Sign Employee Signature  ${data}[Signature]
#    Log  Step 7
#    Click on Submit Accept Offer
    Logout
    Sleep  5s

    Log  Step 4 Candidate Application Screening
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Click on Overview link in the side panel
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Name]
    #Review personal details  ${data}[Candidate Name]
#    Click on Attachments
#    Download Attached Files
    #Click on Questions Button
#    Click on Extra Info
    Sleep  20s
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
    Logout

	Log  Step 5 Create Offer letter
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Name]
    Sleep  10s
    Click on Actions and Select  ${data}
    Select Sections
    Fill When and Why  ${data}
    Fill Assignment Info for Transfer  ${data}
    Click on Offer Team Continue
    Sleep  60s
    Fill Payroll Info  ${data}
    Fill Salary  ${data}
    Fill Attachments  ${data}
    Fill Additional Info For Transfer  ${data}
    Fill Offer Letter  ${data}
    Click on Submit
    Click on Details
    Sleep  20s
    Logout

    Log  Step 6 Offer Approval
    Login Using  ${data}[Login user]
    click on homepage
    Search for Notifications E2E  ${data}[Candidate Name]
    Review Offer and Take Action E2E  ${data}[Notification Action]
    Logout

    Log  Step 7 Offer Extension
    Login Using  ${data}[Recruiter user]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Name]
    Click on Actions and Select Extend Offer
    Sleep  15s
    Logout
    Sleep  10s

    Log  Step 8 Candidate Accepts the offer
	Login Using  ${data}[Candidate login]
    Click on homepage
    Search for Offer Notifications
    Respond to Job Offer Internal  ${data}[Respond to Offer]  ${data}[Decline Reason]  ${data}[Comments]  ${data}[E-sign]
    Logout

    Log  Step 9 Recruiter moves to HR
    Login Using  ${data}[Recruiter user]
    Click on homepage
    Go to my client group hiring
    Search for requisition id  ${req_id}
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Name]
    Click on Actions and Select Move to HR
    Logout
