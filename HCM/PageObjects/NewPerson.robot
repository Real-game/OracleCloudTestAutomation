*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/NewPerson.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Go to Hire An Employee Page
    wait and click element  ${href_hire_an_employee}
    Capture Page Screenshot
    Wait Until Page Contains  Hire an Employee: Identification  20s  Hire an employee page is not displayed
    Capture Page Screenshot
