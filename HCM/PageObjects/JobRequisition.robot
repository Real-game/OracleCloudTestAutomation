*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisition.robot

*** Keywords ***
Click Add Requisition Button
    Sleep  3s
    Wait And Click Element  ${add_requisition_button}
    Wait And Verify Page Contains Text  Create Job Requisition  20s  Create Job Requisition page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required