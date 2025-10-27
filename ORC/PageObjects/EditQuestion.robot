*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/EditQuestion.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Edit Score
    [Arguments]  ${description}  ${value}
    Sleep  5s
    Mouse Over  ${score_input}
    ${score_input}=  Catenate  SEPARATOR=  //input[@value="${description}"]/following::input[1]
#    ${xpath}=  formXpath  ${response_desc_temp}  ${description}
    Wait Then Click And Set Text  ${score_input}  ${value}
    Capture Page Screenshot

Click on Save and Close
    Wait And Click Element  ${save_btn}
    Sleep  5s
    Capture Page Screenshot
    Wait And Click Element  ${ok_btn}
    Sleep   5s
    Capture Page Screenshot