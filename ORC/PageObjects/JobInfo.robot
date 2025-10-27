*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobInfo.robot

*** Keywords ***

Verify Job Info and description
    Wait Until Element Is Visible  ${organization_content}  20  Organization input is not displayed
    ${organization_content_value}=  Get Element Attribute  ${organization_content}  innerHTML
    ${job_family_name_content_value}=  Get Element Attribute  ${job_family_name_content}  innerHTML
    ${job_family_grade_content_value}=  Get Element Attribute  ${job_family_grade_content}  innerHTML
    ${location_content_value}=  Get Element Attribute  ${location_content}  innerHTML
    ${posting_date_content_value}=  Get Element Attribute  ${posting_date_content}  innerHTML
    ${internal_job_only_content_value}=  Get Element Attribute  ${internal_job_only_content}  innerHTML
    ${full_time_part_time_content_value}=  Get Element Attribute  ${full_time_part_time_content}  innerHTML
    Capture Page Screenshot
    Should Not Be Empty  ${organization_content_value}
    Should Not Be Empty  ${job_family_name_content_value}
    Should Not Be Empty  ${job_family_grade_content_value}
    Should Not Be Empty  ${location_content_value}
    Should Not Be Empty  ${posting_date_content_value}
    Should Not Be Empty  ${internal_job_only_content_value}
    Should Not Be Empty  ${full_time_part_time_content_value}
    ${matching_elements}=  Get WebElements   ${job_description_content}
    ${length}=  Get Length   ${matching_elements}
    Log To Console   length is ${length}
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Sleep  5s
    Scroll Element Into View  ${done_button}
    Click Element  ${done_button}
    Wait Until Page Contains  Invitations   20

