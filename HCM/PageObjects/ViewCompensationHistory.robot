*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ViewCompensationHistory.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select Overall Salary
    Wait And Click Element  ${overall_salary}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Salary Details in Salary History
    scroll element into view  ${compensation_details}
    Wait And Click Element  ${compensation_details}
    Wait And Verify Page Contains Element  ${salary_details_header}  20s  Salary details is displayed
    Capture Page Screenshot And Retry If Required

Get Salary History End Date Value
    ${checker}=  Run Keyword and Return Status  ELEMENT SHOULD BE VISIBLE  ${salary_end_date}
    IF  '${checker}'=='True'
        mouse over  ${salary_end_date}
        ${end_date_value}=  get text  ${salary_end_date}
    ELSE
        ${checker2}=  Run Keyword and Return Status  ELEMENT SHOULD BE VISIBLE  ${salary_end_date_value}
        IF  '${checker2}'=='True'
            mouse over  ${salary_end_date_value}
            ${end_date_value}=  get text  ${salary_end_date_value}
        END
    END
    Log  ${end_date_value}
    [Return]  ${end_date_value}

Get Effective End Date Value
    mouse over  ${salary_effective_end_date}
    ${end_date_value}=  get text  ${salary_effective_end_date}
    Log  ${end_date_value}
    [return]  ${end_date_value}

Check Salary History Future value
    [Arguments]  ${end_date_value}
    ${current_date}=  Get Current Date Dd Mmm Yyyy
    Log  Current Date: ${current_date}
    IF  '${end_date_value}'!=''
        IF  '${end_date_value}'=='Ongoing'
            Log  Salary History End Date in Ongoing.
        ELSE
            ${status}=  dateCompare  ${current_date}  ${end_date_value}
            IF  '${status}'=="Future Date"
                Log  Salary History End Date:${end_date_value}
                Log  Salary History End Date is in Future date.
            ELSE IF  '${status}'=="Past Date"
                Log  Salary History End Date:${end_date_value}
                FAIL  Salary History End date in Past date as not expected
            ELSE IF  '${status}'=='Same Date'
                Log  Salary History End Date:${end_date_value}
                FAIL  Salary History End date in Same date as not expected
            END
        END
    ELSE
        Log  Salary History End Date is Empty.
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Salary basis has value
    Wait And Verify Page Contains Element  ${salary_basis_value}  20s  Salary basis value not displayed
    ${salary_base_value}=  get text  ${salary_basis_value}
    Log  ${salary_base_value}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Extract overall salary value
    Wait Until Page Contains  Overall Salary  30s  Overall salary page is not displayed
    ${overall_salary_value}=  Get Element Attribute  ${overall_salary_value}  innerHTML
    [return]  ${overall_salary_value}