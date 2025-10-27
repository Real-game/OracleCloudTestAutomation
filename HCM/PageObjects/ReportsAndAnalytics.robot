*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ReportsAndAnalytics.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Browse Catalog Button
    Wait And Click Element  ${browse_catalog_link}
    Sleep  10s
    wait until page contains  Catalog  20s  Catalog page not found
    Switch Window  title:Oracle Transactional Business Intelligence Catalog  60s
    Sleep  3s
    capture page screenshot