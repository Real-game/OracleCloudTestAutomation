*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/CurrentJobs.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Search button on Current jobs page
    Wait And Click Element  ${current_jobs_search_button}
    Wait And Verify Page Contains Text  Jobs  20s  Jobs page is not found
    Capture Page Screenshot And Retry If Required

Verify job posted in jobs page
    Wait And Verify Page Contains Element  ${job_posted}  20s  No Jobs is not posted in Current Jobs page
    Capture Page Screenshot And Retry If Required
