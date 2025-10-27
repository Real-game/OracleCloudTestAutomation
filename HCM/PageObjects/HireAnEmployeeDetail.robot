*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/HireAnEmployeeDetail.robot

*** Keywords ***

Fill When and Why in Hire an employee page
    Wait Until Page Contains  When and Why  20s  When and Why page is not displayed
    Wait And Click Element  ${legal_employer_drop_down}
    Sleep  1s
    Wait And Click Element  ${legal_employer_option}
    Sleep  2s
    Wait And Click Element  ${continue_button}
    Sleep  2s

Fill personal details in Hire an Employee page
    [Arguments]  ${last_name_value}  ${first_name_value}  ${date_of_birth_value}  ${gender_value}
    Wait And Input Text From Input   ${last_name_input}   ${last_name_value}
    Wait And Input Text From Input   ${first_name_input}   ${first_name_value}
    Sleep  1s
    Wait And Click Element  ${gender_drop_down}
    Sleep  2s
    ${gender_xpath}=  Catenate  SEPARATOR=  //li[text()='   ${gender_value}  ']
    Wait And Click Element  xpath: ${gender_xpath}
    Sleep  1s
    Wait And Input Text From Input   ${date_of_birth_input}   ${date_of_birth_value}
    Sleep  2s
    Wait And Click Element  ${continue_button_field}
    Sleep  1s

Fill Addresses
    [Arguments]  ${address_type_value}  ${address_line_1_value}  ${city_value}  ${postal_code_value}
    Sleep  2s
    Wait And Click Element  ${country_drop_down}
    Sleep  1s
    ${country_xpath}=  Catenate  SEPARATOR=  //div[text()='  Canada  ']
    Wait And Click Element  xpath: ${country_xpath}
    Sleep  2s
    Wait And Click Element  ${address_type_drop_down}
    Sleep  2s
    ${address_xpath}=  Catenate  SEPARATOR=  //li[text()='  ${address_type_value}  ']
    Wait And Click Element  ${address_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${address_line_1_input}   ${address_line_1_value}
    Sleep  1s
    Wait And Input Text From Input   ${city_input}   ${city_value}
    Sleep  2s
    ${city_xpath}=  Catenate  SEPARATOR=  //span[text()='    ${city_value}  ']
    Wait And Click Element  xpath: ${city_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${postal_code_input}   ${postal_code_value}
    Sleep  2s
    ${postal_xpath}=  Catenate  SEPARATOR=  //span[text()='    ${postal_code_value}  ']
    Wait And Click Element  xpath: ${postal_xpath}
    Sleep  5s
    #Click Element  ${postal_code_input}
    #Press Keys  ${postal_code_input}  RETURN
    Wait And Click Element  ${continue_field_button}
    Sleep  2s

Fill Citizenship Info in Hire an employee page
    Wait And Click Element  ${citizenship_drop_down}
    Sleep  2s
    ${postal_xpath}=  Catenate  SEPARATOR=  //li[text()='    Canadian  ']
    Wait And Click Element  xpath: ${postal_xpath}
    Sleep  2s
    Wait And Click Element  ${citizenship_status_input}
    Sleep  2s
    ${postal_xpath_1}=  Catenate  SEPARATOR=  //li[text()='    Active  ']
    Wait And Click Element  xpath: ${postal_xpath_1}
    Sleep  5s
    Wait And Click Element  ${continue_field_button}
    Sleep  2s

Fill Assignment Details in Hire an employee page
    [Arguments]  ${position_id}
    Wait And Click Element  ${business_unit_drop_down}
    Sleep  2s
    ${bus_xpath}=  Catenate  SEPARATOR=  //div[text()='Metrolinx BU']
    Wait And Click Element  xpath: ${bus_xpath}
    Sleep  2s
    Wait And Input Text From Input   ${position_drop_down}   ${position_id}
    ${pos_xpath}=  Catenate  SEPARATOR=  //span[text()='  ${position_id}  ']
    Wait And Click Element  xpath: ${pos_xpath}
    Sleep  5s
    ${checker}=  Run Keyword and Return Status  Page Should Contain Element  ${yes_button_hire_detail}
    IF  "${checker}"=="True"
        Wait And Click Element  ${yes_button_hire_detail}
    END
    Sleep  5s
    Wait And Click Element  ${continue_field_button}
    Sleep  5s
    Wait And Click Element  ${continue_field_button}
    Sleep  5s
    Wait And Click Element  ${continue_field_button}
    Sleep  5s
    Wait And Click Element  ${continue_field_button}
    Sleep  5s

Fill Salary Details
    Wait And Click Element  ${salary_basis_drop_down}
    Sleep  2s
    ${bus_xpath}=  Catenate  SEPARATOR=  //div[text()='Salaried']
    Wait And Click Element  xpath: ${bus_xpath}
    Sleep  3s
    Wait And Input Text From Input   ${salary_amount_input}   5000
    Sleep  2s
    Wait And Click Element  ${submit_button}
    Sleep  10s

