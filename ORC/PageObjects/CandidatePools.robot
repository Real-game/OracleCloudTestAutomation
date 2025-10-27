*** Settings ***
Library  ../Helpers/Helpers.py
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CandidatePools.robot

*** Keywords ***
Create Candidate Pool
    [Arguments]  ${name}  ${type}  ${oname}  ${loc}  ${jobfamily}
    Wait And Click Element  ${cp_add_btn}
    Wait Until Page Contains  Create Candidate Pool  30s
    Wait And Set Text  ${cp_poolname}  ${name}
    IF  "${type}"=="Shared"
        Select Required Value  ${cp_ownership}  ${type}
        Wait Until Page Contains  Add Owner
        Wait And Set Text  ${cp_owner_input}  ${oname}
        Sleep  3s
        Wait And Click Element  ${cp_selected_value}
    END
    Wait And Click Element  ${cp_checkbox}
    Wait Until Page Contains  Location
    Wait And Set Text  ${cp_location_input}  ${loc}
    Sleep  1s
    Wait And Click Element  ${cp_selected_value}
    Wait And Set Text  ${cp_jobfamily}  ${jobfamily}
    Sleep  1s
    Wait And Click Element  ${cp_selected_value}
    Wait And Click Element  ${cp_save}
    Wait Until Page Contains  Pools


Search for Talent Pool
    [Arguments]  ${name}
    Wait And Set Text  ${cp_search}  ${name}
    Sleep  3s
    Wait And Click Element  ${cp_search_img}
    Sleep  2s

Mark Pool
    ${count}=  Get Element Count    ${cp_star}
    Sleep  3s
    IF  ${count}==1
       Wait And Click Element  ${cpp_star}
       Sleep  2s
       Capture Page Screenshot
    ELSE IF  ${count}>1
        Log To Console  Pools found with same name
        Fail
    ELSE
        Log To Console  Talent Pool not found!
        Fail
    END

Action On Pool
    [Arguments]  ${action}
    ${count}=  Get Element Count    ${cp_dots}
    IF  ${count}==1
       Wait And Click Element  ${cp_dots}
       Sleep  2s
       ${cp_temp}=  Catenate  SEPARATOR=  //td[text()='${action}']
       Wait And Click Element  ${cp_temp}
       IF  "${action}"=="Inactivate"
         Sleep  2s
         Wait Until Page Contains  Warning
         Wait And Click Element  ${cp_warn_yes}
         Sleep  5s
       END
    ELSE IF  ${count}>1
        Log To Console  Pools found with same name
        Fail
    ELSE
        Log To Console  Talent Pool not found!
        Fail
    END

Select Talent Pool
    [Arguments]  ${name}
    Search for Talent Pool  ${name}
    ${count}=  Get Element Count    ${cp_req_title}
    IF  ${count}>=1
       ${matching_elements}=  Get WebElements   ${cp_req_title}
       FOR  ${element}  IN  @{matching_elements}
         ${text}=  Get Element Attribute  ${element}  title
         IF  '${text}'=='${name}'
            Wait And Click Element  ${element}
            Sleep  10s
            Capture Page Screenshot
            Exit For Loop
         END
       END
    ELSE
        Log To Console  Pool Name - ${name} not found!
        Fail
    END