*** Settings ***
Resource  ../../Keywords/CommonKeywords.robot
Resource  ../../Helpers/SetupAndTeardown.robot
Resource  ../../PageObjects/Login.robot



*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***


*** Test Cases ***

Scenario: Oracle HCM login
    Login Using  HR_USER
#    And Click On Hourly TS
#    And Enter Hourly_ts Employee  00570
#    And Click Load Button
#
#    ${size}=    Get Length  ${Days}
#    FOR  ${i}    IN RANGE       ${size}
#        log to console   ${Days}[${i}]
#        Click Pencil Icon  ${Days}[${i}]
#        Select Hourly Absence_Training
#        Enter Time Code     BER
#        Enter Hourly Absence Override Comment    BER
#        Click Absence Save
#        Unselect Frame
#        Select Frame   ${frame_show_edit}
#    END
#
#    And Select Frame   ${frame_code_summ}
#    ${list}=     Review Code Summary
#    log to console   ${list}
#    Lists Should Be Equal  ${list}  ${data}
#    And Unselect Frame
#    And Select Frame    ${frame_show_edit}
#    And Click Show Edits Button
#    And Delete Multiple     0
#    And Click Clock Save
    And Log To Console  DONE