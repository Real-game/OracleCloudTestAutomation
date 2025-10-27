*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/AddToLinkedRequisition.robot

*** Keywords ***

Add to Linked Requisition
    Wait Until Page Contains  Add to Linked Requisition  20
    Click Element  ${requisition_drop_down}
    Sleep  8s
    Click Element  ${requisition_result}
    Sleep  6s
    Click Element  ${save_button}
    Wait Until Page Contains  Details  20