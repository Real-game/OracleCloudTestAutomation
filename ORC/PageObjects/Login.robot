*** Settings ***
Library  Selenium2Library
Library  BuiltIn
Library  ../Keywords/CommonKeywords.py
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/CustomKeywords.robot
Resource  ../Locators/Login.robot
Resource  ../PageObjects/Commons.robot

*** Keywords ***
Login Using
    [Arguments]  ${user_id}
    Set Log Level    NONE
    ${password} =  Get Password  ${user_id}
    Set Log Level    INFO
#    Log To Console  Password:${password}
#    Wait Until Loading  60
    Login  ${txt_userid}  ${user_id}  ${txt_pass}  ${password}  ${btn_submit}
#    Wait Until Loading  60
    Sleep  3s
