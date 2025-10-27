*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisitions.robot
Resource  ../Locators/JobRequisitionOverview.robot

*** Keywords ***
Click on add button
    click element   ${add_btn}
    Wait Until Page Contains  Create Job Requisition  20s  Create Job Requisition page not found
    Capture Page Screenshot
    Log To Console  Navigated to create job requisition page.

Search requisition
    [Arguments]  ${req_id}
    Clear Hiring Filter
    Wait Then Click And Set Text  ${input_search}   ${req_id}
    Wait And Click Element  ${btn_search}
    Sleep  5s

Search for requisition id
    [Arguments]  ${req_id}
    Clear Hiring Filter
    Wait Then Click And Set Text  ${input_search}   ${req_id}
    Wait And Click Element  ${btn_search}
    Sleep  5s
    Select exact requsition  ${req_id}

Select exact requsition
    [Arguments]  ${search}
    ${count}=  Get Element Count  ${req_title}
    IF  ${count}>=1
       ${matching_elements}=  Get WebElements   ${req_title}
       FOR  ${element}  IN  @{matching_elements}
         ${text}=    Get Text  ${element}
         ${result}=  searchRequsition  ${text}  ${search}
         IF  '${result}'=='True'
            Wait And Click Element  ${element}
            Sleep  20s
            Capture Page Screenshot
            Exit For Loop
         END
       END
    ELSE
        Log To Console  Requisition with ${search} id not found!
    END


Clear Hiring Filter
    ${status}=  Run Keyword And Return Status  element should be visible  ${filter}
    IF  "${status}"=="True"
        Wait And Click Element  ${filter}
        Sleep  3s
    END


Verify requisition status
    [Arguments]  ${req_status}
    Sleep  5s
    ${current_requisition_status}=  Get Element Attribute  ${requisition_status}  innerHTML
    Should Contain  ${current_requisition_status}  ${req_status}
    Log To Console  Requisition is suspended.

Click on the Requisition title
    [Arguments]  ${req_id}
    Search for requisition id  ${req_id}
    Wait Until Element Is Visible  ${detail_link}  90s  Element is not visible


Click on the Candidate Search link
    Sleep  3s
    Wait And Click Element  ${candidate_search}
    Sleep  5s
    capture page screenshot
    Log  Candidate search link is clicked

Search for requisition id without detail link
    [Arguments]  ${req_id}
    Wait And Click Element  ${remove_filter}
    Sleep  2s
    Wait And Send Keys  ${input_search}   ${req_id}
    Wait And Click Element  ${btn_search}
    Sleep  5s
#    Mouse over  ${req_title}
#    Capture Page Screenshot
    ${req_title_xpath}=  Catenate  SEPARATOR=  //a[contains(@title,'${req_id}')]
    Wait And Click Element  ${req_title_xpath}
    Sleep  5s

Click on Notifications
    Wait And Click Element  ${notififcation_icon}
    Sleep  3s

Click on Pending Notification
    Wait And Click Element  ${pending_notification}
    Sleep  10s
    ${handles}=  Get Window Handles
    Switch Window  ${handles}[1]
    Capture Page Screenshot
    Close Window
    Switch Window  ${handles}[0]


Select an open posted requisition
    [Arguments]    ${test_data}
    Wait Until Element Is Visible  ${show_filter_link}  20
    Wait And Click Element  ${show_filter_link}
    Sleep  2s
    Wait Until Element Is Visible  ${phase_drop_down}  20
    Scroll Element Into View  ${phase_drop_down}
    Wait And Click Element  ${phase_drop_down}
    Sleep  2s
    Wait Until Element Is Visible  ${open_phase}  20
    Scroll Element Into View  ${open_phase}
    Wait And Click Element  ${open_phase}
    Log To Console  Open phase is selected
    Sleep  10s
    Wait Until Element Is Visible  ${input_search}  20
    Scroll Element Into View  ${input_search}
    Wait And Send Keys  ${input_search}   ${test_data}
    Log To Console  Requisition title is entered
    Sleep  2s
    Wait And Click Element  ${btn_search}
    Sleep  5s
    Select exact requsition  ${test_data}
    Capture page screenshot

Search for the presence of requisition id
    [Arguments]  ${req_id}
    Clear Hiring Filter
    Wait And Send Keys  ${input_search}   ${req_id}
    Wait And Click Element  ${btn_search}
    Sleep  5s
    ${requisition_title}=  Get Element Attribute  ${req_title}  title
    Log To Console  Requisition title is ${requisition_title}
    Should Contain   ${requisition_title}   ${req_id}
    Log  Requisition title contains the requisition ID

Search for the absence of requisition id
    [Arguments]  ${req_id}
    Clear Hiring Filter
    Wait And Send Keys  ${input_search}   ${req_id}
    Wait And Click Element  ${btn_search}
    Sleep  5s
    Element Should Be Visible   ${no_search_result}
    Log  Requisition title contains no requisition ID

Click on the application link of the searched requisition
    Wait Until Element Is Visible  ${requisition_application_link}  20
    Click Element   ${requisition_application_link}
    Log  Application link is clicked

Clear filter and select the drafted requisition
    Clear Hiring Filter
    Wait Until Element Is Visible  ${first_requisition}  20  First requisition is still not displayed
    Click Element  ${first_requisition}

Click on Candidate Pools
    Wait And Click Element  ${candidate_pool}
    Wait Until Page Contains  Pools
    Sleep  5s
