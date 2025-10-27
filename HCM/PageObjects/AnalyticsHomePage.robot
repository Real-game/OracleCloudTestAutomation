*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/AnalyticsHomePage.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click On Catalog Link
     Capture Page Screenshot
     Wait And Click Element  ${catalog_link}
     Wait Until Page Contains  Shared Folder  20s  Shared Folder is not displayed
     Capture Page Screenshot