*** Variables ***
${requisition_info_input_text_box}      //h2[text()="Select Requisitions"]/following::input[@autocomplete="off"]
${requisition_list}     xpath: //tr[contains(@id,'sIs::item')]/th/div
${save_and_close_button}   xpath: //*[contains(@class,'Save')]
${close_pop_up}             xpath: //a[contains(@id,'actwHm:cil5')]
${searched_requisition}     xpath: //*[@id="pt1:_FOr1:1:_FONSr2:0:MAnt2:3:atrUpl:UPsp1:atrPce:sis1:ipsIs::item0"]/th/div
${create_job_application_checkbox}  xpath: //label[text()= "Create job application on behalf of candidate"]
