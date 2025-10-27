*** Settings ***
Library  String
Library   ../Keywords/CommonKeywords.py
#Library    FakerLibrary
Library  AutoItLibrary
Library  OperatingSystem
Resource  ../Locators/Logout.robot
Resource  ../Helpers/Config.robot

*** Keywords ***
Launch Browser
    [Arguments]  ${URL}  ${Browser}
    Run Keyword If  '${Browser}' == 'Chrome'  Launch Chrome  ${URL}
    Run Keyword If  '${Browser}' == 'Firefox'  Launch Firefox  ${URL}

Launch Chrome
    [Arguments]  ${URL}
    ${ChromeOptions} =     Evaluate     sys.modules['selenium.webdriver'].ChromeOptions()    sys, selenium.webdriver
    Call Method    ${ChromeOptions}     add_argument    --disable-extensions
    Call Method    ${ChromeOptions}     add_argument    --start-maximized
    Call Method    ${ChromeOptions}     add_argument    --incognito
    Call Method    ${ChromeOptions}     add_argument    --disable-notifications
#    Call Method    ${ChromeOptions}     add_argument    --disable-popup-blocking
#    call Method    ${ChromeOptions}     add_argument    --ignore-certificate-errors
#    call Method    ${ChromeOptions}     add_argument    --ignore-ssl-errors
    Call Method    ${ChromeOptions}     add_experimental_option      useAutomationExtension    ${FALSE}
#    ${Options}=     Call Method         ${ChromeOptions}    to_capabilities
#    Open Browser  ${URL}  Chrome    desired_capabilities=${Options}
    Open Browser  ${URL}  Chrome    options=${ChromeOptions}

Launch Firefox
    [Arguments]  ${URL}
    Log To Console  'Firefox launch'


End Web Test
   Close All Browsers

Launch ORC
    [Arguments]  ${file_name}
    ${sauce_url}=  createSauceURL  ${sauce_username}  ${sauce_access_key}
    ${cap}=  getCapabilities  ${sauce_execution_browserName}  ${sauce_execution_browserVersion}  ${sauce_execution_platformName}  ${sauce_execution_screenResolution}  ${file_name}
    Open browser  ${URL}  remote_url=${sauce_url}   desired_capabilities=${cap}

Launch ORC Analytics
    [Arguments]  ${file_name}
    ${sauce_url}=  createSauceURL  ${sauce_username}  ${sauce_access_key}
    ${cap}=  getCapabilities  ${sauce_execution_browserName}  ${sauce_execution_browserVersion}  ${sauce_execution_platformName}  ${sauce_execution_screenResolution}  ${file_name}
    Open browser  ${URL_Analytics}  remote_url=${sauce_url}   desired_capabilities=${cap}

Launch ORC ExternalSite
    [Arguments]  ${file_name}
    ${sauce_url}=  createSauceURL  ${sauce_username}  ${sauce_access_key}
    ${cap}=  getCapabilities  ${sauce_execution_browserName}  ${sauce_execution_browserVersion}  ${sauce_execution_platformName}  ${sauce_execution_screenResolution}  ${file_name}
    Open browser  ${ext_URL}  remote_url=${sauce_url}   desired_capabilities=${cap}

Login
    [Arguments]  ${txt_userid}  ${user_id}  ${txt_pass}  ${password}  ${btn_submit}
    Wait And Set Text  ${txt_userid}  ${user_id}
    Set Log Level    NONE
    Wait And Set Text  ${txt_pass}  ${password}
    Set Log Level    INFO
    Sleep  2s
    Click Element  ${btn_submit}
    Capture Page Screenshot

Logout
    ${check}=    run keyword and return status   element should be visible    ${profile_downarrow}
    IF  "${check}"=="True"
        Wait And Click Element  ${profile_downarrow}
    ELSE
        Wait And Click Element    xpath: //oj-avatar
    END
    Sleep    2s
    Wait And Click Element  ${btn_signout}
    Sleep    2s
    ${check}=  Run Keyword And Return Status  Page Should Contain  Warning
    IF  ${check}==True
        ${check1}=  Run Keyword And Return Status  Wait And Click Element  xpath://button[text()="Yes"]
        IF  ${check1}==False
            Wait And Click Element  xpath: //div[text()='Warning']//ancestor::td//following-sibling::td//span//button[text()='Yes']
            Wait Until Element Is Visible  ${signout_confirm}  20  Signout Confirm is not displayed
        END
    END
    Wait Until Element Is Visible  ${signout_confirm}  20  Signout Confirm is not displayed
    Click Element  ${signout_confirm}
    Sleep  5s
    Capture Page Screenshot

Notification Logout
    Wait And Click Element  ${profileearry_downarrow}
    Wait And Click Element  ${btn_signout}
    Wait And Click Element  ${signout_confirm}
    Sleep  5s
    Capture Page Screenshot

Assigned Journeys Logout
    Wait And Click Element  ${journeys_profile_downarrow}
    Wait And Click Element  ${btn_signout}
    Wait And Click Element  ${signout_confirm}
    Sleep  5s
    Capture Page Screenshot


Wait And Set Text
    [Arguments]  ${locator}  ${value}
    Wait Until Element Is Visible  ${locator}  20
    Input Text  ${locator}  ${value}

Wait And Click Element
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  20
    Click Element      ${locator}


Wait And Double Click Element
    [Arguments]  ${locator}
    Wait Until Element Is Visible  ${locator}  10
    Double Click Element  ${locator}


Wait And Select From DropDown
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  timeout=10
    Select From List By Value	${field}  ${value}

Wait Then Click And Set Text
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  10
    Click Element  ${field}
    Sleep    1s
    Press Keys	${field}  CTRL+a
    Sleep    1s
    Press Keys	${field}  BACKSPACE
    Sleep  1s
    Input Text  ${field}  ${value}


Wait And Send Keys
    [Arguments]  ${field}  ${keys}
    Wait Until Element Is Visible  ${field}  10
    Press Keys	${field}  ${keys}

Wait And Get Text
    [Arguments]  ${field}
    Wait Until Element Is Visible  ${field}  10
    ${text}=  Get Text  ${field}
    RETURN    ${text}


Wait And Get Value
    [Arguments]  ${field}
    Wait Until Element Is Visible  ${field}  10
    ${value}=  Get Value  ${field}
    RETURN    ${value}


Assert Field Value
    [Arguments]  ${field}  ${value}
    Log To Console  ${field}_${value}
    Wait Until Page Contains Element  ${field}
    Element Attribute Value Should Be  ${field}  value  ${value}


Copy Value To Clipboard
    [Arguments]  ${field}
    Wait Until Element Is Visible  ${field}
    Click Element  ${field}
    Press Keys	${field}  CTRL+a
    Press Keys	${field}  CTRL+c

Assert Field Value from clipboard
    [Arguments]  ${field}  ${value}
    Copy Value To Clipboard  ${field}
    ${result}=  Get Clipboard Value
    Should Be True  '${value}'=='${result}'


FakerLibrary Words Generation
    ${word}=    FakerLibrary.Unix Time
    Log To Console    words: ${word}
    RETURN    ${word}


Attach File
    [Arguments]  ${file}
    IF  '${vm_execution_flag}'=='True'
        ${file_path}=  Catenate  SEPARATOR=\\  C:\\Automation\  ${file}
    ELSE
        ${base_path}=  path
        ${file_path}=  Catenate  SEPARATOR=\\  ${base_path}  ${file}
    END
    Wait For Active Window  Open
    Sleep   5s
    Send    ${file_path}
    Sleep   5s
    Control Click   Open    &Open   [CLASS:Button; INSTANCE:1]  LEFT
    Sleep  10s

Select Required Value
    [Arguments]  ${xpath}  ${value}
    Sleep  2s
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        IF  '${text}'=='${value}'
            Wait And Click Element  ${element}
            Exit For Loop
        END
    END

Select Required Value which contains Text
    [Arguments]  ${xpath}  ${value}
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Element Attribute  ${element}  innerHTML
        Run Keyword If    '${value}' in '${text}'    Click Element    ${element}
        Run Keyword If    '${value}' in '${text}'    Exit For Loop
    END

Select Required Value with Text
    [Arguments]  ${xpath}  ${value}
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Element Attribute  ${element}  innerHTML
        IF  '${text}'=='${value}'
            Click Element  ${element}
            Exit For Loop
        END
    END

Wait And Verify Page Contains Text
    [Arguments]  ${text}  ${time_out}  ${error_message}
    ${checker}=  RUN KEYWORD And Return Status  Wait Until Page Contains    ${text}  ${time_out}  ${error_message}
    IF  '${checker}' == 'False'
        Wait Until Page Contains    ${text}  ${time_out}  ${error_message}
    END

Wait Then delete And Set Text
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  10
    Click Element  ${field}
    Press Keys	${field}  DELETE
    Sleep  1s
    Wait And Send Keys  ${field}  ${value}

Wait and clear and send keys
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  10
    Click Element  ${field}
    Press Keys	${field}  CTRL+a
    Press Keys	${field}  BACKSPACE
    Sleep  1s
    Input text  ${field}  ${value}
    Sleep  2s
    Scroll element into view  ${field}
    Wait Then delete And Set Text  ${field}  ${value}