*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/HireAnEmployeeActions.robot

*** Keywords ***

Select an Action in hire an employee page
    Wait And Click Element  ${addresses_action}
    Wait And Click Element  ${citizenship_info_action}
    Wait And Click Element  ${additonal_assignment_info_action}
    Wait And Click Element  ${work_relationship_info_action}
    Wait And Click Element  ${payroll_details_action}
    Wait And Click Element  ${salary_action}
    Sleep  2s
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}
