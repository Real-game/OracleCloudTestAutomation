*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PerformanceGoals.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click on Add Button
    Wait And Click Element  ${add}
    Sleep  5s
    Capture Page Screenshot