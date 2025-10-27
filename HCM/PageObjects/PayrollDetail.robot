*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PayrollDetail.robot

*** Keywords ***

Click on View Flows link
    Wait Until Page Contains  View Flows  20s  Payroll details page is not displayed
    Scroll Element Into View  ${view_flows_link}
    Capture Page Screenshot
    Wait And Click Element  ${view_flows_link}
    Wait Until Page Contains  Show Filters  20s  View Flows page is not displayed
    Capture Page Screenshot

Click on Submit a Flow
    Wait Until Page Contains  Submit a Flow  20s  Payroll details page is not displayed
    Scroll Element Into View  ${submit_a_flow_link}
    Capture Page Screenshot
    Wait And Click Element  ${submit_a_flow_link}
    Wait Until Page Contains  Show Filters  20s  Submit a Flow page is not displayed
    Capture Page Screenshot

Click Submit a Flow
    Wait And Click Element  ${submit_a_flow}
    Wait And Verify Page Contains Text   Flow Submission  20s  Flow Submission page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Personal Payment Methods
    Wait And Click Element  ${personal_payment_methods}
    Wait And Verify Page Contains Text  Personal Payment Methods  20s  Personal Payment Methods page is not displayed
    Capture Page Screenshot And Retry If Required
