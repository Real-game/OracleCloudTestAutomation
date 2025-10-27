*** Variables ***

${vendor_iframe}     xpath: //li[contains(@aria-label,'Metrolinx')]/following::iframe[@class='qaframe'][@title='Content'][1]

${apply_btn_search}     xpath: //div[text()='Search']/following-sibling::div//button//span[text()='Apply'][1]
${close_btn_search}   xpath: //div[text()='Search']/following-sibling::div//*[@title='Close']//span[contains(@class,'close')][1]
${vendor_search_icon}     xpath: //h1[text()='Vendors']//following::*[@id='search']/button
${vendor_id_search_condition_link}   xpath: //input[@aria-label='Vendor ID']/preceding::a[2]
${search_condition_equals}   xpath: //li//span[text()='equals']
${vendor_id_search_field}   xpath: //input[@aria-label='Vendor ID']
${site_information_tab}   xpath: //a//span[text()='Site Information']
${work_phone_value}   xpath: //div[@aria-label='Work Phone']

${vendor_name_header}   xpath: //div[@aria-label='Vendor Name']
${vendor_number_header}   xpath: //div[@aria-label='Vendor Number']
${vendor_id_header}   xpath: //div[@aria-label='Vendor ID']
${vendor_status_header}   xpath: //label[text()='Status']//following::span[1]
#//td[@data-index='ven_vendorid_txt']//div[text()='100536']
#//td[@data-index='ven_SiteID_txt']//div[text()='118635']