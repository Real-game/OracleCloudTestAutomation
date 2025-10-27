*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/DocumentRecords.robot

*** Keywords ***

View Document Types
    [Arguments]  ${doc_type}
    Sleep  2s
    Wait And Click Element  ${remove_payroll_filter}
    Wait And Click Element  ${remove_expired_filter}
    Wait And Click Element  ${href_show_filters}
    Sleep  2s
    #Wait And Click Element  ${doc_type_drop_down}
    #Wait And Input Text From Input   ${doc_type_input}  ${doc_type}
    Sleep  1s
    #${xpath}=  Catenate  SEPARATOR=  //tr[@data-afr-value='  ${doc_type}  ']
    #Wait And Click Element  xpath: ${xpath}
    Click Element  ${search_input_field_document_records_page}
    Input Text  ${search_input_field_document_records_page}  ${doc_type}
    Sleep  2s
    Click Element  ${search_icon_document_records_page}
    Sleep  2s
    Wait And Click Element  ${view_more_details_link}

Click on show filter
    Wait And Click Element  ${href_show_filters}
    Sleep  2s

Click on Add button in Document record page
    Wait And Click Element  ${add_button}
    Wait And Verify Page Contains Text  Add Document  20s  Add Document page is not displayed
    Capture Page Screenshot And Retry If Required

Select Document type from dropdown
    [Arguments]  ${input}
    Wait And Click Element  ${document_type_dropdown}
    wait until element is visible  ${document_type_value}  5s
    select required value  ${document_type_value}  ${input}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Vaccination Status form dropdown
    [Arguments]  ${input}
    Wait And Click Element  ${vaccination_status_dropdown}
    ${vaccination_status_xpath}=  Catenate  SEPARATOR=  (//span[text()='${input}'])[1]
    wait until element is visible  ${vaccination_status_xpath}  5s
    Wait And Click Element  ${vaccination_status_xpath}

Select fully vaccinated by November dropdwon
    [Arguments]  ${Yes_or_no}
    Wait And Click Element  ${fully_vaccinated_november_dropdown}
    ${fully_vaccination_status_xpath}=  Catenate  SEPARATOR=  (//span[text()='${Yes_or_no}'])[1]
    wait until element is visible  ${fully_vaccination_status_xpath}  5s
    Wait And Click Element  ${fully_vaccination_status_xpath}

Select covid attestation and data provided is correct dropdown
    [Arguments]  ${Yes_or_no}
    Wait And Click Element  ${read_covid_attestation_data_provided}
    ${data_provided_status_xpath}=  Catenate  SEPARATOR=  (//span[text()='${Yes_or_no}'])[1]
    wait until element is visible  ${data_provided_status_xpath}  5s
    Wait And Click Element  ${data_provided_status_xpath}

Upload file in Add Document page
    [Arguments]  ${file}
    IF  "${file}"!=""
        Wait And Click Element  ${Attach_img}
        scroll element into view  ${Attach_file}
        Wait And Click Element  ${Attach_file}
        Sleep  5s
        Attach File  ${file}
        execute javascript  window.scrollTo(0,document.body.scrollHeight)
        Capture Page Screenshot
    END

Click on Submit button
    Wait And Click Element  ${submit_option}
    Sleep  5s
    Capture Page Screenshot
