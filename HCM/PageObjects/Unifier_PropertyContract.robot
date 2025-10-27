*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_PropertyContract.robot
Library  String

*** Keywords ***
Click Create Property Contract Icon
    Sleep  10s
    Select Required Frame  ${create_record_iframe}
    Sleep  10s
    Wait Until Element Is Visible  ${create_contract_btn}  120s  Create button is not displayed
    Scroll element into view  ${create_contract_btn}
    Click Element  ${create_contract_btn}
    Sleep  8s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Sleep  5s
    capture page screenshot

Select Existing Property Contract
    [Arguments]  ${property_contract_name}
    Sleep  3s
    Select Frame  ${create_record_iframe}
    Sleep  5s
    Wait And Click Element  xpath: //div[text()='${property_contract_name}']/ancestor::tr[1]/td//a[@title='Click to open the record']
    Sleep  10s
    Switch Window  title:Property Contracts - Project No. PROP-00147  60s
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Input MX CRE File # and Contract Name
    [Arguments]  ${cre_file_number}  ${contract_name}
    Wait And Set Text  ${cre_file_field}  ${cre_file_number}
    Sleep  2s
    Wait And Set Text  ${contract_name_field}  ${contract_name}
    Sleep  1s
    Capture page screenshot

Select Contract Type
    [Arguments]  ${contract_type}
    Wait And Click Element  ${contract_type_select_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${contract_type}']
    Sleep  1s
    Capture page screenshot

Select Contract Rent Structure
    [Arguments]  ${contract_rent_structure}
    Wait And Click Element  ${rent_structure_select_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${contract_rent_structure}']
    Sleep  1s
    Capture page screenshot

Select Head Lease or Sublease
    [Arguments]  ${head_lease_sublease}
    Wait And Click Element  ${head_lease_sublease_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${head_lease_sublease}']
    Sleep  1s
    Capture page screenshot

Select MX Owned or Leased
    [Arguments]  ${mx_owned_or_leased}
    Wait And Click Element  ${mx_owned_leased_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${mx_owned_or_leased}']
    Sleep  1s
    Capture page screenshot

Select Status
    [Arguments]  ${status}
    Wait And Click Element  ${content_status_select_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${status}']
    Sleep  1s
    Capture page screenshot

Input Original Contract Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${original_contract_start_date}  ${date}
    Sleep  1s
    Capture page screenshot

Input Current Term Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${current_term_start_date}  ${date}
    Sleep  1s
    Capture page screenshot

Input Current Term Expiry Date
    [Arguments]  ${date}
    Wait And Set Text  ${current_term_expiry_date}  ${date}
    Sleep  1s
    Capture page screenshot

Select Tenant Entity Type
    [Arguments]  ${tenant_entity_type}
    Wait And Click Element  ${tenant_entity_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${tenant_entity_type}']
    Sleep  1s
    Capture page screenshot

Select Landlord Entity Type
    [Arguments]  ${landlord_entity_type}
    Wait And Click Element  ${landlord_entity_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${landlord_entity_type}']
    Sleep  1s
    Capture page screenshot

Submit Record
    Wait And Click Element  ${submit_Button}
    Sleep  2s
    Wait Until Page Contains Element  ${notification_alert}  60s  Lease Record not created.
    ${contract_id}=  Get Text  ${notification_alert}
    Log  ${contract_id}
    Capture page screenshot
    Click Element  ${alert_ok_btn}
    Sleep  2s

Click Edit
    Wait And Click Element  ${edit_link}
    Sleep  3s
    Capture Page Screenshot

Select Payment Setup Section and Click Add
    Wait And Click Element  ${payment_setup_tab}
    Sleep  3s
    Wait And Click Element  ${add_btn}
    Sleep  3s
    Capture page screenshot

Select Contract Area Type
    [Arguments]  ${contract_area_type}
    Wait And Click Element  ${contract_area_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${contract_area_type}']
    Sleep  1s
    Capture page screenshot

Select Document Unit of Measure
    [Arguments]  ${unit_of_measure}
    Wait And Click Element  ${unit_of_measure_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${unit_of_measure}']
    Sleep  1s
    Capture page screenshot

Input Document Area Details
    [Arguments]  ${contract_area_type}  ${unit_of_measure}  ${area_size}
    Select Contract Area Type  ${contract_area_type}
    Sleep  2s
    Select Document Unit of Measure  ${unit_of_measure}
    Sleep  3s
    Wait And Set Text  ${area_size_input_field}  ${area_size}
    Sleep  3s
    Capture page screenshot

Select Process Rent Type
    [Arguments]  ${process_rent}
    Wait And Click Element  ${process_rent_select_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${process_rent}']
    Sleep  1s
    Capture page screenshot

Select Rent Category
    [Arguments]  ${rent_category}
    Wait And Click Element  ${rent_category_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${rent_category}']
    Sleep  1s
    Capture page screenshot

Select Payment Type
    [Arguments]  ${payment_type}
    Wait And Click Element  ${payment_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${payment_type}']
    Sleep  1s
    Capture page screenshot

Select Rollup Area
    [Arguments]  ${rollup_area}
    Wait And Click Element  ${rollup_area_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${rollup_area}']
    Sleep  1s
    Capture page screenshot

Input Payment Amount before HST
    [Arguments]  ${payment_amt_before_HST}
    Wait And Set Text  ${payment_amt_before_HST_field}  ${payment_amt_before_HST}
    Sleep  1s
    Capture page screenshot

Select Payment Frequency
    [Arguments]  ${payment_frequency}
    Wait And Click Element  ${payment_frequency_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${payment_frequency}']
    Sleep  1s
    Capture page screenshot

Select Overhold Payment
    [Arguments]  ${overhold_payment}
    Wait And Click Element  ${overhold_payment_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${overhold_payment}']
    Sleep  1s
    Capture page screenshot

Input Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${start_date}  ${date}
    Sleep  1s
    Capture page screenshot

Input End Date
    [Arguments]  ${date}
    Wait And Set Text  ${end_date}  ${date}
    Sleep  1s
    Capture page screenshot

Select Escalation Method
    [Arguments]  ${escalation_method}
    Wait And Click Element  ${escalation_method_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${escalation_method}']
    Sleep  1s
    Capture page screenshot

Select Next Payment Due Day
    [Arguments]  ${next_payment_due_day}
    Wait And Click Element  ${next_payment_due_day_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${next_payment_due_day}']
    Sleep  1s
    Capture page screenshot

Select Latest Payment Due Day
    [Arguments]  ${lastest_payment_due_day}
    Wait And Click Element  ${lastest_payment_due_day_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${lastest_payment_due_day}']
    Sleep  1s
    Capture page screenshot

Select Payment Notice Lead Time
    [Arguments]  ${payment_notice_lead_time}
    Wait And Click Element  ${payment_notice_lead_time_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${payment_notice_lead_time}']
    Sleep  1s
    Capture page screenshot

Select Value from Advanced Search
    [Arguments]  ${parameter_name}  ${value}
    IF  "${value}"!=""
        Wait And Click Element  xpath: (//label[text()='${parameter_name}']//following::button)[1]
        Sleep  2s
        Wait And Click Element  xpath: //div[text()='${value}']
        Sleep  1s
    #    ${status}=  Run Keyword And Return Status  Wait And Click Element  xpath: //div[text()='${value}']
    #    Log To Console  ${status}
    #    IF  "${status}"=="False"
    #        Wait And Click Element  ${advanced_search_cancel_btn}
    #    ELSE
    #        Wait And Click Element  ${advanced_search_select_btn}
    #    END
        Wait And Click Element  ${advanced_search_select_btn}
        Sleep  3s
        Capture page screenshot
    END

Select CAPEX-OPEX option
    [Arguments]  ${capex_opex}
    Wait And Click Element  ${capex_opex_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${capex_opex}']
    Sleep  1s
    Capture page screenshot

Save Line Item
    Wait And Click Element  ${line_item_save_btn}
    Sleep  5s
    Capture page screenshot
    Wait And Click Element  ${contract_details_tab}
    Sleep  3s

Submit Record after adding Line Item
    Wait And Click Element  ${submit_Button}
    Sleep  10s

Select Allowance Section and Click Add
    Wait And Click Element  ${allownaces_tab}
    Sleep  3s
    Wait And Click Element  ${add_btn}
    Sleep  3s
    Capture page screenshot

Select Allowance type
    [Arguments]  ${allowance_type}
    Wait And Click Element  ${allownaces_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${allowance_type}']
    Sleep  1s
    Capture page screenshot

Input Allowance Amount
    [Arguments]  ${allowance_type}
    Wait And Set Text  ${allownaces_amount_field}  ${allowance_type}
    Sleep  1s
    Capture page screenshot

Save Allowance Line Item
    [Arguments]  ${allowance_type}
    Wait And Click Element  ${allowance_line_item_save_btn}
    Sleep  5s
    ${allowance_line_item_xpath}=  Catenate  SEPARATOR=  //td//div[text()='${allowance_type}']
    Wait Until Page Contains Element  ${allowance_line_item_xpath}  60s  Allowance Line Item not created.
    Capture page screenshot
    #Wait And Click Element  ${contract_details_tab}
    Sleep  3s

Select Options and Critical Date Section and Click Add
    Wait And Click Element  ${options_critical_dates_tab}
    Sleep  3s
    Wait And Click Element  ${add_btn}
    Sleep  3s
    Capture page screenshot

Input Option Details
    [Arguments]  ${short_description}  ${contract_option_type}  ${notice_date_no_earlier_than}  ${notice_date_no_later_than}  ${notice_date_no_earlier_than}  ${option_status_value}
    Wait And Set Text  ${short_description_field}  ${short_description}
    Sleep  3s
    Capture page screenshot
    Select Contract Option type  ${contract_option_type}
    Sleep  3s
    Input Notice Date No Earlier Than  ${notice_date_no_earlier_than}
    Sleep  2s
    Input Notice Date No Later Than Or Single Notice  ${notice_date_no_later_than}
    Sleep  2s
    Input Option Status  ${option_status_value}
    Sleep  2s
    Input Effective Renewal Extension Date  ${notice_date_no_earlier_than}
    Capture Page Screenshot And Retry If Required

Select Contract Option type
    [Arguments]  ${contract_option_type}
    Wait And Click Element  ${contract_option_type_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${contract_option_type}']
    Sleep  3s
    Capture page screenshot

Input Notice Date No Earlier Than
    [Arguments]  ${date}
    Wait And Set Text  ${notice_date_no_earlier_than_field}  ${date}
    Sleep  1s
    Capture page screenshot

Input Notice Date No Later Than Or Single Notice
    [Arguments]  ${date}
    Wait And Set Text  ${notice_date_no_later_than_field}  ${date}
    Sleep  1s
    Capture page screenshot

Input Effective Renewal Extension Date
    [Arguments]  ${date}
    Wait And Set Text  ${notice_date_no_earlier_than_field}  ${date}
    Sleep  1s
    Capture page screenshot

Save Option Critical Date Line Item
    [Arguments]  ${contract_option_type}
    Wait And Click Element  ${options_critical_dates_line_item_save_btn}
    Sleep  5s
    ${option_line_item_xpath}=  Catenate  SEPARATOR=  //td//div[text()='${contract_option_type}']
    Wait Until Page Contains Element  ${option_line_item_xpath}  60s  Option Critical Date Line Item not created.
    Capture page screenshot
    #Wait And Click Element  ${contract_details_tab}
    Sleep  3s

Validate the error message
    [Arguments]   ${error_text_value}
    Wait Until Element Is Visible  ${error_icon}  20s  Validation Error icon is not displayed
    Click Element  ${error_icon}
    Wait Until Element Is Visible  ${error_message_text}  50s  Error message text is not displayed
    ${error_text}=   Get Element Attribute  ${error_message_text}  innerHTML
    Should be equal  ${error_text_value}  ${error_text}  Expected text is ${error_text_value} and actual text is ${error_text}
    Scroll Element Into View  ${error_message_text}
    Sleep  5s

Click on Submit button in Property Contract page
    Wait And Click Element  ${submit_Button}
    Sleep  2s


Save the payment setup line item
    Click Element  ${save_payment_setup_button}
    Sleep  3s

Click on Payment Setup tab
    Wait Until Element Is Visible  ${payment_setup_tab}  60s  Payment setup tab is not displayed
    Click Element  ${payment_setup_tab}
    Sleep  5s
    Capture Page Screenshot

Click on Add payment setup button
    Wait Until Element Is Visible  ${add_button_payment_setup_tab}  60s  Add button in Payment setup tab is not displayed
    Click Element  ${add_button_payment_setup_tab}
    Sleep  5s
    Capture Page Screenshot


Validate General Payment Setup information
    [Arguments]  ${CRE_process_rent_value}  ${mx_contract_rent_structure_value}  ${tax_classification_value}  ${capex_opex_value}  ${li_short_description_value}
    Wait Until Element Is Visible  ${cre_process_rent_drop_down}  60s  CRE process rent drop down is not displayed
    Click Element  ${cre_process_rent_drop_down}
    ${cre_process_rent_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${CRE_process_rent_value}']
    ${checker}=  Run Keyword and Return Status  Page Should Contain Element  ${cre_process_rent_xpath}
    IF  "${checker}"=="False"
        Sleep  2s
        Click Element  ${cre_process_rent_drop_down}
        Sleep  2s
    END
    Click Element  xpath: ${cre_process_rent_xpath}
    Sleep  4s
    #Click Element  ${mx_contract_rent_structure_drop_down}
    #${mx_contract_rent_structure_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${mx_contract_rent_structure_value}']
    #Click Element  xpath: ${mx_contract_rent_structure_xpath}
    #Sleep  4s
    Click Element  ${tax_classification_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  xpath: //div[text()='${tax_classification_value}']
    #Click Element  ${lookup_first_row}
    Sleep  2s
    Wait and Click Element  ${lookup_select_button}
    Sleep  5s
    Click Element  ${capex_opex_drop_down}
    ${capex_opex_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${capex_opex_value}']
    Click Element  xpath: ${capex_opex_xpath}
    Sleep  2s
    Wait Until Element Is Visible  ${li_short_description_input}  30s  Short description field is not displayed
    Input Text  ${li_short_description_input}  ${li_short_description_value}
    Capture Page Screenshot

Validate Payment General setup block
    [Arguments]  ${rent_category_value}  ${payment_type_value}  ${payment_amount_before_hst_value}  ${payment_frequency_value}  ${payment_start_date_value}  ${payment_end_date_value}  ${proration_method_value}
    Click Element  ${rent_category_drop_down}
    ${rent_category_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${rent_category_value}']
    Click Element  xpath: ${rent_category_xpath}
    Sleep  2s
    Click Element  ${payment_type_drop_down}
    ${payment_type_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${payment_type_value}']
    Click Element  xpath: ${payment_type_xpath}
    Sleep  2s
    Input Text  ${payment_amount_before_hst_input}  ${payment_amount_before_hst_value}
    Click Element  ${payment_frequency_drop_down}
    ${payment_frequency_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${payment_frequency_value}']
    Click Element  xpath: ${payment_frequency_xpath}
    Sleep  2s
    Input Text  ${payment_start_date_input}  ${payment_start_date_value}
    Input Text  ${payment_end_date_input}  ${payment_end_date_value}
    Click Element  ${payment_proration_method_drop_down}
    ${proration_method_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${proration_method_value}']
    Wait and Click Element  xpath: ${proration_method_xpath}
    Sleep  3s
    Capture Page Screenshot

Validate payment escalation setup
    [Arguments]  ${escalation_method_value}
    Click Element  ${escalation_method_drop_down}
    ${escalation_method_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${escalation_method_value}']
    Click Element  xpath: ${escalation_method_xpath}
    Sleep  2s
    Capture Page Screenshot

Validate Customer Payer Information block
    Wait Until Element Is Visible  ${customer_id_start_icon}  30s  Customer id lookup icon is not displayed
    Click Element  ${customer_id_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  3s
    Wait and Click Element  ${lookup_select_button}
    Sleep  3s
    Wait Until Element Is Visible  ${customer_start_id_start_icon}  30s  Customer start id lookup icon is not displayed
    Click Element  ${customer_start_id_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  3s
    Click Element  ${lookup_select_button}
    Sleep  10s
    Capture Page Screenshot

Validate OPEX Codes block
    [Arguments]  ${business_line_value}
    Wait Until Element Is Visible  ${business_line_start_icon}  30s  Business line lookup icon is not displayed
    scroll element into view  ${business_line_start_icon}
    Sleep  2s
    Click Element  ${business_line_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  xpath: //div[text()='${business_line_value}']
    #Click Element  ${lookup_first_row}
    Sleep  5s
    Click Element  ${lookup_select_button}
    Wait Until Element Is Visible  ${business_line_start_icon}  30s  Cost centre start icon is not displayed
    Click Element  ${business_line_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  5s
    Click Element  ${lookup_select_button}
    Wait Until Element Is Visible  ${GL_code_start_icon}  30s  GL Code start icon is not displayed
    Click Element  ${GL_code_start_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  5s
    Click Element  ${lookup_select_button}
    Sleep  10s
    Capture Page Screenshot

Input Current Expiry Date and Comments
    [Arguments]  ${date}  ${comments}
    Input Current Term Expiry Date  ${date}
    Wait And Click Element  ${comments_tab}
    Wait And Set Text  ${comments_field}  ${comments}
    Wait And Click Element  ${comments_post_button}
    Capture page screenshot

Select Payment Setup Section and Click Copy
    Wait And Click Element  ${payment_setup_tab}
    Sleep  3s
    Wait And Click Element  ${first_row_click}
    Wait And Click Element  ${gear_icon}
    Wait And Click Element  ${copy_option}
    Sleep  3s
    Capture page screenshot

Verify GL Code Combination is blank
    Wait And Click Element  xpath: //label[text()='GL Code Combo']//following::button[1]
    Sleep  4s
    ${gl_combo_count}=  Get Element Count  ${gl_combo_list}
    Should Be True  ${gl_combo_count}==0  GL Code Combination is not blank
    Capture page screenshot

Verify GL Code Combination is Auto Populated
    Wait And Click Element  xpath: //label[text()='GL Code Combo']//following::button[1]
    Sleep  4s
    ${gl_combo_count}=  Get Element Count  ${gl_combo_list}
    Should Be True  ${gl_combo_count}>0  GL Code Combination is not blank
    Capture page screenshot

Validate Vendor Information block
    Wait Until Element Is Visible  ${vendor_id_startup_icon}  30s  Vendor ID lookup icon is not displayed
    Click Element  ${vendor_id_startup_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  5s
    Click Element  ${lookup_select_button}
    Wait Until Element Is Visible  ${vendor_site_id_startup_icon}  30s  Vendor site id start icon is not displayed
    Click Element  ${vendor_site_id_startup_icon}
    Wait Until Element Is Visible  ${lookup_first_row}  30s  Search results are not displayed
    Click Element  ${lookup_first_row}
    Sleep  5s
    Click Element  ${lookup_select_button}

Input OPEX Details
    [Arguments]  ${bl}  ${costCenter}  ${glCodeCmobo}
    Select Value from Advanced Search  Business Line  ${bl}
    Select Value from Advanced Search  Cost Center  ${costCenter}
    Select Value from Advanced Search  GL Code Combo  ${glCodeCmobo}

Input CAPEX Details
    [Arguments]  ${project}  ${ebs_number}  ${assetCategory}  ${location}  ${expenditureOrgName}  ${expenditureType}
    Select Value from Advanced Search  Project  ${project}
    Wait And Set Text  ${ebs_number_field}  ${ebs_number}
    Select Value from Advanced Search  Asset Category  ${assetCategory}
    Select Value from Advanced Search  Location (CAPEX)  ${location}
    Select Value from Advanced Search  Expenditure Org Name  ${ExpenditureOrgName}
    Select Value from Advanced Search  Expenditure Type  ${ExpenditureType}

Select the created property contract
    [Arguments]   ${property_contract_name}
    Sleep  10s
    Switch Window  title: Primavera Unifier
    ${check}=  Run keyword and Return Status   Wait Until Element Is Visible    ${create_record_iframe}  60s
    IF  '${check}'=='True'
        Select Frame  ${create_record_iframe}
    END
    Sleep  300s
    ${property_contract_xpath}=  Catenate  SEPARATOR=   //div[text()='${property_contract_name}']/ancestor::tr//a
    Click Required Element  xpath: ${property_contract_xpath}
    Sleep  10s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Sleep  2s
    capture page screenshot

Extract the auto created contract payable record number
    Wait Until Element Is Visible  ${payable_record_number}  60s  Payable record number is not displayed
    Scroll Element Into View  ${payable_record_number}
    ${record_number}=  Get Element Attribute  ${payable_record_number}  innerHTML
    Close Window
    [return]  ${record_number}

Extract the reference property contract number
    Wait Until Element Is Visible  ${contract_number}  60s  Payable record number is not displayed
    Scroll Element Into View  ${contract_number}
    ${property_contract_number}=  Get Element Attribute  ${contract_number}  innerHTML
    [return]  ${property_contract_number}

Copy property contract to another property shell
    [Arguments]  ${property_name_value}
    Select Yes in the copy drop down for property contract
    Search for property shell for property contract  ${property_name_value}
    Select the property shell from the search results of property contract  ${property_name_value}

Select Yes in the copy drop down for property contract
    Wait And Click Element  ${expand_copy_block_icon}
    Wait And Click Element  ${copy_record_drop_down}
    Wait And Click Element  ${yes_option_copy_drop_down}
    Sleep  3s

Search for property shell for property contract
    [Arguments]  ${property_name_value}
    Wait And Click Element  ${property_shell_startup_icon}
    Sleep  15s
    Wait And Click Element  ${search_owned_property_icon}
    Wait And Click Element  ${property_name_search_input}
    Input Text  ${property_name_search_input}   ${property_name_value}
    Sleep  3s
    Wait And Click Element  ${search_owned_property_apply}
    Sleep  3s
    Wait And Click Element  ${search_close_icon}
    Sleep  3s

Select the property shell from the search results of property contract
    [Arguments]  ${property_name_value}
    ${property_shell_xpath}=  Catenate  SEPARATOR=  //div[text()[contains(.,'${property_name_value}')]]
    Sleep  3s
    Wait and Click Element  xpath: ${property_shell_xpath}
    Capture Page Screenshot
    Sleep  3s
    Wait And Click Element  ${select_button}

Select the created property contract line item
    [Arguments]   ${property_contract_name}
    Sleep  10s
    Switch Window  title: Primavera Unifier
    Select Required Frame  ${create_record_iframe}
    Sleep  5s
    Click Required Element  ${refresh_property_contract_icon}
    Sleep  5s
    ${property_contract_xpath}=  Catenate  SEPARATOR=   (//a[text()='${property_contract_name}']/parent::div/ancestor::td/preceding-sibling::td)[3]
    Wait and Click Element  xpath: ${property_contract_xpath}
    Sleep  10s
    capture page screenshot

Extract the copied property contract number
    Sleep  5s
    Wait And Click Element  ${expand_copy_block_icon}
    Scroll Element Into View  ${copied_owned_property_number_input}
    Wait Until Element Is Visible  ${copied_owned_property_number_input}  150s
    ${copy_record_number}=   Get Element Attribute  ${copied_owned_property_number_input}  innerHTML
    [return]  ${copy_record_number}

Extract the record number from confirmation Notification
    Wait Until Element Is Visible  ${record_created_notification_message}  60s
    ${record_number_complete_text}=   Get Element Attribute  ${record_created_notification_message}  innerHTML
    ${extracted_record_number_with_space}=  Replace String  ${record_number_complete_text}  has been created successfully.  ${EMPTY}
    ${extracted_record_number}=  Remove String  ${extracted_record_number_with_space}  ${SPACE}
    Capture Page Screenshot
    [return]  ${extracted_record_number_with_space}

Select OK in Confirmation Notification
    Wait And Click Element  ${ok_button_confirmation_window}

Select the created property contract line item with property name
    [Arguments]   ${property_contract_name}
    Sleep  10s
    Switch Window  title: Primavera Unifier
    Select Required Frame  ${create_record_iframe}
    Sleep  5s
    Click Required Element  ${refresh_property_contract_icon}
    Sleep  5s
    ${property_contract_xpath}=  Catenate  SEPARATOR=   (//div[text()='${property_contract_name}']/parent::div/ancestor::td/preceding-sibling::td)[3]
    Click Required Element  xpath: ${property_contract_xpath}
    Sleep  10s
    capture page screenshot

Extract the auto created contract receivable record number and payment amount
    Wait Until Element Is Visible  ${receivable_record_number}  60s  Receivable record number is not displayed
    Scroll Element Into View  ${receivable_record_number}
    ${record_number}=  Get Element Attribute  ${receivable_record_number}  innerHTML
    Scroll Element Into View  ${payment_amount_line_item}
    ${payment_amount_value}=  Get Element Attribute  ${payment_amount_line_item}  innerHTML
    Close Window
    [return]  ${record_number}  ${payment_amount_value}

Input Option Status
    [Arguments]  ${option_status_value}
    Wait Until Element Is Visible  ${option_status_drop_down}  30s
    Click Required Element  ${option_status_drop_down}
    Sleep  3s
    ${option_status_xpath}=  Catenate  SEPARATOR=  //li/div[text()='${option_status_value}']
    Click Required Element  xpath: ${option_status_xpath}

Select Options and Critical Date Section tab
    Wait And Click Element  ${options_critical_dates_tab}
    Sleep  3s

Extract lease action record number
    Wait Until Element Is Visible  ${lease_action_record_number}  75s
    Scroll Element Into View  ${lease_action_record_number}
    ${text_value}=  Get Element Attribute  ${lease_action_record_number}  innerHTML
    Capture Page Screenshot
    Close Window
    [return]  ${text_value}

Click on Search and select record number
    [Arguments]  ${record}
    Sleep  3s
    Wait Until page contains element   ${Search_PC}  60s  Property contract search icon is not displayed
    Wait and Click Element  ${Search_PC}
    Sleep  5s
    Wait Until Element Is Visible  ${record_num}  60s  Record number search input is not displayed
    Input Text  ${record_num}  ${record}
    Sleep  3s
    Click Element  ${apply_button}
    Sleep  3s
    ${record_xpath}=  Catenate  SEPARATOR=  //div/a[contains(text(),'${record}')]
    Click Element   xpath: ${record_xpath}
    Sleep  10s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Clear the data present in Cost Center
    Sleep  20s
    ${checker}=  RUN KEYWORD And Return Status  Wait Until Page Contains Element   ${cost_center_clear_data}  20s  Clear button for Cost Center is not present
    IF  '${checker}' == 'True'
        Scroll element into view  ${cost_center_clear_data}
        Wait And Click Element  ${cost_center_clear_data}
    END
    Sleep  10s
    Capture Page Screenshot

Enter the value in Cost Center
    [Arguments]  ${input}
    Wait Until Page Contains Element  ${cost_center_lookup}  30s  Cost center page not loaded fully
    Wait And Click Element   ${cost_center_lookup}
    Sleep  10s
    Wait And Click Element  ${search_filter_lookup}
    Sleep  2s
    Wait And Set Text  ${cost_center_code_search_field}  ${input}
    Sleep  2s
    ${expected_xpath}=  CATENATE  SEPARATOR=  //td[@data-index='gen_code_name']//mark[text()='${input}']
    Wait until element is visible  ${expected_xpath}  10s  Given Cost Center is not displayed
    Wait And Click Element  ${expected_xpath}
    Capture Page Screenshot
    Sleep  3s
    Wait And Click Element  ${lookup_select_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Clear the data present in GL Code Combo
    Sleep  5s
    ${checker}=  RUN KEYWORD And Return Status  Scroll element into view   ${clear_GL_data}
    IF  '${checker}' == 'True'
        Scroll element into view  ${clear_GL_data}
        Wait And Click Element  ${clear_GL_data}
    END
    Sleep  5s
    Capture Page Screenshot

Click Save And Submit
    Wait And Click Element  ${save_payment_setup_button}
    Sleep  20s
    Wait And Click Element  ${submit_Button}
    Sleep  10s
    Switch Window  title: Primavera Unifier
    Wait Until Page Contains Element  ${home_icon}  60s  Home icon is not displayed
    Capture Page Screenshot And Retry If Required

Switch to Property Contract Frame
    Wait Until Element Is Visible  ${property_contract_frame}  60s  Property Contract frame is not displayed
    Select Frame  ${property_contract_frame}
    Capture Page Screenshot

Enter the GL Code Combo value
    [Arguments]  ${input}
    Wait Until Page Contains Element   ${GL_Code_combo_lookup}  30s  GL Code Combo page not loaded fully
    Wait And Click Element  ${GL_Code_combo_lookup}
    Sleep  10s
    Wait And Click Element  ${search_filter_lookup}
    Sleep  2s
    Wait And Set Text  ${GL_code_combo_search_field}  ${input}
    Sleep  2s
    ${expected_xpath}=  CATENATE  SEPARATOR=  //td[contains(@data-index,'code_combo')]//*[text()='${input}']
    Wait until element is visible  ${expected_xpath}  10s  Given GL Code Combo is not displayed
    Wait And Click Element  ${expected_xpath}
    Capture Page Screenshot
    Sleep  3s
    Wait And Click Element  ${lookup_select_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Payment Setup record line
    [Arguments]  ${line_no}
    Sleep  10s
    ${record_xpath}=  CATENATE  SEPARATOR=  //tr[@data-rowset-id="rowsets_1"]/td[@data-index="li_num"]//child::div[text()='${line_no}']
    FOR  ${i}  IN RANGE  100
        Sleep  3s
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${record_xpath}  10s  Payment Setup Record is not present
        IF  '${checker}' == 'True'
            Wait And Click Element  ${record_xpath}
            Exit For Loop
        END
        Execute JavaScript    window.document.getElementById('580grid-scroller-vertical-rowsets_1').scrollBy(0,200)
    END
#    Wait And Click Element  ${record_xpath}
    Sleep  3s
    Capture Page Screenshot

Click Edit Record
    ${checker}=  RUN KEYWORD And Return Status  Wait Until Page Contains Element   ${edit_link}  20s  Edit button is not present
    IF  '${checker}' == 'True'
        Wait And Click Element  ${edit_link}
    END
    Sleep  3s
    Capture Page Screenshot

Click Save Draft the Contract
    Wait And Click Element  ${save_payment_setup_button}
    Sleep  10s
    Wait And Click Element  ${save_draft}
    Sleep  10s
    Wait until element is visible  ${draft_message}  20s  Draft saved alert is not displayed
    Sleep  5s
    Wait And Click Element  ${alert_ok}
    Sleep  5s
    Capture Page Screenshot And Retry If Required