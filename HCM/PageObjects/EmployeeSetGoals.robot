*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/EmployeeSetGoals.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Click on Performance Goals
    Wait And Click Element  ${performance_goals}
    Sleep  3s
    Capture Page Screenshot And Retry If Required