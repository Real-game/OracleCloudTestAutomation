*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierCreateNewOwnedProperties.robot

*** Keywords ***

Validate Property Information block
    [Arguments]  ${capex_opex_value}  ${status_value}
    Sleep  5s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Wait Until Element Is Visible  ${owned_property_details_tab}  60s  Owned property details tab is not displayed
    Click Element  ${capex_opex_drop_down}
    ${xpath}=   Catenate  SEPARATOR=  //li/div[text()='${capex_opex_value}']
    Click Element  xpath:${xpath}
    Sleep  3s
    Click Element  ${status_drop_down}
    ${status_xpath}=   Catenate  SEPARATOR=  //li/div[text()='${status_value}']
    Click Element  xpath:${status_xpath}

Validate Title Information block
    [Arguments]  ${owner_value}  ${purchaser_permanent_easement_value}  ${vendor_value}  ${acquisition_value}
    Wait Until Page Contains Element  ${owner_purchaser_on_title_input}  60s  Owner purchaser on title input field is not displayed
    Input Text  ${owner_purchaser_on_title_input}  ${owner_value}
    Input Text  ${purchaser_on_title_input}  ${purchaser_permanent_easement_value}
    Input Text  ${vendor_seller_input}  ${vendor_value}
    Click Element  ${acquisition_purchase_price_input}
    Input Text  ${acquisition_purchase_price_input}  ${acquisition_value}
    Click Element  ${vendor_seller_input}
    Capture Page Screenshot

Validate Address Information block
    [Arguments]  ${address_value}  ${city_value}
    Wait Until Page Contains Element  ${address_1_input}  60s  Address input field is not displayed
    Input Text  ${address_1_input}  ${address_value}
    Input Text  ${city_input}  ${city_value}
    Capture Page Screenshot

Validate Property Use Block
    [Arguments]   ${property_use_status_value}  ${future_use_value}  ${future_use_description_value}  ${transitional_date_value}  ${transitional_area_comments_value}
    Wait Until Page Contains Element  ${property_use_status_drop_down}  60s  Property use drop down field is not displayed
    Sleep  5s
    scroll element into view  ${property_use_status_drop_down}
    Sleep  2s
    Click Element  ${property_use_status_drop_down}
    ${property_use_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${property_use_status_value}']
    Click Element  xpath: ${property_use_xpath}
    Click Element  ${property_use_multi_select_drop_down}
    Sleep  10s
    Click Element  ${property_use_option_value}
    Sleep  2s
    Click Element  ${close_icon}
    Sleep  2s
    Click Element  ${future_use_drop_down}
    ${future_use_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${future_use_value}']
    Click Element  xpath: ${future_use_xpath}
    Input Text  ${future_use_description_input}  ${future_use_description_value}
    Input Text  ${transitional_date_calendar_input}  ${transitional_date_value}
    Input Text  ${transitional_area_comments_input}  ${transitional_area_comments_value}
    Capture Page Screenshot

Validate PIN Mileage Survey Block
    [Arguments]   ${subject_pin_number_value}  ${subject_assessment_roll_number_value}  ${survey_plans_value}  ${mileage_point_from_value}  ${mileage_comments_value}
    Wait Until Page Contains Element  ${subject_pin_number_input}  60s  Subject PIN number field is not displayed
    Input Text  ${subject_pin_number_input}  ${subject_pin_number_value}
    Input Text  ${subject_assessment_roll_number_input}  ${subject_assessment_roll_number_value}
    Input Text  ${survey_plans_input}  ${survey_plans_value}
    Input Text  ${mileage_point_form_input}  ${mileage_point_from_value}
    Input Text  ${comments_input}  ${mileage_comments_value}
    Capture Page Screenshot

Validate Area Calculation Block
    [Arguments]  ${property_type_value}  ${building_structure_value}  ${doc_area_size_value}  ${number_of_units_in_building_value}  ${number_of_occupied_units_value}  ${area_comments_value}
    Wait Until Page Contains Element  ${property_type_drop_down}  60s  Property type field is not displayed
    Click Element  ${property_type_drop_down}
    ${property_type_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${property_type_value}']
    Click Element  xpath: ${property_type_xpath}
    Click Element  ${building_structure_on_property_drop_down}
    ${building_structure_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${building_structure_value}']
    Click Element  xpath: ${building_structure_xpath}
    Input Text  ${doc_area_size_input}  ${doc_area_size_value}
    Input Text  ${number_of_units_in_building_input}  ${number_of_units_in_building_value}
    Input Text  ${number_of_occupied_units_input}  ${number_of_occupied_units_value}
    Input Text  ${comments_area_calculation_input}  ${area_comments_value}
    Capture Page Screenshot

Validate building demolitions block
    [Arguments]  ${demolition_date_value}  ${demolition_comments_value}
    Wait Until Page Contains Element  ${demolition_date_input}  60s  Demolition date field is not displayed
    Input Text  ${demolition_date_input}  ${demolition_date_value}
    Input Text  ${building_demolitions_comments_input}  ${demolition_comments_value}
    Click Element  ${demolition_reason_multi_select_input}
    Sleep  2s
    Click Element  ${property_use_option_value}
    Click Element  ${close_icon}
    Capture Page Screenshot

Validate property disposed details block
    [Arguments]  ${disposition_type_value}  ${date_disposed_value}  ${disposition_price_value}  ${disposition_size_value}  ${disposition_details_value}  ${brokerage_company_value}
    Wait Until Page Contains Element  ${disposition_type_drop_down}  60s  Disposition type field is not displayed
    Click Element  ${disposition_type_drop_down}
    ${disposition_type_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${disposition_type_value}']
    Click Element  xpath: ${disposition_type_xpath}
    Input Text  ${date_disposed_input}  ${date_disposed_value}
    Input Text  ${disposition_price_input}  ${disposition_price_value}
    Input Text  ${disposition_size_acres_input}  ${disposition_size_value}
    Input Text  ${disposition_details_input}  ${disposition_details_value}
    Input Text  ${brokerage_company_input}  ${brokerage_company_value}
    Capture Page Screenshot

Validate Expropriation Details block
    [Arguments]  ${expropriation_property_rights_value}  ${compensation_been_settled_value}  ${s_42_act_applicable_value}  ${applicable_expropriation_value}  ${expropriation_comments_value}
    Wait Until Page Contains Element  ${expropriation_property_rights_drop_down}  60s  Expropriation Property Rights field is not displayed
    Click Element  ${expropriation_property_rights_drop_down}
    ${expropriation_property_rights_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${expropriation_property_rights_value}']
    Click Element  xpath: ${expropriation_property_rights_xpath}
    Click Element  ${compensation_been_settled_drop_down}
    ${compensation_been_settled_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${compensation_been_settled_value}']
    Click Element  xpath: ${compensation_been_settled_xpath}
    Click Element  ${s_42_act_applicable_drop_down}
    ${s_42_act_applicable_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${s_42_act_applicable_value}']
    Click Element  xpath: ${s_42_act_applicable_xpath}
    Click Element  ${applicable_expropriation_act_drop_down}
    ${applicable_expropriation_act_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${applicable_expropriation_value}']
    Click Element  xpath: ${applicable_expropriation_act_xpath}
    Input Text  ${expropriation_comments_input}  ${expropriation_comments_value}
    Capture Page Screenshot

Submit Owned Property
    Wait And Click Element  ${submit_owned_property_button}
    Sleep  5s
    Capture Page Screenshot

Switch to Owned property window
    Sleep  5s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]

Edit the owned property
     Sleep  5s
     ${check}=   Run keyword and Return Status  Wait Until Element Is Visible  ${edit_owned_property_button}  30s  Edit owned property field is not displayed
     IF  '${check}'=='True'
          Click Element    ${edit_owned_property_button}
          Log  Edit button is displayed
          Sleep  5s
          Capture Page Screenshot
     END

Edit Disposition type
    [Arguments]  ${disposition_type_value}  ${ref_owned_property_value}
    Wait Until Page Contains Element  ${disposition_type_drop_down}  120s  Disposition type field is not displayed
    Sleep  10s
    Click Element  ${disposition_type_drop_down}
    ${disposition_type_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${disposition_type_value}']
    Click Element  xpath: ${disposition_type_xpath}
    ${check}=   Run Keyword and Return Status  Wait Until Element Is Visible  ${remove_owned_reference_icon}  30s  Close icon is not displayed
    IF  '${check}'=='True'
        Click Element  ${remove_owned_reference_icon}
        Sleep  10s
    END
    Click Element  ${ref_new_owned_property_lookup_icon}
    Sleep  2s
    Wait Until Element Is Visible  ${search_owned_property_icon}  10s  Search owned property icon is not displayed
    Sleep  10s
    Click Element  ${search_owned_property_icon}
    Wait Until Element Is Visible  ${record_number_search_input}  10s  Search owned property icon is not displayed
    Sleep  3s
    Input Text  ${record_number_search_input}  ${ref_owned_property_value}
    Sleep  3s
    Click Element  ${search_owned_property_apply}
    Sleep  3s
    ${record_xpath}=  Catenate  SEPARATOR=  //div[text()='${ref_owned_property_value}']
    Click Element   xpath: ${record_xpath}
    Sleep  3s
    Click Element  ${select_button}
    Sleep  5s
    Wait Until Page Contains  ${ref_owned_property_value}  30s  Reference owned property id is not displayed

Click on Environmental Condition tab
    Sleep  10s
    Wait Until Element Is Visible  ${environmental_condition_tab}  60s  Environmental condition tab is not displayed
    Click Element  ${environmental_condition_tab}
    Capture Page Screenshot

Click on Add environmental condition button
    Wait Until Element Is Visible  ${add_button_environmental_condition_tab}  60s  Add button in Environmental condition tab is not displayed
    Click Element  ${add_button_environmental_condition_tab}
    Capture Page Screenshot

Add environmental condition line item without restoration clause
    [Arguments]  ${li_description_value}   ${property_contaminated_value}  ${yes_details_value}  ${estimated_remediation_cost_value}  ${outstanding_environment_claim_value}  ${additional_comments_value}
    Wait Until Element Is Visible  ${li_short_description_input}  60s  LI short description in Environmental condition tab is not displayed
    Input Text  ${li_short_description_input}  ${li_description_value}
    Click Element  ${property_contaminated_drop_down}
    ${property_contaminated_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${property_contaminated_value}']
    Click Element  xpath: ${property_contaminated_xpath}
    Sleep  4s
    Input Text  ${yes_detail_property_contaminated_input}  ${yes_details_value}
    Input Text  ${estimated_remediation_cost_input}  ${estimated_remediation_cost_value}
    Input Text  ${outstanding_environment_claim_input}  ${outstanding_environment_claim_value}
    Input Text  ${additional_comments_input}  ${additional_comments_value}
    Capture Page Screenshot

Add remediation or restoration clause
    [Arguments]  ${remediation_restoration_clause_value}  ${remediation_restoration_type_value}   ${remediation_restoration_scope_value}  ${remediation_restoration_start_date_value}  ${remediation_restoration_end_date_value}  ${final_remediation_restoration_amount_value}  ${document_page_section_value}  ${additional_comments_value}
    Click Element  ${remediation_restoration_clause_drop_down}
    ${remediation_restoration_clause_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${remediation_restoration_clause_value}']
    Click Element  xpath: ${remediation_restoration_clause_xpath}
    Sleep  4s
    Click Element  ${remediation_restoration_type_drop_down}
    ${remediation_restoration_type_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${remediation_restoration_type_value}']
    Click Element  xpath: ${remediation_restoration_type_xpath}
    Sleep  4s
    Click Element  ${remediation_restoration_scope_drop_down}
    ${remediation_restoration_scope_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${remediation_restoration_scope_value}']
    Click Element  xpath: ${remediation_restoration_scope_xpath}
    Sleep  4s
    Input Text  ${remediation_restoration_start_date_input}  ${remediation_restoration_start_date_value}
    Input Text  ${remediation_restoration_end_date_input}  ${remediation_restoration_end_date_value}
    Input Text  ${final_remediation_restoration_amount_input}  ${final_remediation_restoration_amount_value}
    Input Text  ${additional_comments_restoration_section_input}  ${additional_comments_value}
    Capture Page Screenshot

Save the environment condition
    Click Element  ${save_environmental_condition_button}
    Sleep  3s

Validate the error message
    [Arguments]   ${error_text_value}
    Wait Until Element Is Visible  ${error_icon}  20s  Validation Error icon is not displayed
    Click Element  ${error_icon}
    Wait Until Element Is Visible  ${error_message_text}  20s  Error message text is not displayed
    ${error_text}=   Get Element Attribute  ${error_message_text}  innerHTML
    Should be equal  ${error_text_value}  ${error_text}  Expected text is ${error_text_value} and actual text is ${error_text}


Click on Property Reservation tab
    Wait Until Element Is Visible  ${property_reservation_tab}  60s  Property Reservation tab is not displayed
    Click Element  ${property_reservation_tab}
    Capture Page Screenshot

Click on Add property reservation button
    Wait Until Element Is Visible  ${add_button_environmental_condition_tab}  60s  Add button in Environmental condition tab is not displayed
    Click Element  ${add_button_environmental_condition_tab}
    Capture Page Screenshot

Add Occupancy Term Info
    [Arguments]  ${occupancy_start_date_value}  ${occupancy_end_date_value}
    Wait Until Element Is Visible  ${occupancy_term_start_date_input}  60s  Add button in Environmental condition tab is not displayed
    Input Text  ${occupancy_term_start_date_input}  ${occupancy_start_date_value}
    Input Text  ${occupancy_term_end_date_input}  ${occupancy_end_date_value}
    Sleep  5s
    Capture Page Screenshot

Add Project/Activity Details Info
    [Arguments]  ${provide_description_value}  ${expenditure_value}  ${project_code_value}  ${cost_centre_value}  ${expected_revenue_value}
    Wait Until Element Is Visible  ${provide_description_input}  60s  Add button in Environmental condition tab is not displayed
    Input Text  ${provide_description_input}  ${provide_description_value}
    Click Element  ${expenditure_drop_down}
    ${expenditure_xpath}=   Catenate  SEPARATOR=   //li//div[text()='${expenditure_value}']
    Click Element  xpath: ${expenditure_xpath}
    Sleep  3s
    #Input Text  ${project_code_input}  ${project_code_value}
    #Input Text  ${cost_center_input}  ${cost_centre_value}
    #Input Text  ${expected_revenue_input}  ${expected_revenue_value}
    Capture Page Screenshot

Extract the record number from confirmation Notification
    Wait Until Element Is Visible  ${record_created_notification_message}  60s
    ${record_number_complete_text}=   Get Element Attribute  ${record_created_notification_message}  innerHTML
    ${extracted_record_number_with_space}=  Replace String  ${record_number_complete_text}  has been created successfully.  ${EMPTY}
    ${extracted_record_number}=  Remove String  ${extracted_record_number_with_space}  ${SPACE}
    Capture Page Screenshot
    [return]  ${extracted_record_number_with_space}

Select OK in Confirmation Notification
    Wait And Click Element  ${ok_button_confirmation_window}

Copy owned property to another property shell
    [Arguments]  ${property_name_value}
    Select Yes in the copy drop down
    Search for property shell  ${property_name_value}
    Select the property shell from the search results  ${property_name_value}

Select Yes in the copy drop down
    Wait And Click Element  ${expand_copy_block_icon}
    Wait And Click Element  ${copy_record_drop_down}
    Wait And Click Element  ${yes_option_copy_drop_down}
    Sleep  3s

Search for property shell
    [Arguments]  ${property_name_value}
    Wait And Click Element  ${property_shell_startup_icon}
    Sleep  15s
    #${list}=  Get Window Handles
    #Switch Window  ${list}[3]
    Wait And Click Element  ${search_owned_property_icon}
    Wait And Click Element  ${property_name_search_input}
    Input Text  ${property_name_search_input}   ${property_name_value}
    Wait And Click Element  ${search_owned_property_apply}
    Wait And Click Element  ${search_close_icon}

Select the property shell from the search results
    [Arguments]  ${property_name_value}
    ${property_shell_xpath}=  Catenate  SEPARATOR=  //div[text()[contains(.,'${property_name_value}')]]
    Click Element  xpath: ${property_shell_xpath}
    Capture Page Screenshot
    Wait And Click Element  ${select_button}

Verify Subject Assessment Number
    [Arguments]  ${subject_assessment_number_value}
    Wait Until Page Contains  ${subject_assessment_number_value}
    Scroll Element Into View  ${related_assessment_roll_number_input}
    Sleep  10s
    Capture Page Screenshot

