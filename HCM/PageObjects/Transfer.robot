*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Transfer.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    capture page screenshot

Select Continue
    Wait And Click Element  ${continue_button}
    Sleep  3s
    capture page screenshot

Fill The Details In When and Why
    [Arguments]  ${date}  ${reason}
    Wait And Set Text  ${transfer_start_date}  ${date}
    Sleep  3s
    wait and click element  ${transfer_reason}
    Sleep  3s
    ${check}=  Run Keyword and Return Status  Wait Until Page Contains Element  xpath://div[text()='${reason}']  10s  Transfer reason is not displayed
    IF  '${check}'=='True'
        Wait and click element  xpath://div[text()='${reason}']
    ELSE
        wait and click element  ${transfer_reason}
        Sleep  5s
        wait and click element  xpath://div[text()='${reason}']
    END
    Sleep  3s
    capture page screenshot

Select Position On Transfer Page
    [Arguments]  ${value}
    Wait And Send Keys  ${select_position}  ${value}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    ${transfer_yes_check}=  Run Keyword and Return Status   Wait until element is visible  ${yes_button}  10s  Yes button is not displayed
    IF  '${transfer_yes_check}'=='True'
        Wait And Click Element  ${yes_button}
    END
    Sleep  3s
    capture page screenshot

Continue
    Wait And Click Element  ${continue}
    Sleep  5s

Submit Details
    Wait And Click Element  ${submit_button}
    Wait Until Page Contains Element  ${href_my_client}  60s  An Employee's Transfer Submission Process still not finished
    capture page screenshot
