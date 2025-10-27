*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_ContractPayables.robot

*** Keywords ***

Switch to contract payable frame
    Wait Until Element Is Visible  ${contract_payable_frame}  60s  Contract payable frame is not displayed
    Select Frame  ${contract_payable_frame}
    Capture Page Screenshot

Select the contract payable record
    [Arguments]  ${contract_payable_record_number_value}
    ${contract_payable_record_xpath}=  Catenate  SEPARATOR=   //a[text()='${contract_payable_record_number_value}']
    Wait and Click Element  xpath: ${contract_payable_record_xpath}
    Capture Page Screenshot

Search for the contract payable record
    [Arguments]  ${contract_payable_record_number_value}
    Wait Until Element Is Visible  ${first_contrat_payable_record}  35s   Contract payable record table is not displayed
    Wait And Click Element  ${search_icon}
    Sleep  3s
    Wait And Click Element  ${record_number_input}
    Input Text  ${record_number_input}  ${contract_payable_record_number_value}
    Sleep  2s
    Wait And Click Element  ${apply_button}
    Sleep  5s

Verify Reference property contract number
    [Arguments]  ${reference_property_contract_number_value}
    Wait Until Element Is Visible  ${reference_property_contract_number_input}   60s
    Scroll Element Into View  ${reference_property_contract_number_input}
    ${actual_reference_property_contract_number}=  Get Element Attribute  ${reference_property_contract_number_input}  innerHTML
    Should Contain  ${actual_reference_property_contract_number}  ${reference_property_contract_number_value}
    Capture Page Screenshot

Verify Contract Payable title
    [Arguments]  ${contract_payable_title_value}
    Wait Until Element Is Visible  ${title_input}   30s
    Scroll Element Into View  ${title_input}
    ${actual_contract_payable_title}=  Get Element Attribute  ${title_input}  innerHTML
    Should Contain  ${actual_contract_payable_title}  ${contract_payable_title_value}
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

Click on payment details tab in Contract payable item
    Wait And Click Element  ${payment_details_tab}
    Capture Page Screenshot

Verify Payment type
    [Arguments]  ${payment_type_value}
    Wait Until Element Is Visible  ${payment_type_input}   30s
    Scroll Element Into View  ${payment_type_input}
    ${actual_payment_type_value}=  Get Element Attribute  ${payment_type_input}  innerHTML
    Should Contain  ${actual_payment_type_value}  ${payment_type_value}
    Capture Page Screenshot

Verify contract line item
    [Arguments]  ${contract_line_item_value}
    Wait Until Element Is Visible  ${contract_line_item_input}   30s
    Scroll Element Into View  ${contract_line_item_input}
    ${actual_contract_line_item_value}=  Get Element Attribute  ${contract_line_item_input}  innerHTML
    Should Contain  ${actual_contract_line_item_value}  ${contract_line_item_value}
    Capture Page Screenshot

Verify CAPEX OPEX
    [Arguments]  ${capex_opex_value}
    Wait Until Element Is Visible  ${capex_opex_input}   30s
    Scroll Element Into View  ${capex_opex_input}
    ${actual_capex_opex_value}=  Get Element Attribute  ${capex_opex_input}  innerHTML
    Should Contain  ${actual_capex_opex_value}  ${capex_opex_value}
    Capture Page Screenshot

Click Accept Button in Contract Payable
    Wait And Click Element  ${accept_btn}
    Sleep  5s
    Capture page screenshot

Click Send and Select Workflow Action in Contract Payable
    [Arguments]  ${workspace_name}  ${workflow_action}
    Sleep  5s
    Click Required Element  ${send_btn}
    Sleep  10s
    Wait Until Element Is Visible  ${workflow_actions_btn}  60s  Workflow Actions page is not displayed
    Click Required Element  ${workflow_actions_btn}
    Sleep  2s
#    Click Required Element  xpath: //li/div[text()='${workflow_action}']
    wait and click element    xpath: //li/div[text()='${workflow_action}']
    Sleep  1s
    Capture page screenshot
    Click Required Element  ${workflow_actions_send_btn}

Verify Payment Amount
    [Arguments]  ${payment_amount_value}
    Wait Until Element Is Visible  ${payment_amount_input}   30s
    Scroll Element Into View  ${payment_amount_input}
    ${actual_payment_amount_value}=  Get Element Attribute  ${payment_amount_input}  innerHTML
    Should Contain  ${actual_payment_amount_value}  ${payment_amount_value}
    Capture Page Screenshot

Validate GL data
    [Arguments]  ${gl_date_value}  ${organization_value}
    Sleep  30s
    Click Required Element  ${gl_date_input}
    Input Text  ${gl_date_input}  ${gl_date_value}
    Sleep  2s
    ${check}=  Verify the Element Presence  //span[contains(@id,'organization_selected')]
    IF  '${check}'=='True'
         ${text}=  Get Element Attribute  xpath: //span[contains(@id,'organization_selected')]  innerHTML
         Log  Selected organization is ${text}
         Capture Page Screenshot
    ELSE
        Click Element  ${organization_drop_down}
        Sleep  3s
        Click Element  xpath: //ul[contains(@id,'organization')]//li/div[text()='${organization_value}']
        Sleep  3s
        Capture Page Screenshot
    END