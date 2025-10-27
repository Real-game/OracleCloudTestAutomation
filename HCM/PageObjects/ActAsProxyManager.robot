*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ActAsProxyManager.robot

*** Keywords ***

Select Proxy manager
    [Arguments]  ${manager_name}
    Wait And Click Element  ${proxy_manager_dropdwon}
    Sleep  2s
    Select Required Value  ${proxy_manager_value}  ${manager_name}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Pay For Performance option
    Wait And Click Element  ${pay_for_performance_link}
    Sleep  2s
    Wait And Verify Page Contains Text  Pay for Performance  10s  Pay for Performance page not loaded
    Capture Page Screenshot And Retry If Required

Select Filters Option
    Wait And Click Element  ${filters}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Grade Filter option
    [Arguments]  ${value}
    ${checker}=  RUN KEYWORD And Return Status  wait until element is visible  ${filter_dropdown}  5s
    IF  '${checker}' == 'False'
        Wait And Click Element   ${filter_expansion}
        Sleep  2s
        scroll element into view  ${filter_dropdown}
        Wait And Click Element  ${filter_dropdown}
    ELSE
        scroll element into view  ${filter_dropdown}
        Wait And Click Element  ${filter_dropdown}
    END
    ${filter_value_xpath}=  Catenate  SEPARATOR=  //ul[contains(@id,'fltItr1:3:SMC3::pop')]//following-sibling::li//label[starts-with(text(),'${value}')]
    ${filter_value_count}=  get element count  ${filter_value_xpath}
    Log to console  ${filter_value_count}
    ${count}=  Evaluate  ${filter_value_count}+${1}
    Log to console  ${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Sleep  3s
        ${filter_value_xpath_list}=  Catenate  SEPARATOR=  (//ul[contains(@id,'fltItr1:3:SMC3::pop')]//following-sibling::li//label[contains(text(),'${value}')])[${i}]
        scroll element into view  ${filter_value_xpath_list}
        Wait And Click Element  ${filter_value_xpath_list}
    END
    Capture Page Screenshot And Retry If Required

Click Filter Go button
    Wait And Click Element  ${filter_run}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Sort Descending for Lumpsum Amount
    Sleep  3s
    ${checker}=  RUN KEYWORD And Return Status  scroll element into view  ${lumpsum_sort_descending}
    IF  '${checker}' == 'False'
        scroll element into view  ${lumpsum_sort_descending}
    END
    Wait And Click Element  ${lumpsum_sort_descending}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Eligible employee only has Lumpsum Value
    ${lumpsum_value_xpath}=  Catenate  SEPARATOR=  //span[contains(@id,'iCustomSegment38::content')]
    Execute JavaScript    window.scrollTo(0, document.body.scrollHeight)
    scroll element into view  ${lumpsum_value_xpath}
    ${lumpsum_value_count}=  get element count  ${lumpsum_value_xpath}
    Log  ${lumpsum_value_count}
    ${count}=  Evaluate  ${lumpsum_value_count}+${1}
    Log  ${count}
    FOR  ${i}  IN RANGE  1  ${count}
        ${Lumpsum_value_xpath_list}=  Catenate  SEPARATOR=  (//span[contains(@id,'iCustomSegment38::content')])[${i}]
        scroll element into view  ${Lumpsum_value_xpath_list}
        ${value}=  GET TEXT  ${Lumpsum_value_xpath_list}
        IF  ${value}!=0
            ${Lumpsum_status_xpath_list}=  Catenate  SEPARATOR=  ((//span[contains(@id,'iCustomSegment38::content')])[${i}]//ancestor::td//preceding-sibling::td//span[contains(@id,'oEligibilityStatus')])[${i}]
            element should contain  ${Lumpsum_status_xpath_list}  Eligible  Employee status is ineligible but has Lumpsum Value
        END
    END
    Capture Page Screenshot And Retry If Required

Select Eligibility Status Filter
    [Arguments]  ${status}
    scroll element into view  ${eligibility_status_dropdown}
    Wait And Click Element  ${eligibility_status_dropdown}
    ${eligible_status_xpath}=  Catenate  SEPARATOR=  //ul[contains(@id,'fltItr')]//following-sibling::li//label[text()='${status}']
    Sleep  2s
    Wait And Click Element  ${eligible_status_xpath}
    Sleep  2s
    Wait And Click Element  ${eligibility_status_run}
    Sleep  2s
    Wait And Click Element  ${eligibility_status_run}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Sort Descending for Processing Status
    Sleep  3s
    ${checker}=  RUN KEYWORD And Return Status  scroll element into view  ${processing_status_sort_descending}
    IF  '${checker}' == 'False'
        scroll element into view  ${processing_status_sort_descending}
    END
    Sleep  2s
    Wait And Click Element  ${processing_status_sort_descending}
    Sleep  2s
    Capture Page Screenshot And Retry If Required


Select Save Button
    Wait And Click Element  ${save_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search Person Name
    [Arguments]  ${person_name}
    Wait And Set Text  ${name_search_field}  ${person_name}
    Wait And Click Element  ${name_search_button}
    Sleep  15s
    Wait And Verify Page Contains Text  ${person_name}  20s  Person Name found

Get Worksheet Column Index
    [Arguments]  ${column_name}
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='${column_name}']/ancestor::th
    ${index_num} =  Get Element Attribute  ${xpath}  _d_index
    RETURN  ${index_num}

Check Eligibility Status
    ${col_index} =   Get Worksheet Column Index  Eligibility Status
    ${elegibility_col_index} =  Evaluate  ${col_index} + 1
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Eligibility Status']/ancestor::th//following::table[@summary='Worksheet']//td[${elegibility_col_index}]//span[contains(@id,'EligibilityStatus')]
    ${egibility_status_val} =  Get Text  ${xpath}
    IF  "${egibility_status_val}" == "Eligible"
        Log  Employee is eligible
    ELSE
        Log  Employee is not eligible
    END
    Capture Page Screenshot And Retry If Required

Check Grade Values
    ${col_index}  Get Worksheet Column Index  Grade
    ${grade_col_index} =  Evaluate  ${col_index} - 2
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Grade']/ancestor::th//following::table[@summary='Worksheet']//td[${grade_col_index}]//span
    scroll element into view  ${xpath}
    ${grade_status_val} =  Get Text  ${xpath}
    IF  "${grade_status_val}" == "COOP" or "${grade_status_val}" == "INTR" or "${grade_status_val}" == "BRD" or "${grade_status_val}" == "RSFEL" or "${grade_status_val}" == "SS"
        Log  Grade is ${grade_status_val}
        Capture Page Screenshot And Retry If Required
        Fail
    ELSE
        Log  Grade is ${grade_status_val}
    END
    Capture Page Screenshot And Retry If Required

Check Multiple Assignment Status
    ${col_index}  Get Worksheet Column Index  Multiple Assignments Flag
    ${multi_assigment_col_index} =  Evaluate  ${col_index} - 2
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Multiple Assignments Flag']/ancestor::th//following::table[@summary='Worksheet']//td[${multi_assigment_col_index}]//span
    ${multiple_assignment_flag} =  Get Text  ${xpath}
    IF  "${multiple_assignment_flag}" == "N"
        Log  Multiple Assigment Flag is set to N
    ELSE
        Log  Multiple Assigment Flag is not set to N
    END
    Capture Page Screenshot And Retry If Required

Input LFTRI and CSAT Percentage Values
    [Arguments]  ${lftri_val}  ${csat_val}
    ${col_index}  Get Worksheet Column Index  LTFIR %
    ${lftri_col_index} =  Evaluate  ${col_index} - 2
    ${lftri_amt_col_index} =  Evaluate  ${col_index} - 1
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_col_index}]
    ${eligible_xpath} =  Catenate  SEPARATOR=  ((//span[contains(@id,'iCustomSegment16::content')])[1]//ancestor::td//preceding-sibling::td//span[contains(@id,'oEligibilityStatus')])[1]
    scroll element into view  ${xpath}
    element should contain  ${eligible_xpath}  Eligible  Employee status is ineligible
    Sleep  2s
    #Wait And Click Element  ${xpath}
    scroll element into view  ${xpath}
    Wait and Click Element  ${xpath}
    Sleep  5s
    Wait and Click Element  ${xpath}
    Sleep  2s
    ${xpath1} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_col_index}]//input
    scroll element into view  ${xpath}
    Sleep  2s
    Wait and Click Element  ${xpath1}
    Sleep  4s
    Input Text  ${xpath1}  ${lftri_val}

    #CSAT
    ${col_index}  Get Worksheet Column Index  CSAT %
    ${csat_col_index} =  Evaluate  ${col_index} - 2
    ${csat_amt_col_index} =  Evaluate  ${col_index} - 1
    ${xpath2} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_col_index}]
    scroll element into view  ${xpath2}
    Click Element  ${xpath2}
    Sleep  3s
    ${xpath3} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_col_index}]//input
    Click Element  ${xpath3}
    Sleep  4s
    #Input text  ${xpath}  ${csat_val}
    Wait And Set Text  ${xpath3}  ${csat_val}


    #validating LTFIR and CSAT amt
    ${ltfir_amt_xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_amt_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${ltfir_amt_xpath}
    #Click Element  ${ltfir_amt_xpath}
    Sleep  3s
    ${ltfir_amt} =  Get Text  ${ltfir_amt_xpath}
    Should Not Be Equal  ${ltfir_amt}  0  LTFIR amount has not been calculated

    ${xpath4} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_amt_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${xpath4}
    #Click Element  ${ltfir_amt_xpath}
    Sleep  3s
    ${csat_amt} =  Get Text  ${xpath4}
    Should Not Be Equal  ${csat_amt}  0  CSAT amount has not been calculated
    Capture Page Screenshot And Retry If Required

Verify Performance Rating is Complete
     ${col_index}  Get Worksheet Column Index  Performance Rating Category
     ${performance_rating_col_index} =  Evaluate  ${col_index} - 2
     ${xpath} =  Catenate  SEPARATOR=  //span[text()='Performance Rating Category']/ancestor::th//following::table[@summary='Worksheet']//td[${performance_rating_col_index}]//span[contains(@id,':')]
     scroll element into view  ${xpath}
     ${performance_Category} =  Get Text  ${xpath}
     IF  "${performance_Category}" == "No rating given"
         Log  Performance Rating of the Employee is not complete
     ELSE
         Log  Performance Rating of the Employee is complete
     END
     Capture Page Screenshot And Retry If Required

Verify Leadership % is populated
      ${col_index}  Get Worksheet Column Index  Leadership %
      ${leadership_col_index} =  Evaluate  ${col_index} - 2
      ${xpath} =  Catenate  SEPARATOR=  //span[text()='Leadership %']/ancestor::th//following::table[@summary='Worksheet']//td[${leadership_col_index}]//span[contains(@style,'text')]
      scroll element into view  ${xpath}
      ${leadership_percent_value} =  Get Text  ${xpath}
      IF  "${leadership_percent_value}" != ""
         Log  Leadership % of the Employee is populated
      ELSE
         Log  Leadership % of the Employee is not populated
      END
      Capture Page Screenshot And Retry If Required

Input Total Increase Override and Proration overide Values
    [Arguments]  ${total_increase_override_val}  ${proration_override_val}
    ${col_index}  Get Worksheet Column Index  New Annualized Full-Time Salary
    ${ft_salary_col_index} =  Evaluate  ${col_index} - 2
    ${ft_salary_xpath} =  Catenate  SEPARATOR=  //span[text()='New Annualized Full-Time Salary']/ancestor::th//following::table[@summary='Worksheet']//td[${ft_salary_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${ft_salary_xpath}
    ${ft_salary_value} =  Get Text  ${ft_salary_xpath}

    ${col_index}  Get Worksheet Column Index  New Base Salary${SPACE}
    ${base_salary_col_index} =  Evaluate  ${col_index} - 2
    ${base_salary_xpath} =  Catenate  SEPARATOR=  //span[text()='New Base Salary ']/ancestor::th//following::table[@summary='Worksheet']//td[${base_salary_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${base_salary_xpath}
    ${base_salary_value} =  Get Text  ${base_salary_xpath}


    ${col_index}  Get Worksheet Column Index  Increase % Override
    ${increase_override_col_index} =  Evaluate  ${col_index} - 2
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Increase % Override']/ancestor::th//following::table[@summary='Worksheet']//td[${increase_override_col_index}]
    #Wait And Click Element  ${xpath}
    scroll element into view  ${xpath}
    wait and click element    ${xpath}
    Sleep  4s
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Increase % Override']/ancestor::th//following::table[@summary='Worksheet']//td[${increase_override_col_index}]//input
    Wait And Set Text  ${xpath}  ${total_increase_override_val}

    ${col_index}  Get Worksheet Column Index  Proration % Override
    ${proration_override_col_index} =  Evaluate  ${col_index} - 2
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Proration % Override']/ancestor::th//following::table[@summary='Worksheet']//td[${proration_override_col_index}]
    #Wait And Click Element  ${xpath}
    scroll element into view  ${xpath}
    Wait And Click Element  ${xpath}
    Sleep  4s
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Proration % Override']/ancestor::th//following::table[@summary='Worksheet']//td[${proration_override_col_index}]//input
    Wait And Set Text  ${xpath}  ${proration_override_val}
    Sleep  5s

    ${checker}=  RUN KEYWORD And Return Status  scroll element into view  ${base_salary_xpath}
    IF  '${checker}' == 'False'
        scroll element into view  ${base_salary_xpath}
    END
    ${checker}=  RUN KEYWORD And Return Status  Click Element  ${ft_salary_xpath}
    IF  '${checker}' == 'False'
        Click Element  ${ft_salary_xpath}
    END
    Sleep  5s
    Wait And Click Element  ${base_salary_xpath}
    Sleep  2s
    ${ft_salary_after_value} =  Get Text  ${ft_salary_xpath}
    ${base_salary_after_value} =  Get Text  ${base_salary_xpath}
    Should Not Be Equal  ${ft_salary_after_value}  ${ft_salary_value}  New Annualized Full Time Salary has not changed based on the changes in Increase % Override and Proration % Override
    Should Not Be Equal  ${base_salary_after_value}  ${base_salary_value}  New Base Salary has not changed based on the changes in Increase % Override and Proration % Override


Save Worksheet
    Wait And Click Element  ${save_button}
    Sleep  30s
    ${checker}=  RUN KEYWORD And Return Status  Wait And Click Element  ${ok_button_popup}
    IF  '${checker}' == 'False'
        Log  Warning pop up not found.
    END
    ${checker}=  RUN KEYWORD And Return Status  Wait And Click Element  ${confirmation_ok_button_popup}
    IF  '${checker}' == 'False'
        Wait And Click Element  ${confirmation_ok_button_popup}
    END
    Capture Page Screenshot And Retry If Required


Validate LTFIR and CSAT Amount
    ${col_index}  Get Worksheet Column Index  LTFIR %
    ${lftri_amt_col_index} =  Evaluate  ${col_index} - 1
    ${col_index}  Get Worksheet Column Index  CSAT %
    ${csat_amt_col_index} =  Evaluate  ${col_index} - 1

    ${ltfir_amt_xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_amt_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${ltfir_amt_xpath}
    Sleep  3s
    ${ltfir_amt} =  Get Text  ${ltfir_amt_xpath}
    Should Not Be Equal  ${ltfir_amt}  0  LTFIR amount has not been calculated

    ${xpath} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_amt_col_index}]//span[contains(@style,'text')]
    scroll element into view  ${xpath}
    Sleep  3s
    ${csat_amt} =  Get Text  ${xpath}
    Should Not Be Equal  ${csat_amt}  0  CSAT amount has not been calculated
    Capture Page Screenshot And Retry If Required

Check employee details present
    Wait And Verify Page Contains Element  ${employee_details}  20s  Employee details are not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Clear Filter
    ${checker}=  RUN KEYWORD And Return Status  wait until element is visible  ${clear_filter}  5s
    IF  '${checker}' == 'False'
        Wait And Click Element   ${filter_expansion}
        Sleep  2s
        Wait And Click Element  ${clear_filter}
    ELSE
        Wait And Click Element  ${clear_filter}
        Sleep  2s
        Capture Page Screenshot And Retry If Required
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required