*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MergeCandidates.robot

*** Keywords ***
Click Continue
    Wait And Click Element  ${ctn_btn}
    Wait Until Page Contains  Select Candidate to Retain

Click Submit
    Wait And Click Element  ${merge_sub_btn}
    Sleep  5s
    Wait And Click Element  ${warning_yes}
    Sleep  5s

