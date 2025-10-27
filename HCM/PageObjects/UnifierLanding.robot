*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierLanding.robot

*** Variables ***
${var}   1

*** Keywords ***

Create a Project
    [Arguments]  ${property_name_value}
    #Wait Until Page Contains  Notification  300s  MX Company option is not displayed on the Unifier Landing page
    Click Element  ${mx_company_link}
    Click Element  ${switch_admin_icon}
    Capture Page Screenshot
    Wait Until Page Contains  Company Sponsored Shells  20s  Company Sponsored shells text is not displayed
    Sleep  10s
    Click Element  ${company_sponsored_shell_link}
    Wait Until Page Contains  MX Properties  20s  MX Properties is not displayed
    Click Element  ${mx_properties_link}
    Sleep  10s
    Select Frame  class: qaframe
    Sleep  10s
    Wait Until Page Contains  Property Name  80s  MX Properties link is not displayed
    #Wait Until Page Contains  Current View:  80s  MX Properties link is not displayed
    Click Element  ${find_link}
    #Unselect Frame
    Sleep  10s
    #Wait Until Page Contains  Form:  20s  Find pop up is not displayed
    Click Element  ${property_name_input}
    Input Text  ${property_name_input}  ${property_name_value}
    Sleep  2s
    Click Element  ${property_search_button}
    ${xpath}=  Catenate  SEPARATOR=   //td/nobr[text()='${property_name_value}']
    Wait Until Page Contains Element  xpath: ${xpath}  90s  Property name is not listed after searching for the property name
    Click Element  xpath: ${xpath}
    Sleep  2s
    Click Element  ${copy_link}
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Sleep  2s
    Wait Until Page Contains  Select MX Properties  20s  Select MX Properties pop up is not displayed
    @{check_list}=  Get WebElements  ${check_box_list}
    FOR  ${element}  IN  @{check_list}
         ${attribute_value}=  Get Element Attribute  ${element}  value
         Log To Console  Attribute value is ${attribute_value}
         Click Element  ${element}
         Exit For Loop If  '${attribute_value}'=='userDefineReport'
    END
    Sleep  3s
    Click Element  ${mx_property_template}
    Sleep  2s
    Click Element  ${ok_button}
    Sleep  10s


Click on home icon in landing Page
    Capture Page Screenshot
    Wait Until Page Contains Element  ${home_icon}  60s  Home icon is not displayed
    Click Element  ${home_icon}
    Sleep  5s
    Capture Page Screenshot



