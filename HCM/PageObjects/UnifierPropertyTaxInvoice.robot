*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_PropertyContract.robot
Resource  ../Locators/UnifierPropertyTaxInvoice.robot

*** Keywords ***


Click Create Property Tax Invoice Icon
    [Arguments]  ${property_shell}
    Sleep  5s
    Select Frame  ${property_tax_invoice_iframe}
    Sleep  15s
    Wait And Click Element  ${create_prop_tax_invoice_btn}
    wait until page contains element    ${business_origin_field_btn}    20s    Business Origin drop down field not present
    Wait And Click Element  ${business_origin_field_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li//span[contains(text(),'${property_shell}')]
    Sleep  2s
    Wait And Click Element  ${create_btn_dialogue_}
    Sleep  2s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Input Roll Number on Invoice
    [Arguments]  ${roll_number_on_invoice}
    Wait And Set Text  ${roll_num_invoice_field}  ${roll_number_on_invoice}
    Sleep  3s
    Capture page screenshot

Input Invoice Number
    [Arguments]  ${invoice_number}
    Wait And Set Text  ${invoice_num_field}  ${invoice_number}
    Sleep  2s
    Capture page screenshot

Input Current Receipt Date
    [Arguments]  ${date}
    Wait And Set Text  ${reciept_date_field}  ${date}
    Sleep  1s
    Capture page screenshot

Select Assessment Year
    [Arguments]  ${assessment_year}
    Wait And Click Element  ${assessment_year_btn}
    Sleep  2s
    Wait And Click Element  xpath: //li/div[text()='${assessment_year}']
    Sleep  1s
    Capture page screenshot

Input Education Levy
    [Arguments]  ${education_levy}
    Wait And Set Text  ${education_levy_field}  ${education_levy}
    Sleep  2s
    Capture page screenshot

Input Total Annual Property Tax
    [Arguments]  ${total_annual_property_tax}
    Wait And Set Text  ${total_annual_property_tax_field}  ${total_annual_property_tax}
    Sleep  2s
    Capture page screenshot

Input Property Tax Amount Per Invoice
    [Arguments]  ${property_tax_amt_per_invoice}
    Wait And Set Text  ${property_tax_amt_per_invoice_field}  ${property_tax_amt_per_invoice}
    Sleep  2s
    Capture page screenshot

Input EBS Number
    [Arguments]  ${ebs_number}
    Wait And Set Text  ${ebs_number_field}  ${ebs_number}
    Sleep  2s
    Capture page screenshot

Input Subject PIN
    [Arguments]  ${subject_pin}
    Wait And Set Text  ${subject_pin_field}  ${subject_pin}
    Sleep  2s
    Capture page screenshot

Input Process Date
    [Arguments]  ${date}
    Wait And Set Text  ${process_date_field}  ${date}
    Sleep  1s
    Capture page screenshot

