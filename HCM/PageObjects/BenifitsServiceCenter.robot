*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/BenifitsServiceCenter.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Add Behind Peoples
    Wait And Click Element  ${add_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search And Select Person
    [Arguments]  ${number}
    Wait And Send Keys  ${search_person}  ${number}
    Sleep  5s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Enter Last Name
    [Arguments]  ${last_name}
    Wait And Set Text  ${last_name_input}  ${last_name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Relationship Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${relatioship_start_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Submit Button
    Wait And Click Element  ${submit_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Select People to Cover
    Wait And Click Element  ${people_to_cover}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Relation
    [Arguments]  ${relation}
    Wait And Click Element  ${relationship_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${relation}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Veify Submitted Dependent Details
    [Arguments]  ${last_name}
    wait until element is visible  ${add_button}  30s
    mouse over  link: ${last_name}
    page should contain  ${last_name}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Potential Life Events
    Wait And Click Element  ${potential_life_events_add_button}
    Wait And Verify Page Contains Text  Add Life Event  20s  Add Life Event page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Select Life Event
    [Arguments]  ${event}
    Wait And Click Element  ${life_events_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //li[text()="${event}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Set Occurred Date
    [Arguments]  ${date}
    Wait And Set Text  ${occurred_date_input}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Save And Close Button
    Wait And Click Element  ${save_and_close_button}
    Sleep  7s
    Capture Page Screenshot And Retry If Required

Select Potential Life Event Action
    [Arguments]  ${value}
    Wait And Click Element  ${potential_life_events_action_dropdown}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${value}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required