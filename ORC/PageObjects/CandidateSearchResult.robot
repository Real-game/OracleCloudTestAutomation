*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidateSearchResult.robot

*** Keywords ***

Select Add Requisition action to the search candidate
    Sleep  2s
    Wait And Click Element  ${candidate_search_action}
    Capture Page Screenshot
    Wait And Click Element  ${add_to_requisition}
    Log To Console  Add to Requisition option is clicked.
    Sleep  3s

Select the candidate record
    [Arguments]  ${candidate_name}
    Sleep  10s
    Wait And Click Element  (//a[contains(@title,"${candidate_name}")])[1]
    Sleep  3s
    capture page screenshot
    Log To Console  Candidate record is clicked.

