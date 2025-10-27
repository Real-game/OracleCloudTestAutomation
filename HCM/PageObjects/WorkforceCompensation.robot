*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/WorkforceCompensation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select the Manager To Act as Proxy Manager
    [Arguments]   ${manager_name}
    Click Element  ${manager_drop_down}
    Wait Until Page Contains  ${manager_name}  20s  Manager name is not listed
    Capture Page Screenshot and Retry If Required
    ${manager_xpath}=   Catenate  SEPARATOR=  //li[text()='  ${manager_name}  ']
    Click Element  xpath: ${manager_xpath}
    Sleep    5s
    Wait Until Page Contains  Manage Budgets  20s  Manage Budgets page is not displayed
    Capture Page Screenshot and Retry If Required

Click on Manage Budgets
    Click Element  ${manage_budgets_link}
    Wait Until Page Contains  Adjust Budget  20s  Manage Budget page is not displayed
    Capture Page Screenshot and Retry If Required

Click on Pay for Performance
    Click Element  ${pay_for_performance_link}
    Wait Until Page Contains  Probation End Date  20s  Pay for Performance page is not displayed
    Capture Page Screenshot and Retry If Required


