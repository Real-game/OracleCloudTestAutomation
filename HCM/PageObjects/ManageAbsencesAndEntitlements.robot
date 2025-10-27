*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ManageAbsencesAndEntitlements.robot

*** Keywords ***

Click on Add an Absence Record
    Sleep    5s
    ${check}=  Run Keyword And Return Status  wait and click element    xpath: //div[contains(@id,'ctb1')][@class='xeq'][1]
    IF  '${check}'=='False'
        wait and click element    ${option_expand}
        Sleep    2s
        Click Element  xpath: //div[contains(@id,'ctb1')][@class='xeq'][1]
        Sleep    2s
    ELSE
        Sleep    2s
        Click Element  ${add_absence_record}
    END
    Wait Until Page Contains  Absence Administration  20s  Absence Administration page is not displayed
    Capture Page Screenshot

    