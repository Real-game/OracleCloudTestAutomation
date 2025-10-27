*** Variables ***

#My Documents Information
${href_show_filters}  link: Show Filters
${doc_type_drop_down}   xpath: //label[text()='Document Type']/parent::span//a
${doc_type_input}       xpath: //label[text()='Document Type']/parent::span//input
${remove_payroll_filter}      xpath: //img[@title='Remove Filter: Payroll']
${remove_expired_filter}      xpath: //img[@title='Remove Filter: Expired']
${view_more_details_link}     xpath: //a[@title='View More Details']

${add_button}  xpath: //span[text()='Add']
${document_type_dropdown}  xpath: //label[text()='Document Type']//following::a[contains(@id,'lcvSis:typRSrh')]
${document_type_value}  xpath: //label[text()='Document Type']//following::tr[contains(@id,'lcvSis:typRSrh::item')]//child::th/div

${vaccination_status_dropdown}  xpath: //label[text()='Vaccination Status']//following::a[contains(@id,'df2_DocumentsOfRecordDFF1IteratormxVaccinationStatusGLB_MX_COVID_VACCINATION_PROOF::lovIconId')]
${fully_vaccinated_november_dropdown}  xpath: //a[contains(@id,'df2_DocumentsOfRecordDFF1IteratormxIntentToVaccinate_DisplayGLB_MX_COVID_VACCINATION_PROOF::lovIconId')]
${read_covid_attestation_data_provided}  xpath: //a[contains(@id,'df2_DocumentsOfRecordDFF1IteratormxEmployeeConsentGLB_MX_COVID_VACCINATION_PROOF::lovIconId')]

${Attach_img}  xpath:  //span[text()='Drag files here or click to add attachment']/parent::a
${Attach_file}  xpath: //td[text()='Add File']
${submit_option}  xpath: //a[@accesskey='m']

${search_input_field_document_records_page}  xpath: //input[@placeholder='Search by type, name, or number']
${search_icon_document_records_page}     xpath: //a[@title='Search']
