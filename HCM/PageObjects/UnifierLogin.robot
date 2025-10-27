*** Settings ***
Library  Selenium2Library
Library  BuiltIn
Library  ../Keywords/CommonKeywords.py
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/CustomKeywords.robot
Resource  ../Locators/UnifierLogin.robot
Resource  ../PageObjects/Commons.robot

*** Keywords ***
Unifier Login Using
    [Arguments]  ${user_id}
    Set Log Level    NONE
    ${password} =  Get Password  ${user_id}
    Set Log Level    INFO
    Wait Until Page Contains  Please use your Metrolinx Email Address to sign-in  300s  login Page is not displayed
    Login  ${unifier_username}  ${user_id}  ${unifier_password}  ${password}  ${unifier_sign_in}
    Log  User has signed in
    Wait Until Page Contains  Cookies on Primavera Portal  150s  Cookies Alert is not displayed
    Click Element  ${got_it_alert}
    Log  User has answered to the alert
    Sleep  8s
#    ${environment_select}=  Catenate  SEPARATOR=  //ul/li//span[contains(text(),'Train')]
    ${environment_select}=  Catenate  SEPARATOR=  //ul/li//span[contains(text(),'Stage')]
#    ${environment_select}=  Catenate  SEPARATOR=  //ul/li//span[contains(text(),'Production')]
    Wait And Click Element  ${environment_select}
    Sleep  8s
    Wait Until Page Contains  Primavera Unifier  150s  Primavera Unifier app is not displayed
    Click Element  ${primavera_unifier_icon}
    Log  User has clicked the primavera Unifier application icon
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Sleep  10s
    Wait Until Page Contains Element  ${home_icon}  40s  Unifier landing page is not displayed
    Log  User is taken to the landing page of Unifier

Change to Proxy Connection
    Wait Until Page Contains Element  ${home_icon}  30s  Unifier landing page is not displayed
    Wait And Click Element   ${user_profile}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${proxy_dropdown}
    Sleep  3s
    Wait And Click Element   ${proxy_raheel_access}
    Sleep  15s
    Capture Page Screenshot And Retry If Required
    Wait Until Page Contains Element  ${home_icon}  60s  Unifier landing page is not displayed
    Wait And Click Element  ${home_icon}
    Sleep  10s
    Capture Page Screenshot And Retry If Required
