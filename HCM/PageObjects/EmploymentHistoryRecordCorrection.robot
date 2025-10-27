*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/EmploymentHistoryRecordCorrection.robot

*** Keywords ***
Expand Assignment And Click Pencil Icon
    Sleep  3s
    Wait And Click Element  ${expand_assignments}
    Sleep  3s
    Wait And Click Element  ${edit_symbol}
    capture page screenshot

Edit Hourly Paid Or Salaried Parameter
    [Arguments]  ${value}
    Sleep  5s
    Wait And Click Element  ${dropdown_hourly_paid_or_salaried}
    Sleep  3s
    Wait And Click Element  xpath://li[text()='${value}']
    Sleep  3s
    capture page screenshot

Click Save
    Wait And Click Element  ${save_button}
    Sleep  5s

Click Submit
    Wait And Click Element  ${submit_button}
    wait until page contains  Employment Info  20s
    Sleep  5s
    capture page screenshot

Click Delete button
    Wait And Click Element  ${delete_button}
    Sleep  2s
    Capture Page Screenshot

Click Warning OK
    Wait And Click Element  ${warning_ok}
    Sleep  3s
    Capture Page Screenshot
