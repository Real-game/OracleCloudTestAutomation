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
    Sleep  5s
    Wait And Verify Page Contains Text  Payroll Relationship  20s  Payroll Relationships not found
    Capture Page Screenshot And Retry If Required

Select Effective As on Date
    ${start_date_value} =  Get Text  ${start_date}
    ${check}=  Run Keyword And Return Status  Wait And Set Text  ${effective_as_of_date_field}  ${start_date_value}
    IF  '${check}'=='False'
        Wait And Set Text  ${effective_as_of_date_field}  ${start_date_value}
        Sleep    3s
    END
    Sleep    3s
    Capture Page Screenshot And Retry If Required

Click on Assigment under Payroll Relationship:Worker
    [Arguments]  ${duration}
    Wait And Click Element  ${payroll_realtionship_worker_assignment}
    Sleep  20s
    ${check}=  Run Keyword And Return Status  wait until element is visible  ${payroll_details_no_data}  20s
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
        Sleep  20s
        Capture Page Screenshot And Retry If Required
        Wait And Click Element  ${back_button}
    ELSE
        Log  Payroll Details present
        Wait And Click Element  ${back_button}
    END

Click on Latest Assignment under Payroll Relationship:Worker
    Wait And Click Element  ${payroll_realtionship_worker_assignment_latest}
    Sleep  20s
    ${effective_start_date_value} =  Get Text  ${effective_start_date}
    ${check}=  Run Keyword And Return Status  Wait And Set Text  ${effective_as_of_date_field}  ${effective_start_date_value}
    IF  '${check}'=='False'
        Wait And Set Text  ${effective_as_of_date_field}  ${effective_start_date_value}
    END

Click on old Assignment under Payroll Relationship:Worker
    Wait And Click Element  ${payroll_realtionship_worker_assignment_old}
    Sleep  20s
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
        Sleep  12s
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

Check Relatioship Type has value
    scroll element into view  ${relationship_type_value}
    Wait And Verify Page Contains Element  ${relationship_type_value}  20s  Relationship Type value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Payroll details has value
    [Arguments]  ${status}
    ${payroll_details_value}=  Catenate  SEPARATOR=  //span[text()='Payroll']/following::span[@title='${status}']
    scroll element into view  ${payroll_details_value}
    Wait And Verify Page Contains Element  ${payroll_details_value}  20s  Payroll details has not displayed value : ${status}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Search Person on Left Side Panel
    Wait And Click Element  ${search_person_left_side}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Payroll Submit Button
    Wait And Verify Page Contains Element  ${submit_button}  60s  Submit button not displayed
    Wait And Click Element  ${submit_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Person number and search in Keywords field
    [Arguments]  ${number}
    Wait And Set Text  ${Keywords_input}  ${number}
    Sleep  2s
    Wait And Click Element  ${Search_keyword}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Simplified Quick Pay under Action button
    scroll element into view  ${action_button}
    Wait And Click Element  ${action_button}
    Sleep  5s
    Wait And Click Element  ${quick_pay}
    Sleep  2s
    Wait And Click Element  ${simplified_quick_pay}
    Wait And Verify Page Contains Element  ${standard_entry}  20s  Simplified Quick pay page not displayed
    Capture Page Screenshot And Retry If Required

Click on Quick Pay Submit Button
    Wait And Click Element  ${submit_quick_pay}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Statement of earning
    Wait And Verify Page Contains Element  ${statement_of_earning}  180s  Statement of Earnings for an employee is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check elements are checked
    ${check}=  Run Keyword And Return Status  wait until element is visible  ${voluntary_deduction_label}  10s
    IF  "${check}"=="True"
        checkbox should be selected  ${voluntary_deduction_checkbox}
    END
    ${check1}=  Run Keyword And Return Status  Wait wait until element is visible  ${tax_label}  10s
    IF  "${check1}"=="True"
        checkbox should be selected  ${pretax_checkbox}
    END
    ${check2}=  Run Keyword And Return Status  wait until element is visible  ${absence_label}  10s
    IF  "${check2}"=="True"
        checkbox should be selected  ${absences_checkbox}
    END
    ${check3}=  Run Keyword And Return Status  wait until element is visible  ${information_label}  10s
    IF  "${check3}"=="True"
        checkbox should be selected  ${information_checkbox}
    END

Click Calculation Cards under Action button
    Wait And Click Element  ${action_button}
    Sleep  2s
    Wait And Click Element  ${calculation_cards}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Tax Credit Information and check Total Claim Amount
    [Arguments]  ${section_name}  ${total_claim_amount}
    Wait And Click Element  ${tax_credit_info_link}
    Sleep  3s
    IF  '${section_name}'=='Regional'
        Wait And Verify Page Contains Element  ${regional_total_claim_amount}  20s  Regional Total claim amount not displayed
        scroll element into view  ${regional_total_claim_amount}
        ${total_claim_amt}=  Get Text  ${regional_total_claim_amount}
    ELSE IF  '${section_name}'=='Federal'
        Wait And Verify Page Contains Element  ${federal_total_claim_amount}  20s  Federal Total claim amount not displayed
        scroll element into view  ${federal_total_claim_amount}
        ${total_claim_amt}=  Get Text  ${federal_total_claim_amount}
    END
    Should Be Equal As Strings  ${total_claim_amount}  ${total_claim_amt}  Total Claim amount in ${section_name} Section is not same as updated in ESSPAY
    Capture Page Screenshot And Retry If Required

Click Tax Credit Information and check Additional Tax
    [Arguments]  ${additional_tax}
    Wait And Click Element  ${tax_credit_info_link}
    Sleep  3s
    Wait And Verify Page Contains Element  ${federal_additional_tax}  20s  Additional Tax is not displayed
    scroll element into view  ${federal_additional_tax}
    ${federal_additional_tax_UI}=  Get Text  ${federal_additional_tax}
    Should Be Equal As Strings  ${additional_tax}  ${federal_additional_tax_UI}  Additional Tax in Federal Section is not same as updated in ESSPAY09
    Capture Page Screenshot And Retry If Required

Click Add button for Calculation Card
    Wait And Click Element  ${add_calculation_card}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Enter Calculation Card date and Name
    [Arguments]  ${name}
    ${current_date} =  get_current_date_dd_mmm_yyyy
    Wait And Set Text  ${calc_card_eff_date}  ${current_date}
    Sleep  2s
    Wait And Click Element  ${create_calc_card_name}
    Sleep  3s
    ${create_calc_card_name_value}=  Catenate  SEPARATOR=  //a[@title='Search: Name']//following::span[text()='${name}']
    ${check}=  Run Keyword And Return Status  Wait And Click Element  ${create_calc_card_name_value}
    IF  "${check}"=="False"
        mouse over  ${create_calc_card_name_value}
        Wait And Click Element  ${create_calc_card_name_value}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Calculation Card Continue
    Wait And Click Element  ${calc_card_continue}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Involuntary Deduction
    Wait And Click Element  ${involuntary_deduction_link}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Add button for Calculation Component
    Wait Until Element Is Visible   ${add_calculation_component}    20s     Add button not visible
    Wait And Click Element  ${add_calculation_component}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Calculation Component
    [Arguments]  ${component_name}  ${code}
    Wait And Click Element  ${calculation_component_dropdown}
    Sleep  2s
    Select Required Value  ${calculation_component_dropdown_value}  ${component_name}
    Sleep  2s
    Wait And Set Text  ${reference_code}  ${code}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  30s
    Capture Page Screenshot And Retry If Required

Select Order Amount Payee in Calculation Component Detail
    Sleep  10s
    scroll element into view  ${calc_component_detail}
    Sleep  3s
    Wait And Click Element  ${calc_component_detail}
    Sleep  2s
    scroll element into view  ${order_amount_payee_dropdown}
    Sleep  3s
    Wait And Click Element  ${order_amount_payee_dropdown}
    Sleep  2s
    Wait And Click Element  ${order_amount_payee_dropdown_value}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Enter Reference date in Calculation Component Detail
    scroll element into view  ${received_date}
    ${current_date} =  get_current_date_dd_mmm_yyyy
    Wait And Set Text  ${received_date}  ${current_date}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Enter Calculation Value
    scroll element into view  ${enter_calc_value_on_calc_cards}
    Wait And Click Element  ${enter_calc_value_on_calc_cards}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Add button on Calculation Values
    Wait And Click Element  ${add_calc_value}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Display value and Amount in Calculation values
    [Arguments]  ${name}  ${amount}
    ${court_order_amount_diplay_value}=  Catenate  SEPARATOR=  //span[text()='${name}']
    scroll element into view  ${display_value_dropdown}
    Wait And Click Element  ${display_value_dropdown}
    Sleep  2s
    Wait And Click Element  ${court_order_amount_diplay_value}
    Sleep  2s
    Wait And Set Text  ${amount_value_on_calc_value}  ${amount}
    Sleep  2s
    Wait And Click Element  ${edit_calc_value_ok}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Save and Close on Calculation Component page
    Wait And Click Element  ${save_and_close_calc_component}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Involuntary Deduction on Calculation Card
    Wait Until Element Is Visible   ${involuntary_deduc_main_link}      20s     Involuntary Deduction option not displayed
    Scroll Element Into view    ${involuntary_deduc_main_link}
    Wait And Click Element  ${involuntary_deduc_main_link}
    Sleep  5s
    Wait Until Element Is Visible   ${involuntary_deduction_header}     60s     Involuntary deduction header not displayed
    Capture Page Screenshot And Retry If Required

Click Element Entries under Action button
    Wait And Click Element  ${action_button}
    Sleep  2s
    Wait And Click Element  ${element_entries}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Calculation Component present in Element Entries
    [Arguments]  ${component_name1}  ${component_name2}
    Wait Until Element Is Visible   ${element_entries_header}  20s  Element entries page not displayed
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    Sleep  2s
    Execute JavaScript    window.document.getElementById('_FOpt1:_FOr1:0:_FONSr2:0:MAnt2:1:ph1:r7:0:AT1:_ATp:table1::scroller').scrollBy(0,400)
    Sleep  10s
    ${component_value1}=  Catenate  SEPARATOR=  //a[text()='${component_name1}']
    ${component_value2}=  Catenate  SEPARATOR=  //a[text()='${component_name2}']
    scroll element into view  ${component_value1}
    Wait And Verify Page Contains Element  ${component_value1}  20s  ${component_name1} is not displayed in Element Entries page
    scroll element into view  ${component_value2}
    Wait And Verify Page Contains Element  ${component_value2}  20s  ${component_name2} is not displayed in Element Entries page
    Capture Page Screenshot And Retry If Required

Click on Element Entries under Payroll
    Wait And Click Element  ${element_entry}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Search Person and Click for Element Entries
    [Arguments]  ${number}
    Wait And Set Text  ${search_text_box}  ${number}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${number}"]
    Sleep  3s
    Wait And Verify Page Contains Text  Element Entries  20s  Element Entries not found
    Capture Page Screenshot And Retry If Required

Enter Person number and select first row
    [Arguments]  ${number}
    Wait And Set Text  ${Search_input}  ${number}
    Sleep  2s
    Wait And Click Element  ${Search_1st_row}
    Sleep  5s
    Capture Page Screenshot And Retry If Required