*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddContingentEmployeeDetail.robot

*** Keywords ***

Fill Basic Details in Add a contingent employee page
    Wait And Verify Page Contains Text  Basic Details  20s  Basic Details page is not displayed
    Wait And Click Element  ${legal_employer_drop_down}
    Sleep  1s
    Wait And Click Element  ${legal_employer_option}
    Sleep  2s

Fill personal details in Add a contingent Employee page
    [Arguments]  ${last_name_value}  ${first_name_value}  ${date_of_birth_value}  ${gender_value}
    Wait And Input Text From Input   ${last_name_input}   ${last_name_value}
    Wait And Input Text From Input   ${first_name_input}   ${first_name_value}
    Sleep  1s
    Wait And Click Element  ${gender_drop_down}
    Sleep  2s
    ${gender_xpath}=  Catenate  SEPARATOR=  //li[text()='   ${gender_value}  ']
    Wait And Click Element  xpath: ${gender_xpath}
    Sleep  1s
    #Wait And Input Text From Input   ${date_of_birth_input}   ${date_of_birth_value}
    Sleep  2s

Fill National Identifier Details
    [Arguments]  ${national_id}
    Wait And Click Element  ${national_identifier_add_icon}
    Sleep  2s
    Wait And Input Text From Input   ${national_ID_field}   ${national_id}
    Sleep  1s
    Wait And Click Element  ${next_button}
    Sleep  2s

Fill Addresses
    [Arguments]   ${address_line_1_value}  ${city_value}  ${postal_code_value}
    Sleep  2s
    Wait And Input Text From Input   ${address_line_1_input}   ${address_line_1_value}
    Sleep  1s
    Wait And Input Text From Input   ${city_input}   ${city_value}
    Sleep  2s
    Press Keys  ${city_input}  RETURN
    #${city_xpath}=  Catenate  SEPARATOR=  //span[text()='    ${city_value}  ']
    #Wait And Click Element  xpath: ${city_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${postal_code_input}   ${postal_code_value}
    Sleep  2s
    #${postal_xpath}=  Catenate  SEPARATOR=  //span[text()='    ${postal_code_value}  ']
    #Wait And Click Element  xpath: ${postal_xpath}
    Sleep  5s
    #Click Element  ${postal_code_input}
    #Press Keys  ${postal_code_input}  RETURN
    #Wait And Click Element  ${continue_field_button}
    Sleep  2s


Fill Phone Details
    [Arguments]  ${phone_type_value}  ${phone_number_value}
    Sleep  2s
    Wait And Click Element  ${phone_details_add_icon}
    Sleep  2s
    Wait And Click Element  ${phone_type_drop_down}
    Sleep  2s
    ${phone_xpath}=  Catenate  SEPARATOR=  //li[text()='  ${phone_type_value}  ']
    Wait And Click Element  ${phone_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${phone_number_input_field}   ${phone_number_value}
    Sleep  1s
    Wait And Click Element  ${next_button}
    Sleep  5s

Fill Assignment Details in Hire an employee page
    [Arguments]  ${position_name}
    wait until element is visible  ${business_unit_drop_down}  20s
    scroll element into view  ${business_unit_drop_down}
    Wait And Click Element  ${business_unit_drop_down}
    Sleep  2s
    ${bus_xpath}=  Catenate  SEPARATOR=  //span[text()='Metrolinx BU']
    Wait And Click Element  xpath: ${bus_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${position_drop_down}   ${position_name}
    Sleep  2s
    ${pos_xpath}=  Catenate  SEPARATOR=  //li[contains(text(),'${position_name}')]
    Wait And Click Element  xpath: ${pos_xpath}
    Sleep  5s
    Wait And Click Element  ${next_button}
    Sleep  5s

Fill Salary Details
    wait until element is visible  ${salary_basis_drop_down}  20s
    Wait And Click Element  ${salary_basis_drop_down}
    Sleep  2s
    ${sal_xpath}=  Catenate  SEPARATOR=  //span[text()='Salaried']
    Wait And Click Element  xpath: ${sal_xpath}
    Sleep  7s
    ${checker}=  RUN KEYWORD And Return Status  Wait And Set Text  ${salary_amount_input}  80000
    IF  '${checker}' == 'False'
        Wait And Set Text  ${salary_amount_input}  98765
    END
    Sleep  2s
    Wait And Click Element  ${next_button}
    Sleep  7s

Review and Submit
    wait until element is visible  ${submit_button}  20s
    Wait And Click Element  ${submit_button}
    Sleep  6s
    ${checker}=  Run Keyword and Return Status  element should be visible  ${warning_pop_up_yes_btn}  Warning popup not shown
    IF  '${checker}'=='False'
        Wait And Click Element  ${submit_button}
        Sleep  5s
    END
    Wait And Click Element  ${warning_pop_up_yes_btn}
    Sleep  20s
    #Page Should Not Contain  Error
    Capture Page Screenshot And Retry If Required
    ${checker}=  Run Keyword and Return Status  element should not be visible  ${error_popup}  Error encountered
    IF  '${checker}'=='False'
        element should not be visible  ${error_popup}  Error encountered
    END
    Wait And Click Element  ${confirmation_pop_up_ok_btn}
    Sleep  2s