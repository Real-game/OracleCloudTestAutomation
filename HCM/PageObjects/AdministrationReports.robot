*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/AdministrationReports.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Select Compensation Plan Cycle as
    [Arguments]  ${comp_plan}
    Wait And Click Element  ${compensation_plan_cycle_dropdown}
    Sleep  2s
    IF  "${comp_plan}"!=""
        Wait And Click Element  xpath: //li[text()= "${comp_plan}"]
    END
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Generate Real Time Statements
    Wait And Click Element  ${general_real_time_statements}
    Sleep  3s
    Capture Page Screenshot And Retry If Required