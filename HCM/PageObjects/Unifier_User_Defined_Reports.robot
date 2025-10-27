*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Library  ../Helpers/Excel_Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Unifier_User_Defined_Reports.robot

*** Keywords ***
Select User Defined Reports Frame
    Sleep  10s
    Select Frame  ${iframe}
    Sleep  3s

Open Property Tax Invoices
    Wait And Click Element  ${search_button}
    Wait And Set Text  ${report_name_search_field}  Property Tax Invoice
    Sleep  3s
    Double Click Element  ${property_tax_invoice_link}
    Capture Page Screenshot

Select Excel Radio Button
    #Unselect Frame
    Wait And Click Element  ${excel_radio_button}
    Capture Page Screenshot

Input Vendor Name and Vendor ID
    [Arguments]  ${vendor_name}  ${vendor_ID}
    Wait And Set Text  ${vendor_name_field}  ${vendor_name}
    Wait And Set Text  ${vendor_id_field}  ${vendor_ID}
    Capture Page Screenshot

Click Run Report
    Sleep  2s
    Wait And Click Element  ${run_report_button}
    Sleep  30s
    Capture Page Screenshot

Validate Presence of File
    Sleep  10s
    ${result}  validate_file_presence  report
    Should Be Equal  ${result}  Present  Report is not downloaded

Open Occupancy Report
    Sleep  3s
    Wait And Click Element  ${search_button}
    Sleep  3s
    Wait And Set Text  ${report_name_search_field}  Occupancy Report
    Sleep  3s
    Double Click Element  ${occupancy_report_link}
    Capture Page Screenshot

Open Utility Bills Report
    Wait And Click Element  ${search_button}
    Wait And Set Text  ${report_name_search_field}  Bills Report
    Sleep  3s
    Double Click Element  ${utility_bills_report_link}
    Capture Page Screenshot

Select Record Count
    Wait And Click Element  ${record_count_for_udr_link}
    Sleep  2s
    Wait And Click Element  ${record_count_1000}

Open AR Payment Variance Report
    Wait And Click Element  ${search_button}
    Wait And Set Text  ${report_name_search_field}  Report (A/R)
    Sleep  3s
    Double Click Element  ${payment_variance_a_r_link}
    Capture Page Screenshot

Validate Report Title
    [Arguments]  ${report_title}
    Sleep  2s
    ${result}  validate_report_header  report  ${report_title}
    Should Be Equal  ${result}  Success  Report ${report_title} is not downloaded. Reported Downloaded - ${result}










