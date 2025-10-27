*** Variables ***

${owned_property_details_tab}   xpath: //span[text()='Owned Property Details']
${capex_opex_drop_down}   xpath: //label[text()='CAPEX/OPEX']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a
${status_drop_down}   xpath: //label[text()='Status']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a
${owner_purchaser_on_title_input}  xpath: //label[text()='Owner/Purchaser on Title (Fee Simple)']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${purchaser_on_title_input}   xpath: //label[text()='Purchaser on Title (Permanent Easement)']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${vendor_seller_input}   xpath: //label[text()='Vendor/Seller']/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${title_registration_instrument_number_input}  xpath: //label[text()="Title Reg'n Instrument #"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${title_registration_date_input}   xpath: //label[text()="Title Reg'n Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${acquisition_purchase_price_input}   xpath: //label[text()="Acquisition/Purchase Price"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${address_1_input}   xpath: //label[text()="Address 1"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input
${city_input}  xpath: //label[text()="City"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input

${property_use_multi_select_drop_down}   xpath: //label[text()="Property Use"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//oj-button
${property_use_option_value}   xpath: (//input[@aria-label='Select'])[4]
${close_icon}    xpath: //span[@class='oj-panel-remove-icon']
${property_use_status_drop_down}    xpath: //label[text()="Property Use Status"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a
${future_use_drop_down}     xpath: (//label[text()="Future Use?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${future_use_description_input}   xpath: (//label[text()="Future Use Description"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${transitional_date_calendar_input}    xpath: (//label[text()="Transitional Date to Final Operational Use"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${transitional_area_comments_input}    xpath: (//label[text()="Transitional Sites Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]

${subject_pin_number_input}   xpath: (//label[text()="Subject PIN #'s"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${subject_assessment_roll_number_input}   xpath: (//label[text()="Subject Assessment Roll # (ARN)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${survey_plans_input}   xpath: (//label[text()="Survey Plans (as applicable)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${mileage_point_form_input}   xpath: (//label[text()="Mileage Point From"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${comments_input}   xpath: (//label[text()="Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]

${property_type_drop_down}   xpath: (//label[text()="Property Type"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${building_structure_on_property_drop_down}   xpath: (//label[text()="Building Structure on Property?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${doc_area_size_input}   xpath: (//label[text()="Doc. Area Size (acres)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${number_of_units_in_building_input}   xpath: (//label[text()="Number of Units in Building"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${number_of_occupied_units_input}   xpath: (//label[text()="Number of Occupied Units"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${comments_area_calculation_input}   xpath: (//label[text()="Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]

${building_demolitions_comments_input}   xpath: (//label[text()="Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[2]
${demolition_date_input}   xpath: (//label[text()="Demolition Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${demolition_reason_multi_select_input}   xpath: (//label[text()="Demolition Reason"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//oj-button)[1]

${disposition_type_drop_down}   xpath: (//label[text()="Disposition Type"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${date_disposed_input}   xpath: (//label[text()="Date Disposed"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${disposition_price_input}   xpath: (//label[text()="Disposition Price"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${disposition_size_acres_input}   xpath: (//label[text()="Disposition Size (Acres)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${disposition_details_input}   xpath: (//label[text()="Part/Full Parcel Disposition Details"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${brokerage_company_input}   xpath: (//label[text()="Brokerage Company"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]


${expropriation_property_rights_drop_down}   xpath: (//label[text()="Were Property Rights Expropriated?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${compensation_been_settled_drop_down}   xpath: (//label[text()="Has Compensation Been Settled?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${s_42_act_applicable_drop_down}   xpath: (//label[text()="Is S.42 of Act Applicable?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${expropriation_comments_input}   xpath: (//label[text()="Expropriation Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${applicable_expropriation_act_drop_down}   xpath: (//label[text()="Applicable Expropriation Act"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]

${submit_owned_property_button}   xpath: //*[text()='Submit']
${edit_owned_property_button}    xpath: //span[text()='Edit']
${ref_new_owned_property_drop_down}       xpath: (//label[text()="Ref. New Owned Property"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${ref_new_owned_property_lookup_icon}     xpath: //label[text()='Ref. New Owned Property']//parent::div//parent::oj-label//parent::div//parent::div//following-sibling::div//span[contains(@class,'checkbox')]
${search_owned_property_icon}     xpath: (//span[contains(@class,'search')])[1]
${record_number_search_input}     xpath: //label[text()='Record No.']/parent::div/parent::oj-label/parent::div/parent::div//following-sibling::div//oj-input-text//input[@aria-label='Record No.']
${search_owned_property_apply}    xpath: (//span[text()='Apply'])[2]
${select_button}                 xpath: (//span[text()='Select'])[1]
${remove_owned_reference_icon}   xpath: //label[text()='Ref. New Owned Property']//parent::div//parent::oj-label//parent::div//parent::div//following-sibling::div//span[contains(@class,'close-circle-s')]

${environmental_condition_tab}   xpath: //span[contains(text(),'Environmental Condition')]/parent::span/parent::a
${add_button_environmental_condition_tab}    xpath: (//span[text()='Add'])

${li_short_description_input}     xpath: (//label[text()="LI Short Description"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${property_contaminated_drop_down}     xpath: (//label[text()="Is Property Contaminated ?"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${yes_detail_property_contaminated_input}     xpath: (//label[text()="Details if Yes to above"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${estimated_remediation_cost_input}     xpath: (//label[text()="Est. Remediation Costs"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${outstanding_environment_claim_input}     xpath: (//label[text()="Outstanding Env. Claim"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${additional_comments_input}     xpath: (//label[text()="Additional Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${save_environmental_condition_button}    xpath: //oj-button[contains(@class,'save')]//span[text()='Save']
#(//span[text()='Save'])[4]

${remediation_restoration_clause_drop_down}     xpath: (//label[text()="Remediation/Restoration Clause"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${remediation_restoration_type_drop_down}     xpath: (//label[text()="Remediation/Restoration Type"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${remediation_restoration_scope_drop_down}     xpath: (//label[text()="Remediation/Restoration Scope"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${remediation_restoration_start_date_input}     xpath: (//label[text()="Remediation/Restoration Start Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${remediation_restoration_end_date_input}     xpath: (//label[text()="Remediation/Restoration End Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${final_remediation_restoration_amount_input}     xpath: (//label[text()="Final Remediation/Restoration Amount"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${document_page_section_input}     xpath: (//label[text()="Document, Page & Section"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${additional_comments_restoration_section_input}     xpath: (//label[text()="Additional Comments"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[2]
${error_icon}       xpath: (//span[contains(@class,'danger')])[1]
${error_message_text}   xpath: //span[contains(@title,'Date Validation')]

${property_reservation_tab}   xpath: //span[contains(text(),'Property Reservation')]/parent::span/parent::a

${occupancy_term_start_date_input}     xpath: (//label[text()="Start Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${occupancy_term_end_date_input}     xpath: (//label[text()="End Date"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${provide_description_input}     xpath: (//label[text()="Provide a Description Of The Project Or Activity"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]
${expenditure_drop_down}     xpath: (//label[text()="Expenditure/ Revenue Generation"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//a)[1]
${project_code_input}     xpath: //input[@aria-label='Project Code']
${cost_center_input}     xpath: (//label[text()="Cost Center Code"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]
${expected_revenue_input}     xpath: (//label[text()="Expected Revenue"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//input)[1]

${expand_copy_block_icon}     xpath: //span[text()='Copy']/parent::h3/preceding-sibling::a
${copy_record_drop_down}      xpath: //label[text()='Copy Record']//ancestor::div[@slot='label']/parent::div/following-sibling::div//a
${yes_option_copy_drop_down}    xpath: (//div[text()='Yes'])[1]
${property_shell_startup_icon}   xpath: (//span[text()='Type a Property Name...']/parent::div/parent::div/parent::div//following-sibling::div/ancestor::oj-select-one/parent::div/parent::div//span[@slot='startIcon'])[1]

${property_name_search_input}    xpath: //input[@aria-label='Property Name']
${search_close_icon}             xpath: (//span[contains(@class,'ico-close')])[1]

${record_created_notification_message}   xpath: //span[text()[contains(.,'has been created successfully.')]]
${ok_button_confirmation_window}     xpath: //span[text()='OK']

${copied_owned_property_number_input}   xpath: (//label[text()='Copied To Owned Property']/ancestor::div[@slot='label']/parent::div/following-sibling::div//a/span)[1]
${related_assessment_roll_number_input}   xpath: (//label[text()="Related Assessment Roll # (ARN)"]/parent::div/parent::oj-label/parent::div/parent::div/following-sibling::div//textarea)[1]

