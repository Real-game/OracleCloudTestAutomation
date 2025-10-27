*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  Collections
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PersonManagement.robot

*** Keywords ***

Search employee in person management
    [Arguments]  ${name}
    Sleep  5s
    Wait Then Click And Set Text  ${search_name}  ${name}
    Sleep  3s
    Wait and click element  ${search_button}
    Sleep  3s
    Scroll Element Into View  ${action_dropdown}
    Wait And Click Element  ${action_dropdown}
    Wait And Click Element  ${absence_option}
    Wait And Click Element  ${absence_records}
    Wait And Verify Page Contains Text  Manage Absences and Entitlements   20s  Person Management Manage Absences and Entitlements Page is not displayed
    Sleep  2s
    capture page screenshot and retry if required

Search employee number in person management
    [Arguments]  ${number}
    Sleep  5s
    Click Element  ${search_number}
    Input Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  2s
    ${employee_xpath}=  Catenate  SEPARATOR=  (//span[text()='${number}']/parent::td/preceding-sibling::td//a)[1]
    ${checker}=  Run Keyword and Return Status  Click Element  xpath: ${employee_xpath}
    IF  '${checker}'=='False'
        scroll element into view  ${employee_xpath}
        Click Element  xpath: ${employee_xpath}
    END
    Wait And Verify Page Contains Text  Employment  20s  Person Management detail Page is not displayed
    Capture Page Screenshot And Retry If Required

Search person number in person management
    [Arguments]  ${number}  ${assignment_number}
    Sleep  5s
    Wait Then Click And Set Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  3s
    IF  "${assignment_number}"!=""
         ${name_xpath}=  Catenate   SEPARATOR=  //span[text()='Active - Payroll Eligible']/preceding::span[text()='${assignment_number}']/preceding::a[@href='#'][2]
         Wait And Click Element  ${name_xpath}
    ELSE
        Wait And Click Element  ${result_name}
    END
    Wait Until Page Contains  Person Management  20s  Person Management Assignment Page is not displayed
    Capture Page Screenshot

Update action for employee
    [Arguments]  ${date}  ${action}  ${reason}
    Sleep  5s
    Wait And Verify Page Contains Text  Edit  20s  Edit option is not found in page
    Wait And Click Element  ${edit}
    Wait And Click Element  ${update}
    Sleep  2s
    Enter Effective Start Date  ${date}
    Sleep  3s
    IF  "${action}"!=""
        Wait And Click Element  ${action_name_dropdown}
        Sleep  2s
        Wait And Click Element  ${action_name_dropdown}
        ${action_xpath}=  Catenate  SEPARATOR=  //ul[contains(@id,'actionsName1')]//li[text()='${action}']
        Wait And Click Element  ${action_xpath}
    END
    Sleep  3s
    IF  "${reason}"!=""
        Wait And Click Element  ${action_reason_dropdown}
        ${action_reason_xpath}=  Catenate  SEPARATOR=  ///ul[contains(@id,'actionReason')]//following::li[text()='${reason}']
        Wait And Click Element  ${action_reason_xpath}
    END
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  5s
    Capture Page Screenshot

Click Edit Dropdown
    Wait And Click Element  ${edit}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Update Option
    Wait And Click Element  ${update}
    Wait And Verify Page Contains Text  Update Employment  10s  Update Employment pop-up not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Effective Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${enter_date}  ${date}
    Sleep  3s

Assignment End Warning
    Wait And Click Element  ${status_ok}
    Capture Page Screenshot

Select Assignment Status
    [Arguments]  ${assign}
    Wait And Click Element  ${assignment_status}
    Wait And Send Keys  ${assignment_status}  ${assign}
    Wait And Click Element  ${status_ok}
    Sleep  5s
    Wait Until Page Contains  Person Management  20s  Person Management Page is not displayed
    Capture Page Screenshot

Create New Assignment
    [Arguments]  ${business}  ${input}  ${payroll_select}  ${salary_base}  ${amount}
    Wait And Send Keys  ${business_unit}  ${business}
    Wait And Send Keys    ${position}     ${input}
    Sleep  5s
    Wait And Click Element   ${selected_value}
    Sleep  5s
    Wait And Click Element  ${ok}
    Sleep  5s
    Wait And Click Element  ${payroll}
    Sleep  6s
    Wait Until Element Is Visible   ${payroll_add}  20  Payroll Add Option is not displayed
    Wait And Click Element  ${payroll_add}
    Sleep  3s
    Wait And Send Keys  ${payroll_option}  ${payroll_select}
    Wait And Click Element  ${next_button}
    Wait Until Page Contains  Compensation  20s  Compensation Page is not displayed
    Sleep  3s
    Wait And Set Text  ${salary_basics}  ${salary_base}
    Sleep  5s
    Wait And Click Element  ${salary_amount}
    Sleep  2s
    ${checker}=  Run Keyword and Return Status  Wait Then Click And Set Text  ${salary_amount}  ${amount}
    IF  '${checker}'=='False'
        Wait Then Click And Set Text  ${salary_amount}  ${amount}
    END
    Sleep  5s
    Wait And Click Element  ${next_button}
    Wait Until Page Contains  Temporary Assignment: Roles  20s  Roles Page is not displayed
    Sleep  2s
    Wait And Click Element  ${next_button}
    Verify Review Page in Assignment creation  ${business}  ${input}  ${payroll_select}  ${salary_base}
    Wait And Click Element  ${submit_button}
    Sleep  3s
    Wait And Click Element  ${yes_button}
    Sleep  5s
    Wait And Click Element  ${ok}
    Sleep  3s
    Capture Page Screenshot

Verify Review Page in Assignment creation
    [Arguments]  ${business}  ${input}  ${payroll_select}  ${salary_base}
    Wait Until Page Contains  Temporary Assignment: Review  20s  Review Page is not displayed
    IF  "${business}"!=""
        element should contain  ${business_unit_review}  ${business}
    END
    IF  "${input}"!=""
        element should contain  ${position_review}  ${input}
    END
    IF  "${payroll_select}"!=""
        element should contain  ${payroll_review}  ${payroll_select}
    END
    IF  "${salary_base}"!=""
        element should contain  ${salary_base_review}  ${salary_base}
    END
    Sleep  2s
    Capture Page Screenshot

Search Person in person management
    [Arguments]  ${input}  ${input2}
    IF  "${input}"!=""
        ${checker}=  Run Keyword and Return Status  Wait And Set Text  ${search_name}  ${input}
        IF  '${checker}'=='False'
            Wait And Set Text  ${search_name}  ${input}
        END
    END
    IF  "${input2}"!=""
        ${checker}=  Run Keyword and Return Status  Wait And Set Text  ${search_number}  ${input2}
        IF  '${checker}'=='False'
            Wait And Set Text  ${search_number}    ${input2}
        END
    END
    Sleep  3s
    Wait and click element  ${search_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Person With Assignment Status As Active Payroll Eligible
    Wait And Click Element  ${result_name_active_payroll_eligible}
    Wait And Verify Page Contains Text  Employment  10s  Employment page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select action Dropdown
    [Arguments]  ${action}  ${action_value}
    Scroll Element Into View  ${action_dropdown}
    Wait And Click Element  ${action_dropdown}
    ${dropdown_xpath}=  Catenate   SEPARATOR=  //tr[contains(@id,'table1:am2')]//following-sibling::td[text()='${action}']
    ${checker}=  Run Keyword and Return Status  Wait And Verify Page Contains Text  ${action}  10s  Given Action is not displayed in the page
    IF  '${checker}'=='False'
        Wait And Click Element  ${action_dropdown}
    END
    Wait And Verify Page Contains Text  ${action}  10s  Given Action is not displayed in the page
    Wait And Click Element  ${dropdown_xpath}
    Sleep  2s
    IF  "${action_value}"!=""
        ${xpath_value}=  Catenate   SEPARATOR=  //table[contains(@id,'table1:am2')]//td[text()='${action_value}']
        Wait And Click Element  ${xpath_value}
    END
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Effective Date
    [Arguments]  ${date}
    Click Element  ${enter_date}
    Wait And Set Text  ${enter_date}  ${date}
    Sleep  3s
    Capture Page Screenshot

Modify Address in Personal Information
    [Arguments]  ${date}  ${address_one}  ${address_two}
    Wait And Click Element  ${personal_information}
    Wait And Click Element  ${home_address_edit}
    Wait And Click Element  ${home_address_update}
    Sleep  3s
    Select Effective Date  ${date}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Wait Until Page Contains  Update Address   20s  Update Address page is not displayed
    Wait Then Click And Set Text  ${home_address_line1}  ${address_one}
    Wait Then Click And Set Text  ${home_address_line2}  ${address_two}
    Wait And Click Element  ${status_ok}
    Sleep  2s
    Wait And Click Element  ${submit_button}
    Sleep  2s
    Wait And Click Element  ${yes_button}
    Sleep  2s
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Capture Page Screenshot

Verify Termination date is not visible
    element should not be visible  ${termination_date_label}
    element should not be visible  ${termination_date}
    Sleep  2s
    capture page screenshot

Select search result
    Wait And Click Element  ${next_month}
    Wait Until Page Contains  Person Management  20s  Person Management Page is not displayed
    Capture Page Screenshot

Select Correct action for employee
    [Arguments]  ${action}
    Wait And Click Element  ${edit}
    Wait And Click Element  ${correct}
    Sleep  3s
    Wait And Send Keys  ${action_name}  ${action}
    Wait And Click Element  ${click_ok}
    Sleep  5s
    Capture Page Screenshot

Select Position details
    [Arguments]  ${position}
    Wait Until Page Contains  Edit Employment: Manager Change  20s  Person Management Assignment Page is not displayed

Get Employment Info
    Sleep  5s
    ${position}=  Get Element Attribute  ${get_position}  title
    ${job}=  Get Element Attribute  ${get_job}  title
    ${grade}=  Get Element Attribute  ${get_grade}  title
    ${department}=  Get Element Attribute  ${get_department}  title
    ${location}=  Get Element Attribute  ${get_location}  title
    ${bargaining_unit}=  Get Element Attribute  ${get_bargaining_unit}  title
    Capture Page Screenshot And Retry If Required
    [return]  ${position}  ${job}  ${grade}  ${department}  ${location}  ${bargaining_unit}

Select Recalculate Seniority Dates
    Wait Until Page Contains  Seniority Dates  20s  Seniority Dates calculation page is not displayed
    ${date}=  get_current_date_dd_mmm_yyyy
    Log  date: ${date}
    Wait And Click Element  ${recalculate_seniority}
    Sleep  30s
    Wait Until Page Contains  Seniority dates were last calculated on ${date}.  20s  Recalculation seniority dates take more time to complete
    scroll element into view  ${length_of_service}
    ${service_length}=  get text  ${length_of_service}
    Log  Length Of Service: ${service_length}
    Sleep  2s
    capture page screenshot

Search Person Name in Person Management Page
    [Arguments]  ${first_name}  ${last_name}
    ${person_name}=  Catenate  ${last_name}, ${first_name}
    Log  ${person_name}
    Wait and click element  ${search_name}
    Input Text  ${search_name}  ${person_name}
    Sleep  3s
    Wait and click element  ${search_button}
    Sleep  3s
    ${name_xpath}=  Catenate  SEPARATOR=  //a[text()='  ${person_name}  ']
    Wait Until Page Contains Element  xpath: ${name_xpath}  20s  Manual hire is not added


Select Personal Information
    Wait And Click Element  ${personal_information}
    Sleep  2s
    capture page screenshot

Select Biographical Info Edit
    Wait And Click Element  ${biographical_info_edit}
    Sleep  2s
    capture page screenshot

Select Country of Birth
    [Arguments]  ${input}
    Wait Then Click And Set Text   ${country_of_birth}   ${input}
    Sleep  2s
    Wait And Click Element  ${country_of_birth_dropdown_value}
    Sleep  3s
    capture page screenshot

Select Region of Birth
    [Arguments]  ${input}
    Wait And Set Text  ${region_of_birth}   ${input}
    Sleep  2s
    capture page screenshot

Select Town of Birth
    [Arguments]  ${input}
    Wait And Set Text  ${town_of_birth}   ${input}
    Sleep  2s
    capture page screenshot

Select Blood Type
    [Arguments]  ${input}
    Wait And Click Element  ${blood_type}
    Sleep  2s
    Select Required Value with Text  ${blood_type_value}  ${input}
    Capture Page Screenshot

Select OK button
    Wait And Click Element  ${ok_button}
    Sleep  2s
    Capture Page Screenshot

Select Submit Button
    Wait And Click Element  ${submit_button}
    Sleep  10s
    Capture Page Screenshot

Select Yes Button
    Wait And Click Element  ${yes_button}
    Sleep  5s
    Capture Page Screenshot

Check The Box Include terminated Work relationship And Search Person
    [Arguments]  ${number}
    Wait And Click Element  ${include_terminated_work_relationship}
    Sleep  5s
    Wait Then Click And Set Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  3s
    Wait And Click Element  ${result_row}
    Wait And Verify Page Contains Text  Person Management  20s  Person Management Page is not displayed
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Task Icon
    Wait And Click Element  ${tasks_icon}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Create Work Relationship Link
    Wait And Click Element  ${create_work_relationship_link}
    Wait And Verify Page Contains Text  Create Work Relationship  20s  Create Work Relationship Page Not Found
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Select Result Row With Active Payroll Eligible
    Mouse Over  ${select_result_with_active_payroll}
    Wait And Click Element  ${select_result_with_active_payroll}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Accruals
    [Arguments]  ${accruals}
    Mouse Over  ${accruals_dropdown}
    Wait And Click Element  ${accruals_dropdown}
    Sleep  3s
    Select Required Value  ${accruals_dropdown_menu}  ${accruals}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select date
    [Arguments]  ${date}
    Wait And Set Text  ${input_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Accruals Status
    [Arguments]  ${status}
    Sleep  5s
    Mouse Over  ${plan_balances_status}
    ${checker}=  Run Keyword and Return Status  Wait And Click Element  ${plan_balances_status}
    IF  '${checker}'=='False'
        Sleep  3s
        Wait And Click Element  ${plan_balances_status}
    END
#    Wait And Click Element  ${plan_balances_status}
    Sleep  3s
    Select Required Value  ${plan_balances_status_menu}  ${status}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Plan Balances Go Arrow
    Wait And Click Element  ${click_accruals_go_arrow}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Plan Balance in person management
    Sleep  5s
    ${row_xpath}=  Catenate  SEPARATOR=  //h2[text()='Plan Balances']//following::tr[@class='xem p_AFSelected' or  @class='xem']
    ${count}=  get element count  ${row_xpath}
    ${plan_list}=  Create List
    Log  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        ${hours_xpath}=  Catenate  SEPARATOR=  (//h2[text()='Plan Balances']//following::tr[@class='xem p_AFSelected' or  @class='xem']//span[@class='x25'])[${i}]
        mouse over  ${hours_xpath}
        Sleep  3s
        ${plan_hours}=  GET TEXT  ${hours_xpath}
        Append To List  ${plan_list}  ${plan_hours}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required
    ${plan_count}=  Set Variable  ${0}
    FOR  ${element}  IN  @{plan_list}
        IF  '${element}'!='0.000'
            ${plan_count}=  Evaluate  ${plan_count}+${1}
        END
    END
    Log  Plan_count: ${plan_count}
    IF  '${plan_count}'>'0'
        Log  Absence plan enrollment for a newly hired employee is completed
    ELSE
        FAIL
    END
    Wait And Click Element  ${close_button}
    Sleep  2s

Select Run Accruals for All Active Plans
    [Arguments]  ${value}  ${date}
    scroll element into view  ${accruals_dropdown}
    Wait And Click Element  ${accruals_dropdown}
    Sleep  2s
    ${accruals_xpath}=  Catenate  SEPARATOR=  //td[text()='${value}']
    scroll element into view  ${accruals_xpath}
    Wait And Click Element  ${accruals_xpath}
    Sleep  2s
    Wait And Send Keys  ${accruals_effective_date}  ${date}
    Sleep  2s
    Wait And Click Element  ${yes_button}

Verify initial Plan Balance in person management
    Sleep  5s
    ${row_xpath}=  Catenate  SEPARATOR=  //h2[text()='Plan Balances']//following::tr[@class='xem p_AFSelected' or  @class='xem']
    ${count}=  get element count  ${row_xpath}
    ${plan_list}=  Create List
    Log  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Sleep  2s
        ${hours_xpath}=  Catenate  SEPARATOR=  (//h2[text()='Plan Balances']//following::tr[@class='xem p_AFSelected' or  @class='xem']//span[@class='x25'])[${i}]
        mouse over  ${hours_xpath}
        Wait And Verify Page Contains Element  ${hours_xpath}  20s  Employee plan balance element is not visible
        ${plan_hours}=  GET TEXT  ${hours_xpath}
        Append To List  ${plan_list}  ${plan_hours}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required
    ${plan_count}=  Set Variable  ${0}
    FOR  ${element}  IN  @{plan_list}
        IF  '${element}'!='0.000'
            FAIL  Absence plan enrollment for a newly hired employee is already completed
        END
    END
    Capture Page Screenshot And Retry If Required

Verify Action Menu
    [Arguments]  ${action}
    Wait And Verify Page Contains Element  ${action_dropdown}  20s  Action button is not displayed
    Scroll Element Into View  ${action_dropdown}
    Sleep  3s
    Wait And Click Element  ${action_dropdown}
    Sleep  3s
    ${dropdown_xpath}=  Catenate   SEPARATOR=  //div[contains(@class,'AFDetectExpansion')]//following::td[text()='${action}']
    page should contain element  ${dropdown_xpath}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Action Sub Menu
    [Arguments]  ${action_menu}  ${action_sub_menu_list}
    Scroll Element Into View  ${action_dropdown}
    Wait And Click Element  ${action_dropdown}
    ${dropdown_xpath}=  Catenate   SEPARATOR=  //div[contains(@class,'AFDetectExpansion')]//following::td[text()='${action_menu}']
    Wait And Verify Page Contains Text  ${action_menu}  10s  Given Action is not displayed in the page
    Wait And Click Element  ${dropdown_xpath}
    Sleep  2s
    FOR  ${sub_menu_name}  IN  @{action_sub_menu_list}
        ${sub_menu_xpath}=  Catenate   SEPARATOR=  //table[contains(@id,'table1:am2')]//td[text()='${sub_menu_name}']
        wait until element is visible  ${sub_menu_xpath}  10s  ${sub_menu_xpath} not found
        Log To Console  ${sub_menu_name} found in Action sub menu list
    END
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Employment Assignment Edit Menu
    [Arguments]  ${Menu}
    Sleep  5s
    Wait And Verify Page Contains Text  Edit  20s  Edit option is not visible in page
    Wait And Click Element  ${edit}
    Sleep  3s
    page should contain element  xpath: //td[text()='${Menu}']
    Sleep  2s

Search Person Number and Click Actions
    [Arguments]  ${number}
    Click Element  ${href_person_management}
    Wait And Verify Page Contains Text  Person Management: Search   20s  Person Management page is not displayed
    Capture Page Screenshot And Retry If Required
    Wait Then Click And Set Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  3s
    ${name_xpath}=  Catenate   SEPARATOR=  //span[text()='Active - Payroll Eligible']/preceding::span[text()='${number}']
    Wait Until Element Is Visible  ${name_xpath}
    Scroll Element Into View  ${action_dropdown}
    Wait And Click Element  ${action_dropdown}
    Sleep  3s
    Page Should Contain Element  ${compensation_option}  Compensation option is not present
    Page Should Contain Element  ${personal_and_employment_option}  Personal and Employment option is not present

Click on Personal and Employment Option
    Wait And Click Element  ${personal_and_employment_option}
    Wait Until Page Contains Element  ${document_records_option}  10s  Document Records option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${employment_option}  10s  Employment option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${talent_profile_option}  10s  Talent Profile option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${personal_identifier_ext_action_option}  10s  Personal Identifier and External Action option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${work_relationship_option}  10s  Work Relationship option is not present in Personal and Empolyment Actions

Verify Edit option is not visible
    ${checker}=  Run Keyword and Return Status  element should not be visible  ${edit_option}  Edit option is not Visible as expected
    IF  '${checker}'=='False'
        element should not be visible  ${edit_option}  Edit option is not Visible as expected
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Employment option and Verify Edit Option
    Wait And Click Element  ${employment_option}
    Sleep  3s
    Verify Edit option is not visible

Click on Personal and Employment Option for Rewards Representative
    Click on Personal and Employment Option
    Wait Until Page Contains Element  ${person_option}  10s  Person option is not present in Personal and Empolyment Actions
    Capture Page Screenshot And Retry If Required

Search Person Number and Click Actions for Organizational Development Representative
    [Arguments]  ${number}  ${role}
    Click Element  ${href_person_management}
    Wait And Verify Page Contains Text  Person Management: Search   20s  Person Management page is not displayed
    Capture Page Screenshot And Retry If Required
    Wait Then Click And Set Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  3s
    ${name_xpath}=  Catenate   SEPARATOR=  //span[text()='Active - Payroll Eligible']/preceding::span[text()='${number}']
    Wait Until Element Is Visible  ${name_xpath}
    Scroll Element Into View  ${action_dropdown}
    Wait And Click Element  ${action_dropdown}
    Sleep  3s
    IF  "${role}" == "MX Organizational Development Representative"
        Page Should Contain Element  ${personal_and_employment_option}  Personal and Employment option is not present
    ELSE IF  "${role}" == "MX HRBP Representative"
        Page Should Contain Element  ${compensation_option}  Compensation option is not present
        Page Should Contain Element  ${personal_and_employment_option}  Personal and Employment option is not present
    END

Click Include Terminated Work Relationship checkbox
    mouse over  ${include_terminate_checkbox}
    ${checker}=  Run Keyword and Return Status  checkbox should be selected  ${include_terminate_checkbox}
    IF  '${checker}'=='False'
        Sleep  2s
        click element  xpath: //label[text()='Include terminated work relationships']
    END

Select Plan Participation Status
    [Arguments]  ${input}
    ${checker}=  Run Keyword and Return Status  click element  ${status_dropdown}
    IF  '${checker}'=='False'
        click element ${status_dropdown}
    END
    ${status_xpath}=  Catenate   SEPARATOR=  //ul[contains(@id,':_ATp:soc1')]//following::li[text()='${input}']
    wait until element is visible  ${status_xpath}  5s  Given Status is not visible
    Wait And Click Element  ${status_xpath}
    Sleep  2s
    Wait And Click Element  ${status_go}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Enrollment End date has Value
    ${enrollment_end_date_xpath}=  Catenate  SEPARATOR=  //div[contains(@id,'r3:0:AT2:_ATp:ATt2::db')]/table[1]/tbody[1]/tr
    ${count}=  get element count  ${enrollment_end_date_xpath}
    Log  Count:${count}
    FOR  ${i}  IN RANGE  1  ${count}
        Sleep  2s
        ${end_date_xpath}=  Catenate  SEPARATOR=  //div[contains(@id,'r3:0:AT2:_ATp:ATt2::db')]/table[1]/tbody[1]/tr[${i}]/td[6]/span[1]
        mouse over  ${end_date_xpath}
        element should be visible  ${end_date_xpath}
        Sleep  3s
    END
    Log  Enrollment End Date is set to all plans

Take Plan Balances Table Screenshot
    ${checker}=  Run Keyword and Return Status  mouse over  ${scroll_plan_balances_table_view}
    IF  '${checker}'=='False'
        Sleep  3s
        mouse over  ${scroll_plan_balances_table_view}
    END
#    mouse over  ${scroll_plan_balances_table_view}
    Capture Page Screenshot And Retry If Required
    Sleep  3s

Click on Personal and Employment Option for MX HR Services
    Wait And Click Element  ${personal_and_employment_option}
    Capture Page Screenshot And Retry If Required
    Wait Until Page Contains Element  ${document_records_option}  10s  Document Records option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${employment_option}  10s  Employment option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${person_option}  10s  Person option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${personal_identifier_ext_action_option}  10s  Personal Identifier and External Action option is not present in Personal and Empolyment Actions
    Wait Until Page Contains Element  ${work_relationship_option}  10s  Work Relationship option is not present in Personal and Empolyment Actions

Click on Person link
    Capture Page Screenshot
    Click Element  ${person_option}
    Wait Until Page Contains  Extra Information  20s  Person Management page is not displayed
    Capture Page Screenshot

Click on Vacation Elector link
    Click Element  ${vacation_elector_link}
    Wait Until Page Contains Element  ${vacation_elector_value}  20s  Vacation elector value is not displayed
    Capture Page Screenshot

Check Absence Plan Present in Plan participation
    Wait And Verify Page Contains Element  ${absence_plan_name}  20s  Absence Plans are available for the Employee
    scroll element into view  ${absence_plan_name}
    element should be visible  ${absence_plan_name}
    Capture Page Screenshot And Retry If Required

Click Person Information
    Wait And Click Element  ${personal_information}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Date Of Birth has Value
    scroll element into view  ${date_of_birth_value}
    Wait And Verify Page Contains Element  ${date_of_birth_value}  20s  Date Of Birth hasn't Value
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Social Insurance Number has value
    scroll element into view  ${sin_number_value}
    Wait And Verify Page Contains Element  ${sin_number_value}  20s  Social Insurance Number has not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Home and Primary address has value
    scroll element into view  ${primary_mailing_value}
    Wait And Verify Page Contains Element  ${primary_mailing_value}  20s  Primary Mailing address is displayed nothing
    scroll element into view  ${home_address_value}
    Wait And Verify Page Contains Element  ${home_address_value}  20s  Home address is displayed nothing
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Assignment details option
    Wait And Click Element  ${assignment_details_option}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Assignment status has given value
    [Arguments]  ${value}
    scroll element into view  ${assignment_status_value}
    element text should be  ${assignment_status_value}  ${value}  Assignment status is inactive
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Working hours has value
    Wait And Verify Page Contains Element  ${working_hours}  20s  Working hours for employee is not displayed
    scroll element into view  ${working_hours}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Standard working hours has value
    Wait And Verify Page Contains Element  ${standard_working_hours}  20s  Standard Working hours for employee is not displayed
    scroll element into view  ${standard_working_hours}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check People Group has value
    Wait And Verify Page Contains Element  ${people_group}  20s  People Group for employee is not displayed
    scroll element into view  ${people_group}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Assignment Category has value
    Wait And Verify Page Contains Element  ${assignment_category}  20s  Assignment category for employee is not displayed
    scroll element into view  ${assignment_category}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Primary flag has value
    Wait And Verify Page Contains Element  ${primary_flag}  20s  Assignment category for employee is not displayed
    scroll element into view  ${primary_flag}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Search Person Number and input effective Date
    [Arguments]  ${person_number}  ${effective_date}
    Sleep  5s
    Click Element  ${search_number}
    Input Text  ${search_number}  ${person_number}
    Sleep  2s
    ${effective_date_future}  add_days_to_date_dd_mmm_yyyy  ${effective_date}  3
    Select Effective Date  ${effective_date_future}
    Wait and click element  ${search_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Fetch Assignment Status
    [Arguments]  ${assignment_number}
    ${assigment_status_xpath}=  Catenate  SEPARATOR=  //span[text()='${assignment_number}']/parent::td/following-sibling::td[2]/span
    Scroll Element Into View  ${assigment_status_xpath}
    ${assigment_status} =  Get Text  ${assigment_status_xpath}
    Element Should Contain  ${assigment_status_xpath}  Inactive  Assigment Status is not active for Temporary Assignment
    Capture Page Screenshot And Retry If Required

Verify Termination date is visible
    [Arguments]  ${number}
    ${date}=  Get Current Date Dd Mmm Yyyy
    ${termination_date_xpath}=  Catenate  SEPARATOR=  (//span[text()='${number}'])[2]/preceding::span[text()='${date}']
    scroll element into view  ${termination_date_xpath}
    ELEMENT SHOULD BE VISIBLE  ${termination_date_xpath}
    Sleep  2s
    capture page screenshot

Click Include terminated Work relationship and set effective date And Search Person
    [Arguments]  ${number}
    Wait And Click Element  ${include_terminated_work_relationship}
    Sleep  3s
    ${effective_date}=  get incremented date  1
    Wait And Set Text  ${effective_as_of_date}  ${effective_date}
    Sleep  2s
    Wait Then Click And Set Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Check Employee Assignment Status has Inactive
    [Arguments]  ${number}
    ${assignment_status_option}=  Catenate  SEPARATOR=  (//span[text()='${number}'])[2]/preceding::span[text()='Inactive - Payroll Eligible']
    scroll element into view  ${assignment_status_option}
    element should be visible  ${assignment_status_option}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Get Person Number in Person Management Page
    [Arguments]  ${last_name}  ${first_name}
    ${person_name}=  Catenate  ${last_name}, ${first_name}
    Log  ${person_name}
    Wait and click element  ${search_name}
    Input Text  ${search_name}  ${person_name}
    Sleep  3s
    Wait and click element  ${search_button}
    Sleep  3s
    ${Person_number_xpath}=  Catenate  SEPARATOR=  //a[text()='${person_name}']/following::span[1]
    Wait Until Page Contains Element  xpath: ${Person_number_xpath}  20s  New Person is not added
    ${person_num_value}=  get text  ${Person_number_xpath}
    [return]  ${person_num_value}

Click Extra Information
    Wait And Click Element  ${extra_information}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Adjustment Dates under Extra Information
    Wait And Click Element  ${adjustment_dates}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Vacation Entitlement Adjustment Date has value
    scroll element into view  ${vacation_adjustment_date}
    Wait And Verify Page Contains Element  ${vacation_adjustment_date}  20s  Vacation Entitlement Adjustment Date has not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Person under Employment
    scroll element into view  ${person_employment}
    Wait And Click Element  ${person_employment}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Get Home Address text under Personal Info
    scroll element into view  ${home_address}
    ${city_name}=  get text  ${home_address}
    Log to console  city: ${city_name}
    ${city_name}=  String.Split String  ${city_name}  \n
    Log to console  city: ${city_name}[2]
    ${city_name}=  getCityName  ${city_name}[2]
    Log to console  City Name: ${city_name}
    Capture Page Screenshot And Retry If Required
    [return]  ${city_name}

Verify Warning message and click Yes
    ${checker}=  Run Keyword and Return Status  element should be visible  ${wanringYes}
    IF  '${checker}'=='True'
        click element  ${wanringYes}
    END
    Capture Page Screenshot And Retry If Required

Search employee number with job in person management
    [Arguments]  ${number}  ${job}
    Sleep  5s
    Click Element  ${search_number}
    Input Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  2s
    ${employee_xpath}=  Catenate  SEPARATOR=  (//span[text()='${number}']/parent::td/following-sibling::td//span[text()='${job}']//parent::td/preceding-sibling::td//a)[1]
    ${checker}=  Run Keyword and Return Status  Click Element  xpath: ${employee_xpath}
    IF  '${checker}'=='False'
        scroll element into view  ${employee_xpath}
        Click Element  xpath: ${employee_xpath}
    END
    Wait And Verify Page Contains Text  Employment  20s  Person Management detail Page is not displayed
    Capture Page Screenshot And Retry If Required

Check Seniority Dates
    Wait Until Page Contains  Seniority Dates  20s  Seniority Dates calculation page is not displayed
    ${date}=  get_current_date_dd_mmm_yyyy
    Log  date: ${date}
    Wait And Click Element  ${recalculate_seniority}
    Sleep  30s
    Wait Until Page Contains  Seniority dates were last calculated on ${date}.  20s  Recalculation seniority dates take more time to complete
    scroll element into view  ${length_of_service}
    ${service_length}=  get text  ${length_of_service}
    IF  "${service_length}"=="0 Years 0 Months 1 Days"
        Capture Page Screenshot And Retry If Required
    ELSE
        FAIL
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required
