*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UpdatePositionReview.robot

*** Keywords ***

Review Details And Click Submit Button
    [Arguments]  ${type_value}  ${head_count_value}
    IF  "" !=""
        page should contain  ${type_value}
    END
    page should contain  ${head_count_value}
    reload page
    Sleep  5s
    Wait And Click Element  ${submit_button}
    Sleep  5s
    Select Warning Yes
    Sleep  5s
    Capture Page Screenshot

Review Quick Action Details And Click Submit Button
    [Arguments]  ${regular_temporary_value}  ${full_part_time_value}
    page should contain  ${regular_temporary_value}
    page should contain  ${full_part_time_value}
    reload page
    Sleep  5s
    Wait And Click Element  ${submit_button}
    Sleep  5s
    Select Warning Yes
    Sleep  5s
    Capture Page Screenshot

Select Warning Yes
    Sleep  5s
    page should contain button  ${warning_button_Yes}
    Wait And Click Element  ${warning_button_Yes}
    Sleep  5s
    Capture Page Screenshot

Confirm Message
    Wait And Click Element  ${confirm_button}
    Sleep  5s
    Capture Page Screenshot