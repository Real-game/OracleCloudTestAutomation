*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CurrentJobsJobApplication.robot

*** Keywords ***

Withdraw an active job application
    [Arguments]  ${requisition_id}
    ${withdraw_application_action_xpath}=  Catenate  SEPARATOR=    //a[contains(@title,'(  ${requisition_id}  )')]//ancestor::td[contains(@id,'PSEgc5')]/following-sibling::td//a[@title='Actions']
    Wait Until Element Is Visible   xpath: ${withdraw_application_action_xpath}   20   Actions link for the requisition ID ${requisition_id} is not displayed
    Scroll Element Into View  xpath: ${withdraw_application_action_xpath}
    Click Element  xpath: ${withdraw_application_action_xpath}
    Capture Page Screenshot
    Wait And Click Element  ${withdraw_application}
    Sleep  20s
    Wait Until Element Is Visible  ${withdraw_warning_message}  20  Withdraw warning message is not displayed
    Capture Page Screenshot
    Click Element  ${warning_ok_button}

Verify the requisition is shown as withdrawn after withdrawn
    [Arguments]  ${requisition_id}
    ${withdrawn_xpath}=  Catenate  SEPARATOR=  //a[contains(@title,'(   ${requisition_id}    )')]/parent::div//following-sibling::div//span[text()[contains(.,'Withdrawn')]]
    Wait Until Element Is Visible  xpath: ${withdrawn_xpath}    20  Withdrawn message is not displayed
    Scroll Element Into View  xpath: ${withdrawn_xpath}
    Capture Page Screenshot
    Sleep  3s

Navigate back in Current jobs job application page
    Scroll Element Into View  ${done_button}
    Click Element  ${done_button}
    Wait Until Page Contains  Current Jobs  20  Current jobs page is not displayed