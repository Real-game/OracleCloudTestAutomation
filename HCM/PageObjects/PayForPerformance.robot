*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PayForPerformance.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Apply Filter for Eligible Employees
    Click Element  ${filter_icon}
    Wait Until Page Contains Element  ${eligibility_status_drop_down}  20s  Eligibility status drop down is not displayed
    Click Element  ${eligibility_status_drop_down}
    Wait Until Page Contains Element  ${eligible_check_box}  20s  Eligibility status check box is not displayed
    Click Element  ${eligible_check_box}
    Capture Page Screenshot
    Sleep  3s
    Click Element  ${go_icon}

Extract eligible person number and person name
    Wait Until Page Does Not Contain Element  ${ineligible_employee}  40s  Ineligible employees are also listed
    Scroll Element Into View  ${columns_hidden_text}
    ${person_number_value}=  Get Element Attribute  ${first_employee_person_number}  innerHTML
    ${person_name_value}=  Get Element Attribute  ${first_employee_name}  innerHTML
    ${person_rating_value}=  Get Element Attribute  ${first_employee_rating}  innerHTML
    Log  person number is ${person_number_value} and person name is ${person_name_value} and rating value is ${person_rating_value}
    [return]  ${person_number_value}  ${person_name_value}  ${person_rating_value}



