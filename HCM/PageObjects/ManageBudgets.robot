*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ManageBudgets.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Click on Adjust Budget
    Wait Until Page Contains  Adjust Budget  20s  Manage Budgets page is not displayed
    Capture Page Screenshot and Retry If Required
    Click Element  ${adjust_budget_button}
    Wait Until Page Contains  Budget Pool  20s  Adjust Budget pop up is not displayed
    Capture Page Screenshot

Adjust the budget
    [Arguments]   ${budget_pool_option}  ${budget_reason_option}  ${new_budget_area_input_value}
    Click Element  ${budget_pool_drop_down}
    Wait Until Page Contains  ${budget_pool_option}  20s  Budget pool option is not displayed
    ${budget_pool_xpath}=  Catenate  SEPARATOR=  //li[text()='  ${budget_pool_option}   ']
    Click Element  xpath: ${budget_pool_xpath}
    Click Element  ${reason_drop_down}
    Wait Until Page Contains  ${budget_reason_option}  20s  Budget pool option is not displayed
    ${budget_reason_xpath}=  Catenate  SEPARATOR=  //li[text()='  ${budget_reason_option}   ']
    Click Element  xpath: ${budget_reason_xpath}
    Sleep  2s
    Click Element  ${new_budget_area_input}
    Input Text  ${new_budget_area_input}  ${new_budget_area_input_value}
    Click Element  ${adjustment_amount_input}
    Sleep  20s
    Capture Page Screenshot
    ${value}=  Get Element Attribute  ${new_budget_area_input}  value
    Click Element  ${save_and_close_button}
    Wait Until Page Contains  Confirmation  20s  Confirmation pop up is not displayed
    Capture Page Screenshot
    Click Element  ${ok_button}
    Capture Page Screenshot
    Wait Until Page Contains  Updates Allowed  20s  Manage Budgets page is not displayed
    ${dollar_value}=  Fetch From Left  ${value}  .
    Log To Console  dollar value from string operation is ${dollar_value}
    Wait Until Page Contains  ${dollar_value}  20s  Dollar value is not listed

Click on Done in Manage Budgets Page
    Click Element  ${done_button}
    Capture Page Screenshot
    Wait Until Page Contains  Workforce Compensation  20s  Workforce Compensation page is not displayed
