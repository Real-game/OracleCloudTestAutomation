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
    Wait And Verify Page Contains Text  Pay for Performance
    Capture Page Screenshot And Retry If Required

Select Filters Option
    Wait And Click Element  ${filters}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Grade Filter option
    [Arguments]  ${value}
    Wait And Click Element  ${filter_dropdown}
    ${filter_value_xpath}=  Catenate  SEPARATOR=  //ul[contains(@id,'fltItr1:3:SMC3::pop')]//following-sibling::li//label[contains(text(),'${value}')]
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
    scroll element into view  ${lumpsum_sort_descending}
    Wait And Click Element  ${lumpsum_sort_descending}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Eligible employee only has Lumpsum Value
    ${lumpsum_value_xpath}=  Catenate  SEPARATOR=  //span[contains(@id,'iCustomSegment38::content')]
    scroll element into view  ${lumpsum_value_xpath}
    ${lumpsum_value_count}=  get element count  ${lumpsum_value_xpath}
    Log to console  ${lumpsum_value_count}
    ${count}=  Evaluate  ${lumpsum_value_count}+${1}
    Log to console  ${count}
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
    Wait And Click Element  ${eligibility_status_dropdown}
    ${eligible_status_xpath}=  Catenate  SEPARATOR=  //ul[contains(@id,'fltItr')]//following-sibling::li//label[text()='${status}']
    Sleep  2s
    Wait And Click Element  ${eligible_status_xpath}
    Wait And Click Element  ${eligibility_status_run}
    Capture Page Screenshot And Retry If Required

Select Sort Descending for Processing Status
    scroll element into view  ${processing_status_sort_descending}
    Wait And Click Element  ${processing_status_sort_descending}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

#Modify LTFIT Amount Percentage and verify value
#(//span[text()='Unprocessed']//following::td//span[contains(@id,'iCustomSegment16')])[1]
#(//span[text()='Unprocessed']//parent::span//parent::span//parent::td//following-sibling::td//span[text()='Eligible']//following::td//span[contains(@id,'iCustomSegment16')])[1]

Select Save Button
    Wait And Click Element  ${save_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search Person Name
    [Arguments]  ${person_name}
    Wait And Set Text  ${name_search_field}  ${person_name}
    Wait And Click Element  ${name_search_button}
    Sleep  5s
    Wait And Verify Page Contains Text  ${person_name}

Get Worksheet Column Index
    [Arguments]  ${column_name}
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='${column_name}']/ancestor::th
    ${index_num} =  Get Element Attribute  ${xpath}  _d_index
    return  ${index_num}

Check Eligibility Status
    ${col_index}  Get Worksheet Column Index  Eligibility Status
    ${elegibility_col_index} =  Evaluate  {col_index} + 1
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Eligibility Status']/ancestor::th//following::table[@summary='Worksheet']//td[${elegibility_col_index}]//span[contains(@id,'EligibilityStatus')]
    ${egibility_status_val} =  Get Text  ${xpath}
    IF  "${egibility_status_val}" == "Eligible"
        Log  Employee is eligible
    ELSE
        Log  Employee is eligible
    END
    Capture Page Screenshot And Retry If Required

Check Grade Values
    ${col_index}  Get Worksheet Column Index  Grade
    ${grade_col_index} =  Evaluate  {col_index} - 2
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='Grade']/ancestor::th//following::table[@summary='Worksheet']//td[${grade_col_index}]//span
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
    ${multi_assigment_col_index} =  Evaluate  {col_index} - 2
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
    ${lftri_col_index} =  Evaluate  {col_index} - 2
    ${lftri_amt_col_index} =  Evaluate  {col_index} - 1
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_col_index}]
    Wait And Click Element  ${xpath}
    Sleep  4s
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_col_index}]//input
    Wait And Set Text  ${xpath}  ${lftri_val}
    ${col_index}  Get Worksheet Column Index  CSAT %
    ${csat_col_index} =  Evaluate  {col_index} - 2
    ${csat_amt_col_index} =  Evaluate  {col_index} - 1
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_col_index}]//input
    Wait And Set Text  ${xpath}  ${csat_val}
    #validating LTFIR and CSAT amt
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[${lftri_amt_col_index}]//span[contains(@style,'text')]
    ${ltfir_amt} =  Get Text  ${xpath}
    IF  ${ltfir_amt}!=0
        Log  LTFIR amount has been calculated
    ELSE
        Log  LTFIR amount has not been calculated
    END
    ${xpath} =  Catenate  SEPARATOR=  //span[text()='CSAT %']/ancestor::th//following::table[@summary='Worksheet']//td[${csat_amt_col_index}]//span[contains(@style,'text')]
    ${csat_amt} =  Get Text  ${xpath}
    IF  ${csat_amt}!=0
        Log  CSAT amount has been calculated
    ELSE
        Log  CSAT amount has not been calculated
    END






#//span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[22]
#//span[text()='LTFIR %']/ancestor::th//following::table[@summary='Worksheet']//td[22]//input