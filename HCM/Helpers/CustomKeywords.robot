*** Settings ***
Library  Selenium2Library
Library  String
Resource  ../Keywords/CommonKeywords.robot
Variables  Helpers.py

*** Keywords ***

Element Has Required Icon
    [Arguments]  ${loc}
    Element Attribute Value Should Be  ${loc}  aria-label    TS_ISSUES


Close Current Window And Logout
    Close Window
    Switch Window  MAIN
    Logout


Scroll To Element
    [Arguments]  ${locator}
    ${x}=        Get Horizontal Position  ${locator}
    ${y}=        Get Vertical Position    ${locator}
    Execute Javascript  window.scrollTo(${x}, ${y})

Get Value From Field
    [Arguments]  ${field}
    ${name}=  Get Name From Name Selector  ${field}
    ${return}=  Execute Javascript  document.getElementsByName('${name}')[0].value
    RETURN  ${return}


