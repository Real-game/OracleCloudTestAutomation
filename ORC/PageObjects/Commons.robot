*** Settings ***
Resource  ../Locators/Commons.robot
Library  ../Keywords/CommonKeywords.py
Resource  ../Keywords/CommonKeywords.robot


*** Keywords ***
Wait Until Loading
    [Arguments]  ${timeout}
    Wait Until Keyword Succeeds  ${timeout}  3  Wait Until Page Contains Element  ${app_name}
    Wait Until Keyword Succeeds  ${timeout}  3  Wait Until Page Contains Element  ${body_unmasked}


Handle Frame
    Wait Until Element Is Visible    tag:iframe
    Select Frame    tag:iframe



#Click Save Record
#    Wait And Click Element  ${qtip_save}
#    Wait Until Loading  70
#
#Click Submit
#    Wait And Click Element  ${qtip_submit}
#    Wait Until Loading  60
#
#Click On App Name
#    Wait And Click Element  ${app_name}
#
#Click Expand Right
#    Wait And Click Element  ${expand_right}
#    Wait Until Loading  20
#
#Click Split View
#    Wait And Click Element  ${split_view}



