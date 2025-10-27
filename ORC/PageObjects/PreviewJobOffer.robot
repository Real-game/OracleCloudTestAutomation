*** Settings ***
Resource  ../Locators/PreviewJobOffer.robot
Resource  ../Keywords/CommonKeywords.robot
Library  Selenium2Library

*** Keywords ***
Verify Preview Job Offer Page
    Sleep  8s
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Select Frame  ${iframe_title}
    Wait Until Page Contains  Accept  50s  Accept button is not displayed
    Execute javascript  window.scrollTo(0,document.body.scrollHeight)
    ${count}=  Get Element Count  ${accept_button}
    IF  '${count}'=='1'
        Log  Accept button is displayed
    ELSE
        Fail  Accept button is not displayed
    END
    Unselect Frame
    Sleep  6s

Click on back button in Preview offer page
    Click Element  ${back button}
    Sleep  2s