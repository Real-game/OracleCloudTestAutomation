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

Select Ex-Employee Duplicates and Merge
#    [Arguments]  ${firstname}  ${lastname}
    ${duplicate_xpath}=  Catenate  SEPARATOR=  //div[text()='Ex-Employees']/following::button[1]
    wait and click element  ${duplicate_xpath}
    Sleep  2s
    Wait And Click Element  ${merge_btn}
    Wait until Page Contains  Merge Candidates  30s
    capture Page Screenshot
    Sleep  2s
    Click Continue
    Sleep  2s
    Click Submit
    Sleep  30s
    ${done_button_xpath}=  Catenate  SEPARATOR=  (//*[@aria-label="Done"])[1]
    wait and click element   ${done_button_xpath}