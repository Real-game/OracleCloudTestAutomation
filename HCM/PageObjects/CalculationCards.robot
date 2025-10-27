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
    Sleep  5s
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

Expand Federal section
    ${federal_expand_check}=  Run Keyword and Return Status  Wait And Verify Page Contains Element  ${federal_expand}  20s  Federal section already expanded
    IF  '${federal_expand_check}'=='True'
        Wait And Click Element  ${federal_expand}
        Sleep  2s
    END
    Capture Page Screenshot And Retry If Required

Check Federal Total Claim amount has value
    scroll element into view  ${federal_total_claim_amount_value}
    Wait And Verify Page Contains Element  ${federal_total_claim_amount_value}  20s  Federal Total Claim amount value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Expand Regional section
    ${regional_expand_check}=  Run Keyword and Return Status  ELEMENT SHOULD BE VISIBLE  ${regional_expand}  Regional section already expanded
    IF  '${regional_expand_check}'=='True'
        Wait And Click Element  ${regional_expand}
        Sleep  2s
    END
    Capture Page Screenshot And Retry If Required

Check Regional Total Claim amount has value
    scroll element into view  ${regional_total_claim_amount_value}
    Wait And Verify Page Contains Element  ${regional_total_claim_amount_value}  20s  Regional Total Claim amount value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Expand Association section
    Sleep  5s
    ${association_expand_check}=  Run Keyword and Return Status  ELEMENT SHOULD BE VISIBLE  ${association_expand}  Associations section already expanded
    IF  '${association_expand_check}'=='True'
        Wait And Click Element  ${association_expand}
        Sleep  10s
    END
    Capture Page Screenshot And Retry If Required

Check Association Tax Reporting Unit has value
    scroll element into view  ${association_tax_report_unit_value}
    Wait And Verify Page Contains Element  ${association_tax_report_unit_value}  20s  Associations Tax Reporting Unit value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Association Assignment has value
    scroll element into view  ${association_assignment_value}
    Wait And Verify Page Contains Element  ${association_assignment_value}  20s  Associations Assignment value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Check Association Province of Employment has value
    scroll element into view  ${association_province_of_employment_value}
    Wait And Verify Page Contains Element  ${association_province_of_employment_value}  20s  Associations Province of Employment value is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Page has Absences Card
    Wait And Verify Page Contains Element  ${absence_card}  10s  Absences card not displayed
    scroll element into view  ${absence_card}
    Capture Page Screenshot And Retry If Required