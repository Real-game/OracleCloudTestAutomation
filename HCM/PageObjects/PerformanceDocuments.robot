*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PerformanceDocuments.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Search for Performance Document for a Person
    [Arguments]  ${person_number}
    Click Element  ${search_input_field}
    Input Text  ${search_input_field}  ${person_number}
    Sleep  2s
    Click Element  ${search_icon}
    Sleep  40s
