*** Variables ***
#Batch Process Type
${batch_type_dropdown}  xpath: //label[text()='Batch Process Type']//following::a[contains(@id,'f1Sel::drop')]
${batch_type_value}  xpath: //label[text()='Batch Process Type']//following::li

#Effective date checkbox
${current_date_checkbox}  xpath: //td[text()='Current Date']//preceding::label[contains(@for,'dynam1:0:sor1:_0')]

#Review period
${eligibility_review_period_dropdown}  xpath: //label[text()='Review Period']//following::a[contains(@id,'reviewPeriodNameId::lovIconId')]
${eligibility_review_period_value}  xpath: //div[contains(@id,'reviewPeriodNameId')]//child::span

#Performance document name combobox
${performance_document_name_input}  xpath: //label[text()='Performance Document Name']//following::input[contains(@id,'soc1')]

#Create eligible performance document : checkbox - Yes
${eligible_performance_label}  xpath: //label[text()='Create Eligible Performance Document']
${eligible_performance_check}  xpath: //label[text()='Create Eligible Performance Document']//following::label[text()='Yes' and contains(@for,'selectOneRadio1')]

#Maximum Number of Concurrent Threads for Performance Document Creation input
${max_num_threads_input}  xpath: //label[text()='Maximum Number of Concurrent Threads for Performance Document Creation']//following::input[contains(@id,'it4')]

#Purge Historic Performance Management Eligibility Status Data : checkbox - NO
${eligibility_status_check}  xpath: //label[text()='Purge Historic Performance Management Eligibility Status Data']//following::label[text()='No' and contains(@for,'selectOneRadio2')]

#submit button
${submit_option}  xpath: //a[@accesskey='m']

#Warning Ok
${ok_button}  xpath: //td[contains(@id,'Dialog')]/button[text()='OK']

${submission_confirmation_number}  xpath: //span[contains(@id,'confirmationPopup')]/label

${monitor_process_button}   xpath: //button[text()="Monitor Process"]

