*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/Pay.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click My Banking Information
    Mouse Over  ${my_banking_information}
    Wait And Click Element  ${my_banking_information}
    Wait And Verify Page Contains Text  My Banking Information  20s  My Banking Information page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Under Bank Account
    Wait And Click Element  ${add_bank_account}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Add Account Number
    [Arguments]  ${acc_number}
    Sleep    5s
    Mouse Over  ${enter_account_details}
    Wait And Set Text  ${enter_account_details}  ${acc_number}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Bank
    [Arguments]  ${name}
    Wait And Set Text  ${select_bank}  ${name}
    Sleep  3s
    Wait And Click Element  xpath: //li[contains(.,"${name}")]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Branch Code
    [Arguments]  ${code}
    Wait And Set Text  ${select_bank_branch_code}  ${code}
    Sleep  3s
    Wait And Click Element  //li[contains(.,"${code}")]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Save
    Wait And Click Element  ${save_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Warning Message
    ${error_message}=  Set variable   A bank account with the given details already exists and is owned by another person
    ${status}=  Run Keyword and Return Status  PAGE SHOULD NOT CONTAIN  ${error_message}
    Log To Console  ${status}
    IF  "${status}"!="True"
        Capture Page Screenshot And Retry If Required
        Sleep  3s
        Fail  Account Already Exist
    END

Verify Warning Message With Negative Scenario
    ${error_message}=  Set variable   A bank account with the given details already exists and is owned by another person
    ${status}=  Run Keyword and Return Status  PAGE SHOULD CONTAIN  ${error_message}
    Log To Console  ${status}
    IF  "${status}"!="True"
        Capture Page Screenshot And Retry If Required
        Sleep  3s
        Fail  Account Does Not Exist
    END
    Wait And Click Element  ${warning_cancel_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Warning Ok
    Wait And Click Element  ${warning_ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Under My Banking Information
    scroll element into view    ${add_my_banking_information}
    Sleep  2s
    Wait And Click Element  ${add_my_banking_information}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Call This Payment Method
    [Arguments]  ${name}
    Mouse Over  ${payment_method_name}
    Wait And Set Text  ${payment_method_name}  ${name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Payment Type
    [Arguments]  ${type}
    Wait And Click Element  ${payment_type}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${type}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Amount Type
    [Arguments]  ${amount_type}
    Wait And Click Element  ${payment_amount_type}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${amount_type} "]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Amount Value
    [Arguments]  ${amount}
    Mouse Over  ${payment_amount}
    Wait And Set Text  ${payment_amount}  ${amount}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Bank Account
    [Arguments]  ${account_digit}
    Wait And Click Element  ${select_bank_account}
    Sleep  3s
    Wait And Click Element  xpath: //li[contains(.,${account_digit})]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Edit Payment Method
    [Arguments]  ${method}
    Wait And Click Element  xpath://img[@title="Edit ${method}"]
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Amount
    [Arguments]  ${method}  ${amount}
    wait until element is visible  xpath://img[@title="Edit ${method}"]  20s
    element should contain  xpath://span[text()="${method}"]/following::span[8]  ${amount}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Delete Button
    Mouse Over  ${delete_button}
    Wait And Click Element  ${delete_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click on Tax Credit Information
    Wait And Click Element  ${tax_credit_information}
    Wait And Verify Page Contains Text  Tax Credit Information  20s  Tax Credit Information page not displayed
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click on My Payslips
    Wait And Click Element  ${my_payslips}
    Wait Until Page Contains  Details  20s  My Payslips page is not displayed
    Capture Page Screenshot

View Payslips
    [Arguments]  ${date_range}  ${from_date}  ${to_date}
    Wait And Click Element  ${details_drop_down}
    IF  '${date_range}'!=''
        ${xpath}=  Catenate  SEPARATOR=  //ul/li[contains(text(),'  ${date_range}  ')]
        Click Element  xpath: ${xpath}
        ${check}=  Run Keyword And Return Status  Should Contain  ${date_range}  Specific Date Range
        IF  '${check}'== 'True'
            Click Element  ${from_range_date}
            Input Text  ${from_range_date}  ${from_date}
            Click Element  ${to_range_date}
            Input Text  ${to_range_date}  ${to_date}
            Click Element  ${search_icon}
            Sleep  5s
        END
    END

Verify Presence Of Payslip
    Wait Until Page Contains Element  ${payslip_doc_link}  20s  Payslip is not visible
    Capture Page Screenshot
    Click Element  ${payslip_doc_link}

Click Warning Ok for Delete record
    Mouse Over  ${Warning_ok_delete}
    Wait And Click Element  ${Warning_ok_delete}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Presence Of My Banking Information
    Wait Until Page Contains Element  ${my_banking_info_header}  20s  My Banking Information Header is not visible
    scroll element into view    ${my_banking_info_header}
    Sleep    2s
    Capture Page Screenshot

Verify Add Banking Information should not Present
    wait until page does not contain element    ${add_my_banking_information}  20s  Add Banking Information is visible
    Capture Page Screenshot

Verify Presence Of Reorder Option
    Wait Until Page Contains Element  ${reorder_path}  20s  Reorder Banking Information is not visible
    Capture Page Screenshot
