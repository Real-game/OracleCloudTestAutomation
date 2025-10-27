*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/CareerAndPerformance.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Performance
    Wait And Click Element  ${performance_button}
    Wait And Verify Page Contains Text  Performance  20s  Performance page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required
