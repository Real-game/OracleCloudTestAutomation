*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/EmploymentInfo.robot

*** Keywords ***

Verify Employment Info Page
    [Arguments]  ${job}  ${position}  ${business_title}  ${department}  ${grade}  ${barganing_unit}  ${location}  ${manager_name}
    page should contain  Employment Info
    Sleep  5s
    IF  "${job}" != ""
        PAGE SHOULD CONTAIN  ${job}
        Sleep  2s
    END
    IF  "${position}" != ""
        PAGE SHOULD CONTAIN  ${position}
        Sleep  2s
    END
    IF  "${business_title}" != ""
        PAGE SHOULD CONTAIN  ${business_title}
        Sleep  2s
    END
    IF  "${department}" != ""
        PAGE SHOULD CONTAIN  ${department}
        Sleep  2s
    END
    IF  "${grade}" != ""
        PAGE SHOULD CONTAIN  ${grade}
        Sleep  2s
    END
    IF  "${barganing_unit}" != ""
        PAGE SHOULD CONTAIN  ${barganing_unit}
        Sleep  2s
    END
    IF  "${location}" != ""
        PAGE SHOULD CONTAIN  ${location}
        Sleep  2s
    END
    IF  "${manager_name}" != ""
        PAGE SHOULD CONTAIN  ${manager_name}
        Sleep  2s
    END
    Sleep  3s
    capture page screenshot

Expand Employment History
    Sleep  3s
    Wait And Verify Page Contains Element  ${expand_employment_history}  10s  Employment history expand option not displayed
    scroll element into view  ${expand_employment_history}
    Wait And Click Element  ${expand_employment_history}
    Sleep  3s
    capture page screenshot

Click Link Of First Row From Employment Info
    Sleep  5s
    scroll element into view  ${first_row_employment_history}
    Wait And Click Element  ${first_row_employment_history}
    Sleep  3s
    capture page screenshot

Verify Sections of Employment Details
    Wait And Verify Page Contains Element  ${assigment_section_header}  20s  Assignement details is not present
    Wait And Verify Page Contains Element  ${managers_section_header}  20s  Managers details is not present
    Wait And Verify Page Contains Element  ${additional_assigment_section_header}  20s  Additional Assigment Info details is not present
    Wait And Verify Page Contains Element  ${direct_reports_section_header}  20s  Direct Reports details is not present
    Wait And Verify Page Contains Element  ${employment_history_section_header}  20s  Employment History details is not present

Click on Back Button
    Sleep  3s
    Wait And Click Element  ${back_button}

Verify Sections of Employment Details for Employee Role
    Wait And Verify Page Contains Element  ${assigment_section_header}  20s  Assignement details is not present
    Wait And Verify Page Contains Element  ${managers_section_header}  20s  Managers details is not present
    Wait And Verify Page Contains Element  ${additional_assigment_section_header}  20s  Additional Assigment Info details is not present
    Wait And Verify Page Contains Element  ${employment_history_section_header}  20s  Employment History details is not present

Verify Employment History has Transfer
    scroll element into view  ${first_row_employment_history}
    ${value}=  wait and get text  ${first_row_employment_history}
    IF  '${value}'=='Transfer'
        Capture Page Screenshot And Retry If Required
    ELSE
        FAIL
    END

Verify Employment History has Temporary Assignment
    scroll element into view  ${first_row_employment_history}
    ${value}=  wait and get text  ${first_row_employment_history}
    IF  '${value}'=='Temporary Assignment'
        Capture Page Screenshot And Retry If Required
    ELSE
        FAIL
    END
