*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreateJobRequisition.robot

*** Keywords ***
Select Use From Drop Down
    [Arguments]  ${use}
    Wait And Click Element  ${use_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${use}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Business Unit
    [Arguments]  ${name}
    Sleep  3s
    Wait And Click Element  ${business_unit_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //div[text()="${name}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Position
    [Arguments]  ${code}
    Wait And Send Keys  ${Position_input_box}  ${code}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Continue Button
    Wait And Click Element  ${continue_button}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Select Business Justification
    [Arguments]  ${value}
    Wait And Click Element  ${business_justification_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Recruiting Type
    [Arguments]  ${type}
    Wait And Click Element  ${recruiting_type_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${type}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Organization
    [Arguments]  ${value}
    Wait And Click Element  ${orgnization_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //div[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Primary Location
    [Arguments]  ${value}
    Wait And Click Element  ${primary_location_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //div[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Save And Close Button
    Wait And Click Element  ${save_and_close_button}

Get Requisition Id
    ${text}=  Wait And Get Text  ${requisition_confirmation_message}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    ${id}=  getIdFromName  ${text}
    [Return]  ${id}