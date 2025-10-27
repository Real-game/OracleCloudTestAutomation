*** Settings ***
Library  String
Library  Selenium2Library
Library   ../Keywords/CommonKeywords.py
#Library    FakerLibrary
Library    AutoItLibrary
Library    DateTime
#Library    ConvertDate
Resource  ../Locators/Logout.robot
Library  ../Helpers/Helpers.py
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
    Call Method    ${ChromeOptions}     add_argument    --disable-popup-blocking
    call Method    ${ChromeOptions}     add_argument    --ignore-certificate-errors
    call Method    ${ChromeOptions}     add_argument    --ignore-ssl-errors
    Call Method    ${ChromeOptions}     add_experimental_option      useAutomationExtension    ${FALSE}
    ${Options}=     Call Method         ${ChromeOptions}    to_capabilities
    Open Browser  ${URL}  Chrome    options=${ChromeOptions}
#    desired_capabilities=${Options}


Launch Firefox
    [Arguments]  ${URL}
    Log To Console  'Firefox launch'

Launch HCM
    [Arguments]  ${file_name}
    ${sauce_url}=  createSauceURL  ${sauce_username}  ${sauce_access_key}
    ${cap}=  getCapabilities  ${sauce_execution_browserName}  ${sauce_execution_browserVersion}  ${sauce_execution_platformName}  ${sauce_execution_screenResolution}  ${file_name}
    Open browser  ${URL}  remote_url=${sauce_url}   desired_capabilities=${cap}

Launch HCM Analytics
    [Arguments]  ${file_name}
    ${sauce_url}=  createSauceURL  ${sauce_username}  ${sauce_access_key}
    ${cap}=  getCapabilities  ${sauce_execution_browserName}  ${sauce_execution_browserVersion}  ${sauce_execution_platformName}  ${sauce_execution_screenResolution}  ${file_name}
    Open browser  ${URL_Analytics}  remote_url=${sauce_url}   desired_capabilities=${cap}

End Web Test
   Close All Browsers

Login
    [Arguments]  ${txt_userid}  ${user_id}  ${txt_pass}  ${password}  ${btn_submit}
    Wait And Set Text  ${txt_userid}  ${user_id}
    Set Log Level    NONE
    Wait And Set Text  ${txt_pass}  ${password}
    Set Log Level    INFO
    Wait And Click Element  ${btn_submit}

Logout
    Wait And Click Element  ${profile_downarrow}
    Wait And Click Element  ${btn_signout}
    ${check}=  Run Keyword And Return Status  Page Should Contain  Warning
    IF  ${check}==True
        ${check1}=  Run Keyword And Return Status  Wait And Click Element  xpath://button[text()="Yes"]
        IF  ${check1}==False
            Wait And Click Element  xpath: //div[text()='Warning']//ancestor::td//following-sibling::td//span//button[text()='Yes']
        END
    END
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
    Press Keys	${field}  CTRL+a
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
    RETURN  ${text}


Wait And Get Value
    [Arguments]  ${field}
    Wait Until Element Is Visible  ${field}  10
    ${value}=  Get Value  ${field}
    RETURN  ${value}


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
    RETURN  ${word}

Attach File
    [Arguments]  ${file}
    Set Global Variable  ${base_path_directory}  ${CURDIR}
    ${base_path}=  Fetch From Left  ${base_path_directory}  Keywords
    ${file_path}=  Catenate  SEPARATOR=  ${base_path}  TestData\\  ${file}
    Wait For Active Window  Open
    Send    ${file_path}
    Sleep   5s
    Control Click   Open    &Open   [CLASS:Button; INSTANCE:1]  LEFT
    Sleep  10s

Select Required Value
    [Arguments]  ${xpath}  ${value}
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        IF  '${text}'=='${value}'
            Wait And Click Element  ${element}
            Exit For Loop
        END
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


Wait And Input Text From Input
    [Arguments]   ${xpath}  ${value}
     Wait Until Element Is Visible  ${xpath}   20s   Element Is Not Visible
     #Sleep  2s
     Click Element  ${xpath}
     IF  '${value}' != ""
         Sleep  2s
         Input Text  ${xpath}  ${value}
     END

Wait And Select Value From Input
    [Arguments]  ${xpath}  ${value}
    IF  '${value}' != ""
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
    Sleep  1s
        ${text}=    Get Element Attribute  ${element}  innerHTML
        Log  text is ${text} and value is ${value}
        IF  '${text}'=='${value}'
            Click Element  ${element}
            Sleep  1s
            Exit For Loop
        END
    END
    END

Wait And Select Containing Value From Input
    [Arguments]  ${xpath}  ${value}
    IF  '${value}' != ""
    ${matching_elements}=  Get WebElements   ${xpath}
    FOR  ${element}  IN  @{matching_elements}
    Sleep  3s
        ${text}=    Get Element Attribute  ${element}  innerHTML
        ${check}=   Run Keyword And Return Status  Should Contain  ${text}  ${value}
        IF  "${check}"=="True"
            Click Element  ${element}
            Sleep  1s
            Exit For Loop
        END
    END
    END

Wait And Verify Page Contains Text
    [Arguments]  ${text}  ${time_out}  ${error_message}
    ${checker}=  RUN KEYWORD And Return Status  Wait Until Page Contains    ${text}  ${time_out}  ${error_message}
    IF  '${checker}' == 'False'
        Wait Until Page Contains    ${text}  ${time_out}  ${error_message}
    END

Capture Page Screenshot And Retry If Required
    ${checker}=  RUN KEYWORD And Return Status  capture page screenshot
    IF  '${checker}' == 'False'
        ${checker_again}=  RUN KEYWORD And Return Status  capture page screenshot
        IF  '${checker_again}' == 'False'
            capture page screenshot
        END
    END

Wait Then delete And Set Text
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  10
    Click Element  ${field}
    Press Keys	${field}  DELETE
    Sleep  1s
    Wait And Send Keys  ${field}  ${value}

Wait And Verify Page Contains Element
    [Arguments]  ${text}  ${time_out}  ${error_message}
    ${checker}=  RUN KEYWORD And Return Status  Wait Until Page Contains Element   ${text}  ${time_out}  ${error_message}
    IF  '${checker}' == 'False'
        Wait Until Page Contains Element   ${text}  ${time_out}  ${error_message}
    END

Logout From Profile
    Wait And Click Element  ${profile_image}
    Wait And Click Element  ${btn_signout}
    Wait And Click Element  ${signout_confirm}
    Sleep  5s
    Capture Page Screenshot

Verify Page Has Hyperlink
    [Arguments]  ${text}
    Wait Until Page Contains  ${text}  20s  ${text} is not displayed
    ${xpath}=   Catenate  SEPARATOR=  //a[text()='${text}']
    Page Should Contain Element  xpath:${xpath}
    ${attribute_value}=  Get Element Attribute  xpath:${xpath}  href
    Capture Page Screenshot and Retry If Required
    IF  '${attribute_value}'==""
        Fail  Link ${text} has broken hyperlink
    END

Get incremented Date
    [Arguments]  ${days}
    ${incremented_date}=   DateTime.Get Current Date    increment=${days} days
    ${incremented_date} =  Convert Date  ${incremented_date}  result_format=%d/%m/%Y
    RETURN  ${incremented_date}

Get Text Count with tag
    [Arguments]  ${tag}  ${text}
    ${count}=  get element count  xpath: //${tag}\[text()="${text}"]
    RETURN  ${count}

Wait And Verify Text Value
    [Arguments]  ${element}  ${expected_text_value}
    IF  '${expected_text_value}'!=''
        Wait Until Element Is Visible  ${element}
        Scroll Element Into View  ${element}
        ${actual_text_value}=  Get Element Attribute  ${element}  innerHTML
        ${check}=  Run Keyword And Return Status  Should be Equal  ${expected_text_value}  ${actual_text_value}
        IF  '${check}'=='False'
            Capture Page Screenshot
            Fail  Expected text is ${expected_text_value} and actual text is ${actual_text_value}
        END
    END

Select Required Frame
    [Arguments]  ${xpath}
    ${list}=  Get WebElements  ${xpath}
    ${count}=  Get Length  ${list}
    FOR  ${element}  IN  @{list}
        ${check}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${element}  15s
        IF  '${check}'=='True'
            Select Frame  ${element}
            Exit For Loop
        END
    END

Click Required Element
    [Arguments]  ${xpath}
    ${list}=  Get WebElements  ${xpath}
    ${count}=  Get Length  ${list}
    FOR  ${element}  IN  @{list}
        ${check}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${element}  15s
        IF  '${check}'=='True'
            Scroll element into view  ${element}
            wait and click element  ${element}
            Exit For Loop
        END
    END

Verify the element presence
    [Arguments]  ${xpath}
    ${check}=  Set Variable  False
    ${list}=  Get WebElements  ${xpath}
    ${count}=  Get Length  ${list}
    FOR  ${element}  IN  @{list}
        ${check_value}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${element}  15s
        IF  '${check_value}'=='True'
            ${check}=  Set Variable  True
            Exit For Loop
        END
    END
    RETURN  ${check}

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

Wait Then Click And Clear And Set Text
    [Arguments]  ${field}  ${value}
    Wait Until Element Is Visible  ${field}  10
    Click Element  ${field}
    Press Keys	${field}  CTRL+a
    Sleep    1s
    Press Keys	${field}  DELETE
    Sleep  1s
    Input Text  ${field}  ${value}