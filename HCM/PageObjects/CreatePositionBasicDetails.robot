*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreatePositionBasicDetails.robot

*** Keywords ***


Create Position Basic Details
    [Arguments]  ${date}  ${unit}  ${name}  ${code}
    IF  "${date}" != ""
        Wait And Set Text  ${effective_start_date}  ${date}
    END
    Wait And Send Keys  ${business_unit}  ${unit}
    Wait And Send Keys  ${position_name}  ${name}
    Wait And Send Keys  ${position_code}  ${code}
    Sleep  3s
    Capture Page Screenshot

Click Next
    Wait And Click Element  ${next_button}
    Sleep  7s
    Capture Page Screenshot

Click Submit
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot