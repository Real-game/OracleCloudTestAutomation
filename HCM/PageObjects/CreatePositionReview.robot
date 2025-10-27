*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreatePositionReview.robot

*** Keywords ***

Review Details And Submit
    [Arguments]  ${data}  ${common_data}
    element should contain  ${review_effective_start_date}  ${data}[Effective Start Date]
    element should contain  ${review_business_unit}     ${common_data}[Business Unit]
    element should contain  ${review_name}    ${common_data}[Position Name]
    element should contain  ${review_code}    ${common_data}[Position Code]
    element should contain  ${review_status}   ${data}[Status]
    element should contain  ${review_department}  ${data}[Department]
    element should contain  ${review_job}  ${data}[Job]
    element should contain  ${review_full_part_time}  ${data}[Full Time or Part Time]
    element should contain  ${review_regular_temporary}  ${data}[Regular or Temporary]
    element should contain  ${review_org_chart_assistant}  ${data}[Org Chart is Assistant]
    element should contain  ${review_hiring_status}   ${data}[Hiring Status]
    element should contain  ${review_type}  ${data}[Type]
    element should contain  ${review_FTE}  ${data}[FTE]
    element should contain  ${review_head_count}  ${data}[Head Count]
    element should contain  ${review_overlap_allowed}  ${data}[Overlap Allowed]
    reload page
    Sleep  5s
    Wait And Click Element  ${submit_button}
    Sleep  5s
    Capture Page Screenshot

Select Warning Yes
    Sleep  5s
    page should contain button  ${warning_button_Yes}
    Wait And Click Element  ${warning_button_Yes}
    Sleep  5s
    Capture Page Screenshot

Confirm Message
    Wait And Click Element  ${confirm_button}
    Sleep  5s
    Capture Page Screenshot