*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ManageAbsencesAndEntitlements.robot

*** Keywords ***

Click on Add an Absence Record
    ${check}=  Run Keyword And Return Status  Wait Until Page Contains Element  xpath: //div[contains(@id,'ATtb1')][@class='xza'][1]  50s  Add option is not displayed
    IF  '${check}'=='True'
        Click Element  xpath: //div[contains(@id,'ATtb1')][@class='xza'][1]
    END
    Click Element  ${add_absence_record}
    Wait Until Page Contains  Absence Administration  20s  Absence Administration page is not displayed
    Capture Page Screenshot

    