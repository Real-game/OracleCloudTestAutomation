*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/AdministerEmployees.robot
Resource  ../Keywords/CommonKeywords.robot
Library  Collections

*** Keywords ***

Search By Employee Number
    [Arguments]  ${number}
    Sleep  5s
    Click Element  ${search_number}
    Input Text  ${search_number}  ${number}
    Sleep  2s
    Wait and click element  ${search_button}
    Sleep  5s
    ${employee_xpath}=  Catenate  SEPARATOR=  (//span[text()='Active - Payroll Eligible']//parent::td/preceding-sibling::td//span[text()='${number}']//parent::td/preceding-sibling::td//a)[1]
    ${checker}=  Run Keyword and Return Status  Click Element  xpath: ${employee_xpath}
    IF  '${checker}'=='False'
        Click Element  xpath: ${employee_xpath}
    END
    Capture Page Screenshot And Retry If Required

Select Pay For Performance under plan
    Wait And Click Element  ${pay_for_performance}
    Sleep  2s

Select Eligibility under Personal Information
    Wait And Click Element  ${Eligibility}
    Sleep  2s

Select Eligibility Status dropdown
    [Arguments]  ${option}
    Wait And Click Element  ${eligibility_status_dropdown}
    Sleep  2s
    Select Required Value  ${eligibility_status}  ${option}
    Capture Page Screenshot And Retry If Required

Click Save And Close in Administer Employees page
    Wait And Click Element  ${save_and_close}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Yes Button
    Wait And Click Element  ${yes_button}
    Sleep  2s
    Capture Page Screenshot And Retry If Required
