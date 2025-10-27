*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierOwnedProperties.robot

*** Keywords ***

Click on Create Owned Properties button
    [Arguments]   ${business_origin_drop_down_value}
   # Sleep  20s
   # Select frame  xpath: //iframe[@class='qaframe']
   # Sleep  20s
    Sleep  15s
    Wait Until Element Is Visible  xpath: (//iframe[contains(@src,'/master_log')])[1]  40s  Frame is not displayed
    Select frame  xpath: (//iframe[contains(@src,'/master_log')])[1]
    Sleep  10s
    Wait Until Element Is Visible  ${create_owned_property_button}  30s  Create Owned properties button is not displayed
    Click Element  ${create_owned_property_button}
    Wait Until Element Is Visible  ${select_business_origin_drop_down}  600s  Select business origin drop down is not displayed
    Capture Page Screenshot
    Click Element  ${select_business_origin_drop_down}
    Sleep  15s
    ${xpath}=  Catenate   SEPARATOR=  //span[text()='${business_origin_drop_down_value}']
    Sleep  3s
    Click Element  xpath:${xpath}
    Sleep  5s
    Capture Page Screenshot
    Click Element  ${create_button}

Select an existing owned Property
    [Arguments]   ${owned_property_record_number_value}
    Sleep  10s
    ${list}=   Get Window Handles
    Switch Window  ${list}[1]
    Sleep  4s
    ${checker}=  run keyword and return status    Wait Until Element Is Visible  xpath: (//iframe[contains(@src,'/studio/')])[1]  40s  Frame is not displayed
    IF  '${checker}'=='False'
        ${checker2}=  run keyword and return status    Wait Until Element Is Visible  xpath: (//iframe[contains(@src,'/master_log/')])[1]  40s  Frame2 is not displayed
        IF  '${checker2}'=='True'
            Sleep  2s
            Select frame  xpath: (//iframe[contains(@src,'/master_log/')])[1]
        END
        Capture Page Screenshot And Retry If Required
    ELSE
        Sleep  2s
        Select frame  xpath: (//iframe[contains(@src,'/studio/')])[1]
    END
#    Wait Until Element Is Visible  xpath: (//iframe[contains(@src,'/studio/')])[1]  40s  Frame is not displayed
#    Select frame  xpath: (//iframe[contains(@src,'/studio/')])[1]
    Sleep  10s
    ${owned_property_record_xpath}=  Catenate  SEPARATOR=  //a[text()='${owned_property_record_number_value}']
    Wait Until Element Is Visible  xpath: ${owned_property_record_xpath}  40s  Owned property record is not listed
    Click Element  xpath: ${owned_property_record_xpath}

Click on Create Owned Property BU button
    Sleep  5s
    Wait Until Element Is Visible  xpath: (//iframe[contains(@src,'/studio')])[1]  40s
    Select frame  xpath: (//iframe[contains(@src,'/studio')])[1]
    Sleep  10s
    Wait Until Element Is Visible  ${create_owned_property_bu_button}  60s  Create Owned properties button is not displayed
    Click Element  ${create_owned_property_bu_button}
    Sleep  10s
    Capture Page Screenshot

Extract the copied owned property number
    Sleep  4s
    Wait And Click Element  ${expand_copy_block_icon}
    Wait Until Element Is Visible  ${copied_owned_property_number_input}  150s
    Scroll Element Into View  ${copied_owned_property_number_input}
    ${copy_record_number}=   Get Element Attribute  ${copied_owned_property_number_input}  innerHTML
    RETURN  ${copy_record_number}

Select an existing owned property line item
    [Arguments]   ${owned_property_record_number_value}
    Sleep  10s
    ${list}=   Get Window Handles
    Switch Window  ${list}[1]
    Sleep  10s
    Select Required Frame  xpath: (//iframe[contains(@src,'/studio/')])
    Sleep  10s
    ${owned_property_record_xpath}=  Catenate  SEPARATOR=  (//a[text()='${owned_property_record_number_value}']/parent::div/ancestor::td/preceding-sibling::td)[3]
    Wait Until Element Is Visible  xpath: ${owned_property_record_xpath}  40s  Owned property record is not listed
    Click Element  xpath: ${owned_property_record_xpath}
