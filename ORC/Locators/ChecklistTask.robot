*** Variables ***

${personal_information_chevron_icon}              xpath: //div[text()[contains(.,'Personal Details')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${family_and_emergency_details_chevron_icon}      xpath: //div[text()[contains(.,'Family and Emergency Details')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${direct_deposit_chevron_icon}                    xpath: //div[text()[contains(.,'Direct Deposit')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${Banking_chevron_icon}                    xpath: //div[text()[contains(.,'Banking')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span

${tax_form_instructions_chevron_icon}             xpath: //div[text()[contains(.,'Tax Form Instructions')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${tax_forms_td1_chevron_icon}                     xpath: //div[text()='Tax Forms-TD1 & TD1ON']//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${tax_forms_td1ON_chevron_icon}                   xpath: //div[text()[contains(.,'Tax Forms-TD1ON')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${aoda_training_chevron_icon}                     xpath: //div[text()[contains(.,'AODA Training')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${ohsa_training_chevron_icon}                     xpath: //div[text()[contains(.,'OHSA Training')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${metrolinx_policies_chevron_icon}                xpath: //div[text()[contains(.,'Metrolinx Policies')]]//ancestor::div[contains(@class,'item-main-content')]/following-sibling::div/span
${go_to_application_task_link}                    xpath: //span[text()[contains(.,'Go to application task')]]/parent::a
${country_text}                                   xpath: //span[contains(@id,'rCtyInp::content')]
${start_date_text}                                xpath: //span[contains(@id,'rSDInp::content')]
${marital_status_text}                            xpath: //span[contains(@id,'rMarSel::content')]
${gender_text}                                    xpath: //span[contains(@id,'rSexSel::content')]
${biographical_info_expand_icon}                  xpath: //div[contains(@title,'Biographical Info')]//ancestor::table//img[@title='Expand']/parent::a
${date_of_birth_text}                             xpath: //span[contains(@id,'rDob')]
${personal_details_done}                          xpath: //a[@title='Done']
${checklist_done_button}                          xpath: //span[contains(@id,'doneBtn')]
${add_contact_button}                             xpath: //span[text()[contains(.,'Add')]]
${create_a_new_contact_link}                      xpath: //td[text()[contains(.,'Create a New Contact')]]
${add_bank_account}                               xpath: //div[@title='Add Bank Account']//a
${account_number_input}                           xpath: //label[text()='Account Number']/parent::td/following-sibling::td//input[contains(@name,'it7')]
${bank_drop_name}                                 xpath: //span/a[contains(@id,'bankName')]
${bank_options}                                   xpath: //tr[contains(@class,'xem')]/td/span[@class='x2o2']
${bank_number}                                    xpath: //label[text()='Bank Number']/parent::td/following-sibling::td//span[contains(@id,'it1::content')]
${more_actions}                                   xpath: //span[text()='More Actions']
${add_to_calendar_option}                         xpath: //a[text()='Add to Calendar']
${file_picker_icon}                               xpath: //oj-file-picker[@id='attachmentsDropFilePicker_task-attachments-readwrite']//div[@class='oj-filepicker-icon oj-fwk-icon-plus oj-fwk-icon']
${signer_name_input}                              xpath: //input[contains(@id,'signerNameInput')]
${signer_email_input}                             xpath: //input[contains(@id,'signerEmail')]
