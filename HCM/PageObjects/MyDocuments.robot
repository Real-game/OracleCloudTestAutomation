*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MyCompensation.robot

*** Keywords ***
Verify Salary and Annual Salary Amount in Current Salary section
    [Arguments]  ${salary_amount_value}  ${annual_salary_amount_value}
    Element Should Contain  ${salary_amount}  ${salary_amount_value}
    Element Should Contain  ${annual_salary_amount}  ${annual_salary_amount_value}

Show Prior Salary
    Wait And Click Element  ${show_prior_salary}
    Wait Until Page Contains  Hide Prior Salary  20s  Hide Prior Salary link is not displayed
    Capture Page Screenshot
    ${count}=  Get Element Count  ${prior_salary_list}
    IF  ${count}>0
        Log  salary is updated '${count}' times for this employee
    END

