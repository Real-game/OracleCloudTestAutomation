*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_ContractReceivables.robot

*** Keywords ***
Verify Invoice Status
    [Arguments]  ${workspace_name}  ${contract_receivables_name}  ${expected_status}
    Sleep  3s
    Search Contract Receivable  ${workspace_name}  ${contract_receivables_name}
#    ${frame_xpath}  Catenate  //li[contains(@aria-label,'${workspace_name}')]/following::iframe[@class='qaframe'][@title='Content'][1]
#    Select Frame  ${frame_xpath}
#    Sleep  3s
    ${status_xpath}  Catenate  //a[text()='${contract_receivables_name}']//ancestor::td/preceding-sibling::td[1]//div[contains(@style,'line')]
    scroll element into view  ${status_xpath}
    Wait Until Page Contains Element  ${status_xpath}  60s  Status of Selected Invoice is not found
    ${current_status}=  Get Text  ${status_xpath}
    Should Be Equal  ${current_status}  ${expected_status}  Status of Selected Invoice is not ${expected_status}
    Capture Page Screenshot

Select Contract Receivables
    [Arguments]  ${contract_receivables_name}
    Wait And Click Element  xpath: //a[text()='${contract_receivables_name}']
    Sleep  10s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Verify Payment Due Date
    [Arguments]  ${payment_due_date_EBS}
    Sleep  10s
    ${payment_due_date_UI}=  Get Text  ${payment_due_date}
    Should Be Equal  ${payment_due_date_UI}  ${payment_due_date_EBS}  Payment due date is not same as in EBS
    capture page screenshot

Verify EBS Payment Information
    [Arguments]  ${EBS_invoiceNumber}  ${EBS_invoiceID}  ${EBS_creationDate}
    scroll element into view  ${invoiceEBSID}
    ${ebs_invoice_ID_UI}=  Get Text  ${invoiceEBSID}
    Should Be Equal  ${ebs_invoice_ID_UI}  ${EBS_invoiceID}  EBS Invoice ID is not same as in EBS
    ${ebs_creation_date_UI}=  Get Text  ${creationDateEBS}
    Should Be Equal  ${ebs_creation_date_UI}  ${EBS_creationDate}  EBS Creation Date is not same as in EBS
    ${ebs_invoice_number_UI}=  Get Text  ${invoiceNumberEBS}
    Should Be Equal  ${ebs_invoice_number_UI}  ${EBS_invoiceNumber}  EBS Invoice Number is not same as in EBS
    capture page screenshot

Search Contract Receivable
    [Arguments]  ${workspace_name}  ${contract_receivables_name}
    Sleep  3s
    ${frame_xpath}  Catenate  //li[contains(@aria-label,'${workspace_name}')]/following::iframe[@class='qaframe'][@title='Content'][1]
    Select Required Frame  ${frame_xpath}
    Sleep  3s
    Click Required Element  ${search_icon}
    Sleep  2s
    Wait And Set Text  ${invoice_ref_number_input}  ${contract_receivables_name}
    Sleep  2s
    Click Required Element  ${apply_btn_search}
    Sleep  7s
    Click Required Element  ${close_btn_search}
    Sleep  2s

Switch to contract receivable frame
    Wait Until Element Is Visible  ${contract_receivable_frame}  60s  Contract receivable frame is not displayed
    Select Frame  ${contract_receivable_frame}
    Capture Page Screenshot

Select the contract receivable record
    [Arguments]  ${contract_receivable_record_number_value}
    ${contract_receivable_record_xpath}=  Catenate  SEPARATOR=   //a[text()='${contract_receivable_record_number_value}']
    Wait and Click Element  xpath: ${contract_receivable_record_xpath}
    Capture Page Screenshot

Search for the contract receivable record
    [Arguments]  ${contract_receivable_record_number_value}
    Wait Until Element Is Visible  ${first_contract_receivable_record}  35s   Contract receivable record table is not displayed
    Wait And Click Element  ${search_icon}
    Sleep  5s
    Wait And Click Element  ${invoice_ref_number_input}
    Input Text  ${invoice_ref_number_input}  ${contract_receivable_record_number_value}
    Wait And Click Element  ${apply_button}
    Sleep  5s

Verify Reference property contract number
    [Arguments]  ${reference_property_contract_number_value}
    Wait Until Element Is Visible  ${reference_property_contract_number}   30s
    Scroll Element Into View  ${reference_property_contract_number}
    ${actual_reference_property_contract_number}=  Get Element Attribute  ${reference_property_contract_number}  innerHTML
    Should Contain  ${actual_reference_property_contract_number}  ${reference_property_contract_number_value}
    Capture Page Screenshot

Verify Contract Name
    [Arguments]  ${contract_name_value}
    Wait Until Element Is Visible  ${contract_name_input}   30s
    Scroll Element Into View  ${contract_name_input}
    ${actual_contract_name_title}=  Get Element Attribute  ${contract_name_input}  innerHTML
    Should Contain  ${actual_contract_name_title}  ${contract_name_value}
    Capture Page Screenshot

Verify MX CRE File #
    [Arguments]  ${mx_cre_file_number_value}
    Wait Until Element Is Visible  ${mx_cre_file_number_input}   30s
    Scroll Element Into View  ${mx_cre_file_number_input}
    ${actual_mx_cre_file_number}=  Get Element Attribute  ${mx_cre_file_number_input}  innerHTML
    Should Contain  ${actual_mx_cre_file_number}  ${mx_cre_file_number_value}
    Capture Page Screenshot

Click on payment details tab in Contract receivable item
    Sleep  5s
    Wait And Click Element  ${payment_details_tab}
    Sleep  3s
    Capture Page Screenshot

Verify Payment Amount
    [Arguments]  ${payment_amount_value}
    Wait Until Element Is Visible  ${payment_amount_input}   30s
    Scroll Element Into View  ${payment_amount_input}
    ${actual_payment_amount_value}=  Get Element Attribute  ${payment_amount_input}  innerHTML
    Should Contain  ${actual_payment_amount_value}  ${payment_amount_value}
    Capture Page Screenshot

Post Comments
    [Arguments]  ${comments_text_value}
    Click Required Element  ${comments_tab}
    Click Required Element  ${comments_text_area}
    Input Text  ${comments_text_area}  ${comments_text_value}
    Click Required Element  ${post_button}
    Sleep  6s
    Capture Page Screenshot

Click on Contract Receivable details tab
    Click Required Element  ${contract_receivable_details_tab}
    Capture Page Screenshot

Select record number from contract recievables
    Click Required Element    ${invoive_num}
    Sleep  10s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Switch to contract receivable iframe
    Wait Until Element Is Visible  ${contract_receivable_iframe}  60s  Contract receivable frame is not displayed
    Select Frame  ${contract_receivable_iframe}
    Capture Page Screenshot

Select Accept button in Contract Receivables
    ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${accept_but}  20s  Accept button not visible
    IF  '${checker}' == 'True'
        Wait And Click Element  ${accept_but}
        Sleep  3s
    END
    Capture Page Screenshot And Retry If Required