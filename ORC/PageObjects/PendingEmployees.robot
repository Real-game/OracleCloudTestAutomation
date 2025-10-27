*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/PendingEmployees.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Search for Pending Employee
    [Arguments]  ${name}
    Wait And Set Text  ${pe_search}  ${name}
    Wait And Click Element  ${pe_search_img}
    Sleep  5s

Take Action on Pending Employee
    [Arguments]  ${name}  ${value}
    Search for Pending Employee  ${name}
    ${status}=  Run Keyword and Return Status  Page Should Not Contain  No results found.
    IF  "${status}"=="True"
        Wait And Click Element  ${pe_actions_temp}
        IF  "${value}"=="Quick Convert"
            capture page screenshot
            Wait And Click Element  xpath: //td[text()="Quick Convert"]
            Sleep  180s
            END
        END
#        ${matching}=  Get WebElements  ${pe_names_temp}
#        ${actions_ls}=  Get WebElements  ${pe_actions_temp}
#        ${count}=  Get Length  ${matching}
#        ${count}=  Evaluate  ${count}-1
#        IF  ${count}==0
#            Wait And Click Element  ${pe_actions_temp}
#            Sleep  2s
#            Select Required Value  ${pe_temp}  ${value}
#
#        ELSE
#            FOR  ${i}  IN RANGE  0  ${count}
#                ${text}=  Get Text  ${matching}[${i}]
#                IF  "${text}"=="${name}"
#                    Wait And Click Element  ${actions_ls}[${i}]
#                    Sleep  2s
#                    Select Required Value  ${pe_temp}  ${value}
#                    IF  "${value}"=="Quick Convert"
#                        Sleep  10s
#                    END
#                    Exit For Loop
#                END
#            END
#        END
#    ELSE
#        Fail
#        Log  No pending employee found
#    END

Update Candidate Date of Birth
    [Arguments]  ${dateOfBirth}
    Wait And Click Element  ${pe_actions_temp}
    Wait And Click Element  ${edit_pending_employee}
    Sleep  2s
    Wait And Click Element  xpath: //span[text()="Additional Assignment Info"]
    Sleep  5s
    Wait And Click Element  xpath: //span[text()="u"]   #Continue
    Sleep  2s
    Wait And Click Element  ${continue_btn}
    Wait And Click Element  xpath: //img[@title="Edit Biographical Info"]
    Sleep  3s
    Wait And Set Text  xpath: //input[contains(@id,"DobrDt")]  ${dateOfBirth}
    Wait And Click Element  ${ok_btn}
    Wait And Click Element  ${continue_btn}
    Sleep  2s
    Wait And Click Element  ${continue_btn}
    Sleep  3s
    Wait And Click Element  ${submit_btn}
    Sleep  5s
    capture page screenshot


Update Candidate Address in Pending Employee
    [Arguments]  ${name}  ${value}  ${Address1}  ${city}  ${province}  ${postal}
    Search for Pending Employee  ${name}
    ${status}=  Run Keyword and Return Status  Page Should Not Contain  No results found.
    IF  "${status}"=="True"
        Wait And Click Element  ${pe_actions_temp}
        IF  "${value}"=="Quick Convert"
            capture page screenshot
            Wait And Click Element  xpath: //td[text()="Quick Convert"]
            Sleep  180s
        END
        IF  "${value}"=="Convert"
            capture page screenshot
            Wait And Click Element  ${convert_option}
            Sleep  2s
            Wait And Click Element  xpath: //span[text()="Addresses"]
            Sleep  5s
            Wait And Click Element  xpath: //span[text()="u"]   #Continue
            Sleep  2s
            Wait And Click Element  ${continue_btn}
            Sleep  5s
            Wait And Click Element  ${continue_btn}
            Sleep  5s
            Wait And Click Element  xpath: //a[contains(@title,"Edit Address")]
            Sleep  3s
            Wait And Set Text  ${address_1_input}  ${Address1}
            Sleep  3s
#            Wait And Set Text  ${address_2_input}  ${Address2}
            Sleep  3s
            Wait And Set Text  ${city_input_information}  ${city}
            Sleep  2s
            Wait And Click Element  ${select_option_first}
            Sleep  3s
            Wait And Set Text  ${Province_input_information}  ${province}
            Sleep  2s
            Wait And Click Element  ${select_option_first}
            Sleep  3s
            Wait And Set Text  ${postal_code_input_information}  ${postal}
            Sleep  2s
            Wait And Click Element  ${select_option_first}
            Sleep  2s
            Wait And Click Element  ${continue_btn}
            Sleep  3s
            Wait And Click Element  ${submit_btn}
            Sleep  5s
            capture page screenshot
            Sleep  200s
        END
    END
    Capture page screenshot




