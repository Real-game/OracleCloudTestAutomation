*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CalculationCards.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Tax Credit Information
    Wait And Click Element  ${tax_credit_information_link}
    Wait And Verify Page Contains Text  Tax Credit Information  20s  Tax Credit Information Page Not Found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Expand And Edit Association Section
    Wait And Click Element  ${expand_associations}
    Sleep  3s
    Wait And Click Element  ${edit_associations}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Fill Basic Information
    [Arguments]  ${date}
    Wait And Set Text  ${change_start_date}  ${date}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Add Under Association Details
    Wait And Click Element  ${add_associations_details}
    Sleep  3s
    Capture Page Screenshot And Retry If Required


Fill Association Details
    [Arguments]  ${date}  ${assignment}
    Wait And Set Text  ${change_start_date}  ${date}
    Sleep  3s
    Wait And Click Element  ${assignment_dropdown}
    Sleep  6s
    ${check}=  Run Keyword And Return Status  Wait Until Element Is Visible  xpath://li[text()='${assignment}']   10s  Assignment drop down is not displayed
    IF  '${check}'!='False'
       Wait And Click Element  xpath://li[text()='${assignment}']
    ELSE
       Wait And Click Element  ${assignment_dropdown}
       Sleep  3s
       Wait And Click Element  xpath://li[text()='${assignment}']
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Ok Button
    Wait And Click Element  ${ok_button}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Save And Close
    Wait And Click Element  ${save_and_close}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify Error Message Displayed
    ${error_check}=  Run Keyword and Return Status  Wait Until Page Contains  Error  10s  Saved succesfully
    IF  '${error_check}'!='True'
        Fail  Failed : Application must show error while saving details
    END
    Log To Console  Passed : Application is showing error while adding card with existing details
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Verify No Error Message Displayed
    ${error_check}=  Run Keyword and Return Status  Wait Until Page Contains  Error  10s  Saved succesfully
    IF  '${error_check}'=='True'
        Fail  Failed : Application is showing error while saving details
    END
    Log To Console  Passed without error and details saved successfully
    Sleep  5s
    Capture Page Screenshot And Retry If Required