*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/FirstRoundInterview.robot

*** Keywords ***

Click on Add button in First Round Interview page
    Wait Until Element Is Visible    ${fri_add_button}      20     Add button is not displayed
    Capture Page Screenshot
    Click Element   ${fri_add_button}
    Sleep  3s
    ${checker}=  Run Keyword And Return Status  Page Should Contain Element  xpath: //div[@title='Create Interview']
    IF  "${checker}"=="False"
        Wait And Click Element  ${fri_add_button}
        Sleep  3s
    END


Click on back button in First Round Interview page
    Wait Until Element Is Visible    ${back_button}      60     Back button is not displayed
    Capture Page Screenshot
    Click Element   ${back_button}





