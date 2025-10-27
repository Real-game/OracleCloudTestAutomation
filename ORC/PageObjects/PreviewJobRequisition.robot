*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PreviewJobRequisition.robot

*** Keywords ***

Verify Preview Page
    Sleep  5s
    ${preview_title_message}=  Get Element Attribute  ${preview_title}  innerHTML
    Should Contain  ${preview_title_message}  Preview
    Log  Preview page is displayed
    Element Should Be Visible  ${job_info}
    Log  Job info is displayed in the Preview page
    Wait And Click Element  ${back_button}
    Sleep  4s
    Wait And Click Element  ${back_button}
    Sleep  4s
