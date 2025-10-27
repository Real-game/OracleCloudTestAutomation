*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  ../Keywords/CommonKeywords.py
Resource  ../Locators/BenefitsServiceCenter.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Search and click on newly hired Person
    [Arguments]  ${personnumber}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${personnumber}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Enrollment plan for Override
    ${plan_action_xpath}=  Catenate  SEPARATOR=  //span[text()='Metrolinx Benefit Program']//following::div//a[contains(@id,'bEnPse:OvrCil')]
    ${count}=  get element count  ${plan_action_xpath}
    Log  Plan Counnt: ${count}
    ${count}=  Evaluate  ${count}+${1}
    Log  Count:${count}
    ${plan_number}=  Set Variable  ${0}
    FOR  ${i}  IN RANGE  1  ${count}
        Log  Plan selected:${i}
        ${plan_number}=  Evaluate  ${plan_number}+${1}
        Log  value: ${plan_number}
        ${plan_check}=  Catenate  SEPARATOR=  ((//span[text()='Metrolinx Benefit Program']//following::a[contains(@id,'bEnPse:OvrCil')])[${i}]//ancestor::td[2]//preceding-sibling::td//following-sibling::td)[1]
        scroll element into view  ${plan_check}
        ${check}=  Run Keyword and Return Status  element should not contain  ${plan_check}  Override
        Log  ${check}
        IF  '${check}'=='True'
            ${plan_select}=  Catenate  SEPARATOR=  (//span[text()='Metrolinx Benefit Program']//following::div//a[contains(@id,'bEnPse:OvrCil')])[${i}]
            mouse over  ${plan_select}
            Wait And Click Element   ${plan_select}
            Exit For Loop
        END
    END
    IF  '${check}'=='False'
        FAIL  All the Enrollment plans are already overrided
    END
    Wait And Verify Page Contains Element  ${override_enrollment}  5s  Override Enrollment action is not displayed
    Wait And Click Element  ${override_enrollment}
    Wait And Verify Page Contains Element  ${coverage_start_date}  10s  Coverage Start Date is not displayed
    Capture Page Screenshot And Retry If Required
    [return]  ${plan_number}

Enter Coverage Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${coverage_start_date}  ${date}
    Sleep  2s

Click Save And Close
    Wait And Click Element  ${save_and_close}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Enrollment Plan has Overrided
    [Arguments]  ${plan_number}
    ${override_check}=  Catenate  SEPARATOR=  ((//span[text()='Metrolinx Benefit Program']//following::a[contains(@id,'bEnPse:OvrCil')])[${plan_number}]//ancestor::td[2]//preceding-sibling::td//following-sibling::td)[1]
    scroll element into view  ${override_check}
    element should contain  ${override_check}  Override
    Capture Page Screenshot And Retry If Required

Add a Life Event and Save
    [Arguments]  ${lifeEvent}
    Wait And Click Element  ${potential_life_events_add_button}
    Wait And Click Element  ${potential_life_event_dropdown}
    Wait And Click Element  xpath: //div[@class='AFPopupMenuContent']//li[text()= "${lifeEvent}"]
    Wait And Click Element  ${potential_life_event_save_close_button}

Click Actions and Select an Action
    [Arguments]  ${action_to_be_selected}
    Wait And Click Element  ${potential_life_events_actions_button}
    Wait And Click Element  xpath: //td[text()= "${action_to_be_selected}"]
    Sleep  20s
    Wait And Click Element  ${back_button}
    Sleep  5s

Validate Salary Change Life Event
    ${date}=  get_current_date_dd_mmm_yyyy
    ${processed_date}=  Catenate  //div[@title='Evaluated Life Events']//span[text()='Processed and closed on ${date}']
    Element should contain  ${processed_date}  ${date}

Enter Person Number and Click on Advanced Search
    [Arguments]  ${personnumber}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //a[text()='Advanced Search:${personnumber}']
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Check Inactive Assigment Status Checkbox and Click Person
    [Arguments]  ${personnumber}
    Wait And Click Element  ${show_filters_button}
    Wait And Click Element  ${assignment_status_Inactive_checkbox}
    Sleep  3s
    ${checker}=  RUN KEYWORD And Return Status  Wait And Click Element  xpath: //span[text()='${personnumber}']/parent::div/preceding-sibling::div/a
    IF  '${checker}' == 'False'
        Wait And Click Element  xpath: //span[text()='${personnumber}']/parent::div/preceding-sibling::div/a
    END

Verify Termination Event in Potential Life Events
    Wait And Verify Page Contains Element  ${potential_life_events_termination_Detected}  5s  Termination Life Event is not present in Detected Status under Potential Life Events
    ${detected_date_text} =  Get Text  ${potential_life_events_termination_Detected}
    ${detected_date_text_split} =  String.Split String	${detected_date_text}  -
    ${detected_year} =  set variable  ${detected_date_text_split}[2]
    Log to Console  ${detected_year}
    ${detected_month} =  set variable  ${detected_date_text_split}[1]
    Log to Console  ${detected_month}
    ${days_detected_month}=  days_in_month  ${detected_month}  ${detected_year}
    Log to Console  ${days_detected_month}
    ${last_day}  Catenate  ${days_detected_month}-${detected_month}-${detected_year}
    Log to Console  ${last_day}
    Set Global Variable      ${last_day}

Verify Termination Event in Evaluated Life Events
    Wait And Verify Page Contains Element  ${evaluated_life_events_termination_processed}  5s  Termination Life Event is not present in Processed Status under Evaluated Life Events

Select First Enrollment plan
    Wait And Verify Page Contains Element  ${enrollment_first_plan}  20s  Enrollment plan is not displayed
    Wait And Click Element  ${enrollment_first_plan}
    Wait And Verify Page Contains Text  General Info  20s  Plan page is not displayed
    Capture Page Screenshot And Retry If Required

Expand and Check Defined and Communicated Amount
    ${rates_expand_xpath}=  Catenate  SEPARATOR=  //h2[text()='Rates']//following::a[contains(@id,'LePse:PCEcil7')]
    ${count}=  get element count  ${rates_expand_xpath}
    Log  Rates Counnt: ${count}
    ${count}=  Evaluate  ${count}+${1}
    Log  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Log  Rates selected:${i}
        ${expand_plan}=  Catenate  SEPARATOR=  (//h2[text()='Rates']//following::a[contains(@id,'LePse:PCEcil7')])[${i}]
        scroll element into view  ${expand_plan}
        Wait And Click Element  ${expand_plan}
        ${defined_amount_xpath}=  Catenate  SEPARATOR=  (//label[text()='Defined Amount']//parent::div//following-sibling::div//span)[${i}]
        Wait And Verify Page Contains Element  ${defined_amount_xpath}  10s  Defined amount is not displayed
        ${defined_amount}=  get text  ${defined_amount_xpath}
        Log  Defined Amount: ${defined_amount}
        ${communicated_amount_xpath}=  Catenate  SEPARATOR=  (//label[text()='Communicated Amount']//parent::div//following-sibling::div//span)[${i}]
        Wait And Verify Page Contains Element  ${communicated_amount_xpath}  10s  Communicated amount is not displayed
        ${communicated_amount}=  get text  ${communicated_amount_xpath}
        Log  Communicated Amount: ${communicated_amount}
        IF  '${i}'=='1'
            Log  EE Rates - Defined amount: ${defined_amount}, Communicated amount: ${communicated_amount}
        ELSE
            Log  ER Rates - Defined amount: ${defined_amount}, Communicated amount: ${communicated_amount}
        END
    END

Click Benefit Plan and Verify End Date
    Wait And Click Element  ${benefit_plan_link}
    Wait And Verify Page Contains Text  General Info  10s  General Info of Benefit Plans is not open
    Wait And Verify Page Contains Element  ${coverage_start_end_date}  5s  Coverage Start and End Date is not present
    ${coverage_date_text} =  Get Text  ${coverage_start_end_date}
    Log to Console  ${coverage_date_text}
    Element Should Contain   ${coverage_start_end_date}  ${last_day}

Get Last day of the month
    [Arguments]  ${month}

Verify Event in Detected State
    [Arguments]  ${event}
    ${detected_xpath}  Catenate  //div[@title='Potential Life Events']//span[text()='${event}']/ancestor::tr[1]//span[contains(text(),'Detected')]
    Wait And Verify Page Contains Element  ${detected_xpath}  5s  ${event} Life Event is not present in Detected Status under Potential Life Events
    scroll element into view  ${detected_xpath}
    Capture Page Screenshot And Retry If Required

Verify Event in Processed State in Evaluated Life Events
    [Arguments]  ${event}
    ${detected_xpath}  Catenate  //div[@title='Evaluated Life Events']//span[text()='${event}']/ancestor::tr[1]//span[contains(text(),'Processed')]
    Wait And Verify Page Contains Element  ${detected_xpath}  5s  ${event} Life Event is not present in Processed Status under Evaluated Life Events

Verify Event in Processed State in Potential Life Events
    [Arguments]  ${event}
    ${detected_xpath}  Catenate  //div[@title='Potential Life Events']//span[text()='${event}']/ancestor::tr[1]//span[contains(text(),'Processed')]
    Wait And Verify Page Contains Element  ${detected_xpath}  5s  ${event} Life Event is not present in Processed Status under Potential Life Events
    scroll element into view  ${detected_xpath}
    Capture Page Screenshot And Retry If Required

Verify Enrollment Option is displayed
    scroll element into view  ${evaluated_life_events_new_hire_enrollment}
    Wait And Verify Page Contains Element  ${evaluated_life_events_new_hire_enrollment}  5s  "Enrollment window started" - not displayed
    Wait And Verify Page Contains Element  ${enroll_button}  5s  Enrollment option is not displayed
    Capture Page Screenshot And Retry If Required

Validate Temporary Assignment in Benefits
    Wait And Click Element  ${employment_info_section}
    Wait And Verify Page Contains Text  Employment Info  10s  Employment Info of Benefits is not open
    Wait And Click Element  ${employment_history_expand_icon}
    Sleep  2s
    Wait And Verify Page Contains Element  ${temp_assigment_employment_history}  5s  Temporary Assignemnt is not assigned to the employee

