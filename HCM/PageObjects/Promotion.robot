*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Promotion.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    ${fail_check}=  Run Keyword and Return Status   capture page screenshot  Condition to check page fail
    IF   '${fail_check}'== 'False'
        capture page screenshot
    END

Continue
    Wait And Click Element  ${continue}
    Sleep  5s

Check Salary And Compensation Then Click Contiue
    Sleep  3s
    Wait And Click Element  ${click_salary}
    Wait And Click Element  ${click_compensation}
    Sleep  3s
    Wait And Click Element  ${selection_continue_button}
    Sleep  3s
    capture page screenshot

Fill details of When and Why
    [Arguments]  ${date}  ${way}  ${reason}
    Wait And Set Text  ${promotion_start_date}   ${date}
    Sleep  3s
    Clear Element Text  ${promotion_way_dropdown}
    Sleep  3s
    Wait And Click Element  ${promotion_way_dropdown}
    Sleep  3s
    Wait and Click Element  xpath: //div[text()='${way}']
    Sleep  6s
    wait and click element  ${promotion_reason_dropdown}
    Sleep  3s
    wait and click element  xpath: //div[text()='${reason}']
    Sleep  3s
    Continue
    capture page screenshot

Select Position On Promotion Page
    [Arguments]  ${value}
    Wait And Set Text  ${select_position}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  2s
    ${promote_yes_check}=  Run Keyword and Return Status   Wait until element is visible  ${yes_button}  10s  Yes button is not displayed
    IF  '${promote_yes_check}'=='True'
        Wait And Click Element  ${yes_button}
    END
    Sleep  3s
    Continue
    Sleep  2s
    capture page screenshot

Select Salary Adjustment Percentage
    [Arguments]  ${salary_percentage}
    Wait And Click Element  ${adjustment_percentage}
    Sleep  2s
    Wait Then delete And Set Text  ${adjustment_percentage}  ${salary_percentage}
    Sleep  2s
    Wait And Click Element  xpath: (//label[text()='Adjustment Percentage'])[1]
    Sleep  2s
    Continue
    Sleep  2s
    capture page screenshot

Submit Details
    Wait And Click Element  ${submit_button}
    Wait And Verify Page Contains Element  ${href_my_client}  120s  An Employee's Promotion Submission Process still not finished
    capture page screenshot
