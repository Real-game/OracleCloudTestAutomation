*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/TaxCreditInformation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Edit Regional
    Wait And Click Element  ${edit_regional}
    Wait And Verify Page Contains Text  Provincial Tax  20s  Provincial Tax page not displayed
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Total Claim Amount as
    [Arguments]  ${total_claim_amount}
    clear element text  ${total_claim_amount_text_box}
    Sleep  2s
    Wait And Set Text  ${total_claim_amount_text_box}  ${total_claim_amount}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on I agree checkbox
    Wait And Click Element  ${i_agree_checkbox}
    Sleep  3s

Click on Save and Close
    Wait And Click Element  ${save_and_close}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Edit Federal
    Wait And Click Element  ${edit_federal}
    Wait And Verify Page Contains Text  Federal Tax  20s  Federal Tax page not displayed
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Additional Tax as
    [Arguments]  ${additional_tax}
    clear element text  ${additional_tax_text_box}
    Sleep  2s
    Wait And Set Text  ${additional_tax_text_box}  ${additional_tax}
    Sleep  3s
    Capture Page Screenshot And Retry If Required