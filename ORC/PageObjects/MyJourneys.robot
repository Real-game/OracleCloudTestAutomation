*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MyJourneys.robot

*** Keywords ***

Navigate to checklist task page
    Sleep  15s
    Wait Until Element Is Visible  ${active_tile}  20  Active tile for the candidate to navigate to checklist page is not displayed
    Capture Page Screenshot
    Click Element   ${active_tile}
    Wait Until Page Contains  Welcome to Metrolinx  20  Checklist task list page is not displayed


