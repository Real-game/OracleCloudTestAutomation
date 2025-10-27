*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Payroll.robot

*** Keywords ***
Click Submit A Flow
    Mouse Over  ${submit_a_flow}
    Wait And Click Element  ${submit_a_flow}
    Wait And Verify Page Contains Text  Flow Submission  20s  Flow Submission page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Payroll Relationships
    Wait And Click Element  ${payroll_relationship_first}

Search and click on Person
    [Arguments]  ${personnumber}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${personnumber}"]
    Sleep  3s
    Wait And Verify Page Contains Text  Payroll Relationships  20s  Payroll Relationships not found
    Capture Page Screenshot And Retry If Required

Select Effective As on Date
    ${start_date_value} =  Get Text  ${start_date}
    ${check}=  Run Keyword And Return Status  Wait And Set Text  ${effective_as_of_date_field}  ${start_date_value}
    IF  '${check}'=='False'
        Wait And Set Text  ${effective_as_of_date_field}  ${start_date_value}
    END

Click on Assigment under Payroll Relationship:Worker
    [Arguments]  ${duration}
    Wait And Click Element  ${payroll_realtionship_worker_assignment}
    Sleep  4s
    ${check}=  Run Keyword And Return Status  Element should be visible  ${payroll_details_no_data}  20s
    IF  '${check}'=='True'
        Wait And Click Element  ${payroll_details_create_button}
        Wait And Set Text  ${payroll_duration_field}  ${duration}
        ${payroll_start_date} =  Get Text  ${payroll_start_date}
        IF  "${payroll_start_date}" == ""
            Log  Payroll Start Date is not pre populated
        ELSE
            Log  Payroll Start Date is pre populated - ${payroll_start_date}
        END
        Wait And Click Element  ${save_button}
        Sleep  5s
        Capture Page Screenshot And Retry If Required
        Wait And Click Element  ${back_button}
    ELSE
        Log  Payroll Details present
        Wait And Click Element  ${back_button}
    END

Click on Latest Assignment under Payroll Relationship:Worker
    Wait And Click Element  ${payroll_realtionship_worker_assignment_latest}
    Sleep  3s
    ${effective_start_date_value} =  Get Text  ${effective_start_date}
    ${check}=  Run Keyword And Return Status  Wait And Set Text  ${effective_as_of_date_field}  ${effective_start_date_value}
    IF  '${check}'=='False'
        Wait And Set Text  ${effective_as_of_date_field}  ${effective_start_date_value}
    END

Click on old Assignment under Payroll Relationship:Worker
    Wait And Click Element  ${payroll_realtionship_worker_assignment_old}
    Sleep  3s
    ${effective_end_date_value} =  Get Text  ${effective_end_date}
    Log  Effective End Date of Old Assigement is ${effective_end_date_value}
    #IF  "${effective_start_date_value}" == ""
        ${current_date} =  get_current_date_dd_mmm_yyyy
        ${check}=  Run Keyword And Return Status  Wait And Set Text  ${effective_as_of_date_field}  ${current_date}
        IF  '${check}'=='False'
            Wait And Set Text  ${effective_as_of_date_field}  ${current_date}
        END
    #END


Add Payroll Frequency
    [Arguments]  ${duration}
    ${check}=  Run Keyword And Return Status  Element should be visible  ${payroll_details_no_data}  20s
    IF  '${check}'=='True'
        Wait And Click Element  ${payroll_details_create_button}
        Wait And Set Text  ${payroll_duration_field}  ${duration}
        Sleep  2s
        ${payroll_start_date} =  Get Text  ${payroll_start_date}
        IF  "${payroll_start_date}" == ""
            Log  Payroll Start Date is not pre populated
        ELSE
            Log  Payroll Start Date is pre populated - ${payroll_start_date}
        END
        Wait And Click Element  ${save_button}
        Sleep  5s
        Capture Page Screenshot And Retry If Required
    ELSE
        Log  Payroll Details present
    END







