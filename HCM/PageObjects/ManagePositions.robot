*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ManagePositions.robot

*** Keywords ***


Click on Create
    Wait And Click Element  ${create_btn}
    Sleep  5s
    Capture Page Screenshot

Search Position By Name And Code
    [Arguments]  ${name}  ${code}
    IF  "${name}"!=""
        Wait And Send Keys  ${search_name}  ${name}
    END
    IF  "${code}"!=""
        Wait And Send Keys  ${search_code}  ${code}
    END
    Wait And Click Element  ${search_button}
    Sleep  5s
    Capture Page Screenshot

Select Position By Name
    [Arguments]  ${value}
    Sleep  2s
    wait and click element  link:${value}
    Sleep  5s
    Capture Page Screenshot