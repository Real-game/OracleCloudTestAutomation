*** Variables ***
${business_unit_drop_down}  xpath://a[contains(@id,'businessUnitId')]
${business_unit_option}     xpath: //span[text()='Metrolinx BU']
${person_type_drop_down}    xpath: //label[text()='Person Type']/parent::td/following-sibling::td//input[@role='combobox']
${assignment_status_drop_down}   xpath: //label[text()='Assignment Status']/parent::td/following-sibling::td//input[@role='combobox']
${assignment_status_options}    xpath: //ul[contains(@id,'NewPe1:0:selectOneChoice2::pop')]//li
${position_drop_down}       xpath: //label[text()='Position']/parent::td//following-sibling::td//a
${position_search_option}       xpath: //a[text()='Search...']
${code_text_box}                xpath: //label[contains(text(),'Code')][contains(@class,'query')]/parent::td/following-sibling::td//input
${search_button}                xpath: //a[contains(@id,'search')]
${name_text_box}                xpath: //label[contains(text(),'Name')][contains(@class,'query')]/parent::td/following-sibling::td//input
${salaried_text_box}                xpath: //label[contains(text(),'Hourly Paid or Salaried')]/parent::td/following-sibling::td//input[@role='combobox']
${salaried_options}              xpath: //ul[contains(@id,'selectOneChoice2')][contains(@id,'JobDe1')]//li
${atu_initiation_fee_exempt_drop_down}      xpath: //label[text()='ATU Initiation Fee Exempt']/parent::td/following-sibling::td//a
${atu_initiation_options}       xpath: //div[contains(@id,'IteratoratuInitiationFeeExempt')]//td/span
${floater_options}              xpath: //div[contains(@id,'Iteratorfloater')]//td/span
${floater_drop_down}            xpath: //label[text()='Floater']/parent::td/following-sibling::td//a
${person_type_options}          xpath: //ul[contains(@id,'selectOneChoice2')]//li
${ok_button_position_dialog}    xpath: //button[text()='OK'][contains(@id,'positionId')]
${warning_ok_button}            xpath: //button[contains(@id,'dialogWarning::ok')]
${add_payroll_frequency_icon}   xpath: //img[contains(@id,'cil113')][@title='Create']
${payroll_selection_drop_down}  xpath: //a[contains(@title,'Select: Payroll')]
${payroll_options}              xpath: //div[contains(@id,'selectOneChoice1')]//td/span
