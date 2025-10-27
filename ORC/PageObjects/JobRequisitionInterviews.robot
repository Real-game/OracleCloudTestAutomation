*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisitionInterviews.robot

*** Keywords ***
Click on Add Interview
    Wait And Click Element  ${add}
    Wait Until Page Contains  Create Interview Schedule
    Capture Page Screenshot

Publish Interview
    [Arguments]  ${value}
#    ${list}=  Get WebElements  //img[@title="Actions"]
#    ${count}=  Get Length  ${list}
#    ${count}=  Evaluate  ${count}-1
#    Wait And Click Element  ${list}[${count}]
    Wait And Click Element  ${action_list}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${value}"]
    Sleep  3s
#    Select Required Value  ${interview_drop}  ${value}
    Capture Page Screenshot

Click on First Round Interview
    Wait Until Element Is Visible    ${first_round_interview_link}      20     First Round Interview link is not displayed
    Capture Page Screenshot
    Click Element   ${first_round_interview_link}
    Log  First Round Interview link is clicked

