*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddToRequisition.robot

*** Keywords ***

Add a requisition to the candidate
    [Arguments]  ${requisition_id}
    Sleep  2s
    Wait And Set Text   ${requisition_info_input_text_box}  ${requisition_id}
    Sleep   2s
    Log To Console  Requisition text is entered
    Press Keys	${requisition_info_input_text_box}  ENTER
    Sleep  2s
    Log To Console  Requisition is selected
    Wait And Click Element  ${create_job_application_checkbox}
    Sleep  2s
    Wait And Click Element  ${save_and_close_button}
    Log To Console  Save and close button is clicked
   # Wait And Click Element  ${close_pop_up}
    Sleep  10s
    capture page screenshot

Add a requisition to the candidate record
    [Arguments]  ${requisition_id}
    Sleep  2s
    Wait And Set Text   ${requisition_info_input_text_box}  ${requisition_id}
    Sleep   2s
    Log To Console  Requisition text is entered
    Press Keys	${requisition_info_input_text_box}  ENTER
    Sleep  2s
    Log To Console  Requisition is selected
#    Wait And Click Element  ${create_job_application_checkbox}
    Sleep  2s
    Wait And Click Element  ${save_and_close_button}
    Log To Console  Save and close button is clicked
   # Wait And Click Element  ${close_pop_up}
    Sleep  10s
    capture page screenshot

