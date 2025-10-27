*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_Tasks.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot

*** Keywords ***
Select Existing Contract Receivables
    [Arguments]  ${workspace_name}  ${contract_payable_record_number_value}
    Sleep  3s
    ${frame_xpath}  Catenate  //li[contains(@aria-label,'${workspace_name}')]/following::iframe[@class='qaframe'][@title='Content'][1]
    Select Required Frame  ${frame_xpath}
    Sleep  3s
    Search for the record number  ${contract_payable_record_number_value}
    Sleep  3s
    Click Required Element  xpath: //a[text()='${contract_payable_record_number_value}']
    Sleep  10s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Click Accept Button
    Wait And Click Element  ${accept_btn}
    Sleep  5s
    Capture page screenshot

Select Payment Details Tab
    Wait And Click Element  ${payment_details_tab}
    Sleep  5s
    ${total_amount_UI}=  Get Text  ${total_amount}
    Log  Total Amount in Payment Details Section ${total_amount_UI}
    Capture page screenshot

Click Send and Select Workflow Action
    [Arguments]  ${workspace_name}  ${workflow_action}
    Wait And Click Element  ${send_btn}
    Sleep  5s
    Wait Until Page Contains Element  ${workflow_actions_btn}  60s  Workflow Actions page is not displayed
    Wait And Click Element  ${workflow_actions_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${workflow_action}']
    Sleep  1s
    Capture page screenshot
    Wait And Click Element  ${workflow_actions_send_btn}

Update Customer Site ID in AR Payment Information
    [Arguments]  ${customer_site_ID}
    Select Value from Advanced Search  Customer Site ID  ${customer_site_ID}

Select Existing Contract Payable
    [Arguments]  ${workspace_name}  ${contract_payable_record_number_value}
    Sleep  3s
    ${frame_xpath}  Catenate  //li[contains(@aria-label,'${workspace_name}')]/following::iframe[@class='qaframe'][@title='Content'][1]
    Select Required Frame  ${frame_xpath}
    Sleep  3s
    Search for the record number  ${contract_payable_record_number_value}
    Sleep  3s
    Click Required Element  xpath: //a[text()='${contract_payable_record_number_value}']
    Sleep  10s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Search for the record number
    [Arguments]  ${record_number_value}
    Click Required Element  ${search_record_icon}
    Sleep  2s
    Click Required Element  ${record_number_input_field}
    Sleep  2s
    Input Text  ${record_number_input_field}  ${record_number_value}
    Sleep  2s
    Click Required Element  ${apply_button}

Send and Select Workflow Action
    [Arguments]  ${workflow_action}
    Wait And Click Element  ${send_btn}
    Sleep  5s
    Wait Until Page Contains Element  ${workflow_actions_btn}  60s  Workflow Actions page is not displayed
    Wait And Click Element  ${workflow_actions_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${workflow_action}']
    Sleep  1s
    Capture page screenshot
    Wait And Click Element  ${workflow_actions_send_btn}
    Sleep  10s
    Switch Window  title: Primavera Unifier
    Wait Until Page Contains Element  ${home_icon}  60s  Home icon is not displayed

