*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/FirstRoundInterview.robot

*** Keywords ***

Click on Add button in First Round Interview page
    Wait Until Element Is Visible    ${fri_add_button}      20     Add button is not displayed
    Capture Page Screenshot
    Wait and Click Element   ${fri_add_button}
    Sleep    2s
    ${checker}=    run keyword and return status    page should contain   ${create_interview_title}
    IF    '${checker}'=='False'
         Wait and click element    ${fri_add_button}
         Sleep    2s
    END
    Sleep    3s

Click on back button in First Round Interview page
    Wait Until Element Is Visible    ${back_button}      60     Back button is not displayed
    Capture Page Screenshot
    Click Element   ${back_button}





