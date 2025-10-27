*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/DocumentRecords.robot
Library  ../Helpers/Helpers.py

*** Keywords ***

View Document Types
    [Arguments]  ${doc_type}
    Sleep  2s
    Wait And Click Element  ${remove_payroll_filter}
    Sleep  5s
    Wait And Click Element  ${remove_expired_filter}
    Sleep  5s
    Wait And Click Element  ${href_show_filters}
    Sleep  5s
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
        Wait Until Page Contains Element  ${Attach_file}  20s  Attach file link is not displayed
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

Clear Document Type Filter
    Sleep  5s
    ${xpath}=  Catenate  SEPARATOR=  //img[contains(@title,'Remove Filter:')]
    scroll element into view  ${xpath}
    ${count}=  get element count  ${xpath}
    Log  ${count}
    ${count}=  Evaluate  ${count}+${1}
    Log  ${count}
    FOR  ${i}  IN RANGE  1  ${count}
        ${xpath_list}=  Catenate  SEPARATOR=  (//img[contains(@title,'Remove Filter:')])[1]
        Wait And Click Element   ${xpath_list}
        Sleep  2s
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on View Document Detail
    ${status}=  run keyword and return status  wait until page contains element  ${view_more_details_link}  10s  Employee has no Document attached
    IF  '${status}'=='True'
        ${xpath_list}=  Catenate  SEPARATOR=  (//a[@title='View More Details'])[1]
        Wait And Click Element  ${xpath_list}
        wait until page contains  Document Details  10s  Document Details not displayed
    ELSE
        FAIL  Employee has no Document attached
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

View Document Attached Date
    ${xpath_list}=  Catenate  SEPARATOR=  (//div[@title='Attachment List']//span)[2]
    scroll element into view   ${xpath_list}
    ${text}=  get text  ${xpath_list}
    Log  ${text}
    ${date}=  getRecordDate  ${text}
    log  ${date}
    ${status}=  checkDate  ${date}
    IF  ${status}==True
        log  Value (${date}) is Date Time Object
    ELSE
        log  Value (${date}) is not Date Time Object
        FAIL
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required
