*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CheckDuplicates.robot
Resource  ../PageObjects/MergeCandidates.robot

*** Keywords ***
Click Merge
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${validator}
    IF  "${status}"=="False"
        Wait And Click Element  ${merge_btn}
        Wait until Page Contains  Merge Candidates  30s
        Capture Page Screenshot
        Click Continue
        Click Submit
    ELSE
        Wait And Click Element  ${back_btn}
        Wait until Page Contains  Details
        Capture Page Screenshot
    END