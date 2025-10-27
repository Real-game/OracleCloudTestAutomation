*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Talent.robot

*** Keywords ***

Click on Add in Talent Page
    Wait Until Page Contains  Candidates  20
    Capture Page Screenshot
    Click Element  ${add_button}

Click on Done button in Talent Page
    Wait Until Page Contains  Talent  20
    Click Element  ${done_button}
    Wait Until Element Is Visible  ${yes_pop_up}  20  Yes button pop up is not displayed
    Click Element  ${yes_pop_up}

