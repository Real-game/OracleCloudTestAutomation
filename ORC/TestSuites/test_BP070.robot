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
Resource    ../PageObjects/CollectFeedback.robot
Documentation  UAT_Auto_BP070_E2E Recruiter managing Candidate applications, End To End (Candidate Management)
...            Prerequisite:  Position code
...            Environment Specific Data:  Recruiter Login
...            Reusable Data: Requisition ID;Candidate Last Name;Interview Schedule;Interview Date;Start time;End time;Meeting Duration;Web Conference link;Interviewer Name
...            Dynamic Data: position_id; Hiring Manager; HRBP; Collaborator; Recruiter
...            Automation Data: RequisitionId (Data fetch from Automation code)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP070.json
${csv_path}  ./CSV/td_BP070.csv
*** Test Cases ***

Scenario: End To End (Candidate Management)
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Candidate Application Management
    Login Using  ${data}[Recruiter Username]
    click on homepage
    Go to my client group hiring
    Search for requisition id  ${data}[Requisition ID]
    Click on Overview link in the side panel
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Last Name]
    Click on Details
    Review personal details  ${data}[Candidate Last Name]
    Click on Attachments
    Download Attached Files
    Click on Questions Button
#    Click on Extra Info
    Click on Move
    Select Phase  ${data}[Move to Phase]
    Select State  ${data}[Move to State]
    Click on Save
    Click on Back
    Navigate Back
    Log  Create interview schedule
    Click on Interviews
    Click on Add Interview
    Schedule Interview  ${data}
#    Publish Interview  ${data}[Interview Schedule]    #Automatically Published
    Click on First Round Interview
    Click on Add button in First Round Interview page
    Create Interview     ${data}[Start time]    ${data}[End time]    ${data}[Meeting Duration]    ${data}[Web Conference link]    ${data}[Interviewer Name]
    Click on back button in First Round Interview page
    Click on Overview link in the side panel
    Click on Active Applications
    Select Application By Name  ${data}[Candidate Last Name]
    Click on Actions and Select Send Interview Invite
    Select Schedule and Save

    Log  Move the candidate to Interview Phase and State
    Click on Move
    Select Phase  ${data}[Next Phase]
    Select State  ${data}[Next State]
    Click on Save
    Click on Back
    Navigate Back
    Logout

#    Log  Candidate choosing a slot
#    Execute Javascript   window.open('https://fa-ehtc-dev10-saasfaprod1.fa.ocs.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1');
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[1]
#    Click on Manage Profile
#    Login with email in E2E  ${data}[Email]
#    Search for Schedule Interview Mail in Candidate Inbox   ${data}[Email]
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[1]
#    Reload Page
#    Select Slot  ${data}[Requisition ID]

#    Log  Collect Interview Feedback
#    Switch Window  ${list}[0]
#    Sleep  5s
#    Login Using  ${data}[Recruiter Username]
#    click on homepage
#    Go to my client group hiring
#    Search for requisition id   ${data}[Requisition ID]
#    Click on Active Applications
#    Click on collect Feedback link for the applicant   ${data}[Candidate Last Name]
#    Submit Collect Feedback action   ${data}
#    Logout
#
#    Log  Submit the feedback
#    Login Using  ${data}[Login User]
#    Click on Notifications Icon
#    Display All notifications
#    Search for a notification   Complete the interview
#    Click on the submit feedback link
#    Submit interview feedback questionnaire
#    Logout
#
#    Log  View the Submitted feedback
#    Login Using  ${data}[Recruiter Username]
#    click on homepage
#    Go to my client group hiring
#    Search for requisition id  ${data}[Requisition ID]
#    Click on Active Applications
#    Select Application By Name  ${data}[Candidate Last Name]
#    View Feedback

#    Log  Move candidate to offer
#    Click on Move
#    Select Phase  ${data}[Offer Phase]
#    Select State  ${data}[Offer State]
#    Click on Save
#    Click on Back
#    Navigate Back

