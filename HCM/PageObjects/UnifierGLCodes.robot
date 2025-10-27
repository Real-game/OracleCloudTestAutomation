*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierGLCodes.robot

*** Keywords ***
Select GL Codes Frame
    Sleep  3s
    Select Frame  ${gl_code_iframe}
    Sleep  3s

Verify Create Button is not available
    Element Should Not Be Visible  ${gl_code_create_btn}  Create Button is available in GL Codes screen
    Capture Page Screenshot

Open a GL Code
    Double Click Element  ${gl_code_combo_first}
    Sleep  3s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    capture page screenshot

Verify Accept Button is not available
    Element Should Not Be Visible  ${accept_btn}  Accept Button is available in GL Codes screen
    Capture Page Screenshot

Search and verify Cost Center, Location and Account Codes
    [Arguments]  ${code}  ${parameter}
    Wait And Click Element  ${cost_center_search_button}
    Sleep  2s
    Wait And Set Text  ${cost_center_code_search_field}  ${code}
    Sleep  2s
    ${expected_xpath}  CATENATE  //td[@data-index='gen_code_name']//mark[text()='${code}']
    Element Should Be Visible  ${expected_xpath}  ${parameter} ${code} is not present
    Capture Page Screenshot
    Unselect Frame
    Wait And Click Element  ${gl_codes_tab}

Open a specific GL Code
    [Arguments]  ${gl_code}
    Wait And Click Element  ${search_icon}
    Sleep  2s
    Wait And Set Text  ${gl_code_search_field}  ${gl_code}
    Sleep  2s
    Wait And Click Element  ${apply_btn_search}
    Sleep  7s
    Wait And Click Element  ${close_btn_search}
    Sleep  2s
    Capture Page Screenshot
    ${xpath}  CATENATE  //h1[text()='GL Codes']/following::table//td[contains(@data-index,'code_combo')]//div[text()='${gl_code}']
    Double Click Element  ${xpath}
    Sleep  3s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    Capture Page Screenshot

Validate BL Code
    [Arguments]  ${bl_code_ebs}  ${bl_id_ebs}  ${bl_description_ebs}
    Wait Until Page Contains Element  ${gl_code_header}  60s  GL Code is not opened in a new window
    ${bl_code}=  Get Text  ${bl_code_value}
    ${bl_id}=  Get Text  ${bl_ID_value}
    ${bl_description}=  Get Text  ${bl_description_value}
    Should Be Equal  ${bl_code_ebs}  ${bl_code}  Business Line Code is not updated as in EBS
    Should Be Equal  ${bl_id_ebs}  ${bl_id}  Business Line ID is not updated as in EBS
    Should Be Equal  ${bl_description_ebs}  ${bl_description}  Business Line Description is not updated as in EBS
    Capture Page Screenshot

Verify User is Unable to Terminate Record
    Wait And Click Element  ${gl_code_combo_first}
    Wait And Click Element  ${gl_codes_action_btn}
    Sleep  2s
    Wait And Click Element  ${terminate_record_option}
    Unselect Frame
    Sleep  2s
    Element Should Be Visible  ${permission_denied_alert}  User is able to terminate the record
    Capture Page Screenshot

Search and verify Cost Center
    [Arguments]  ${code}
    Wait And Click Element  ${cost_center_search_icon}
    Sleep  2s
    Wait And Set Text  ${cost_center_search_field}  ${code}
    Sleep  2s
    Wait And Click Element  ${apply_btn_search}
    Sleep  7s
    Wait And Click Element  ${close_btn_search}
    Sleep  2s
    Capture Page Screenshot
    ${expected_xpath}  CATENATE  //td[@data-index='gen_code_name']//div[text()='${code}']
    Element Should Be Visible  ${expected_xpath}  Cost Center Code ${code} is not present
    Capture Page Screenshot
    Unselect Frame
    Wait And Click Element  ${gl_codes_tab}

Search and verify Location Code
    [Arguments]  ${code}
    Wait And Click Element  ${location_search_icon}
    Sleep  2s
    Wait And Set Text  ${cost_center_search_field}  ${code}
    Sleep  2s
    Wait And Click Element  ${apply_btn_search}
    Sleep  7s
    Wait And Click Element  ${close_btn_search}
    Sleep  2s
    Capture Page Screenshot
    ${expected_xpath}  CATENATE  //td[@data-index='gen_code_name']//div[text()='${code}']
    Element Should Be Visible  ${expected_xpath}  Location Code ${code} is not present
    Capture Page Screenshot
    Unselect Frame
    Wait And Click Element  ${gl_codes_tab}

Search and verify Account Code
    [Arguments]  ${code}
    Wait And Click Element  ${account_search_icon}
    Sleep  2s
    Wait And Set Text  ${cost_center_search_field}  ${code}
    Sleep  2s
    Wait And Click Element  ${apply_btn_search}
    Sleep  7s
    Wait And Click Element  ${close_btn_search}
    Sleep  2s
    Capture Page Screenshot
    ${expected_xpath}  CATENATE  //td[@data-index='gen_code_name']//div[text()='${code}']
    Element Should Be Visible  ${expected_xpath}  Account Code ${code} is not present
    Capture Page Screenshot
    Unselect Frame
    Wait And Click Element  ${gl_codes_tab}




