*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ChangeSalary.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Search Person In Change Salary Page
    [Arguments]   ${person_number}
    Wait And Set Text  ${employment_search}  ${person_number}
    Wait And Click Element  ${employment_search_result}
    Wait until page contains  Change Salary :   20s   Change Salary : page is not displayed
    Capture page screenshot

Click Propose New Salary Button
    Mouse Over  ${propose_new_salary_button}
    Wait And Click Element  ${propose_new_salary_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Current Date
    Wait And Click Element  ${select_date_icon}
    Sleep  3s
    Wait And Click Element  ${select_current_date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Action
    [Arguments]  ${action}
    Wait And Click Element  ${action_drop_down}
    Sleep  3s
    Wait And Click Element  xpath: //span[text()="${action}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Ok Button
    Mouse Over  ${ok_button}
    Wait And Click Element  ${ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Update salary Amount
    [Arguments]  ${salary}
    Sleep  3s
    ${status}=  Run Keyword and Return Status  Wait And Set Text  ${salary_amount}  ${salary}
    IF  '${status}'!='True'
        Wait And Set Text  ${salary_amount}  ${salary}
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Continue Button
    Mouse Over  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Review Updated salary Amount
    [Arguments]  ${salary}
    Sleep  3s
    page should contain  ${salary}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Mouse Over  ${submit_button}
    Wait And Click Element  ${submit_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click Warning Yes Button
    Wait And Click Element  ${warning_yes_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required