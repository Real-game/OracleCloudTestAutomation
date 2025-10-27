*** Settings ***
Library  Selenium2Library
Resource  ../Locators/CurrentJobs.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Search
    Wait And Click Element  ${search_icon}
    Wait Until Element Contains  ${title}  Jobs
    Capture Page Screenshot

Click on Job Applications
    Wait And Click Element  ${job_applications}
    Wait Until Element Contains  ${job_applications_page_title}  Job Applications
    Capture Page Screenshot
