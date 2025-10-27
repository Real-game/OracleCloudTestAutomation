*** Variables ***

${search_button}   xpath: (//std-view-buttons//*[@title='Find on Page']//span[contains(@class,'search-list')])[1]
${iframe}     xpath: //li[contains(@aria-label,'Metrolinx')]/following::iframe[@class='qaframe'][@title='Content'][1]
${report_name_search_field}   xpath: //th[@data-index='report_name']/input
${property_tax_invoice_links}   xpath: (//td[@data-index='report_name']//div/mark[text()='Tax'])[2]
${occupancy_report_link}   xpath: //td[@data-index='report_name']//div/mark[text()='Occupancy']
#${excel_radio_button}   xpath: //*[text()='Excel']/preceding::input[1]
${excel_radio_button}   xpath: //label//*[text()='Excel']
${vendor_id_field}   xpath: (//input[contains(@id,'vendor_id')])[2]
${vendor_name_field}   xpath: (//input[contains(@id,'vendor_name')])[2]
${run_report_button}   xpath: //button//span[text()='Run Report']
${utility_bills_report_link}   xpath: //td[@data-index='report_name']//div/mark[text()='Bills']
#//td[@data-index='report_name']//div[text()='Utility ']/mark[text()='Bills']
${record_count_for_udr_link}   xpath: //label[text()='Record count for UDR']//following::a[1]
${record_count_1000}   xpath: //ul/li/div[text()='1,000']
${payment_variance_a_r_link}   xpath: //mark[text()='(A/R)']/parent::div[text()='CRE: Payment Variance ']
