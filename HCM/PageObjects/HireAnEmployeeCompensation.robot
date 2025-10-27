*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HireAnEmployeeCompensation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Fill the salary details
    [Arguments]  ${salaried_drop_down_value}  ${salary_amount_input_value}
        Wait Until Page Contains  Salary Information  20s  Salary information is not displayed in the compensation page
        Wait And Click Element  ${salaried_input}
        ${salaried_xpath}=  Catenate  SEPARATOR=  //span[text()='   ${salaried_drop_down_value}  ']
        Wait And Click Element  xpath: ${salaried_xpath}
        Sleep  5s
        Wait And Input Text From Input  ${salary_amount_input}  ${salary_amount_input_value}
        Sleep  2s
        Capture Page Screenshot

Click on Next button in Compensation page
    Sleep  4s
    Wait And Click Element  ${next_button_compensation}
    Log  Next button is clicked in Hire an Employee: Compensation page

Verify review page
    [Arguments]   ${salaried_drop_down_value}  ${salary_amount_input_value}
    Wait Until Page Contains  Hire an Employee: Review  20s  Review page is not displayed
    Wait Until Page Contains   ${salaried_drop_down_value}  20s  Salaried information is not displayed
    Wait Until Page Contains   ${salary_amount_input_value}   20s  Salary amount is not displayed

Submit the manual hire
    Wait And Click Element  ${submit_button_compensation}
    Wait Until Page Contains  Warning  20s  Warning popup is not displayed
    Capture Page Screenshot
    Wait And Click Element  ${yes_pop_up_hire_submission}
    Wait Until Page Contains  Confirmation  20s  Confirmation pop up is not displayed
    Capture Page Screenshot
    Wait And Click Element  ${ok_button_confirmation_popup}
    Wait Until Page Contains  New Person  20s  New Person page is not displayed








