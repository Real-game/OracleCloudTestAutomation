*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/ChangeAssignment.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Select Sections to change
    ${matching}=  Get WebElements  ${ca_options}
    FOR  ${e}  IN  @{matching}
        Wait And Click Element  ${e}
        Sleep   2s
    END
    Capture page Screenshot
    Wait And Click Element  ${ca_continue_btn}
    Wait Until Page Contains  When and Why
    Capture Page Screenshot

Change When and Why
    [Arguments]  ${data}
    IF  "${data}[Assignment Change Start]"!=""
        Wait Then Click And Set Text  ${ca_req_date}  ${data}[Assignment Change Start]
    END
    Capture page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Change Assignment
    [Arguments]  ${data}
    Wait Until Page Contains  Assignment Number
    IF  "${data}[Assignment Status]"!=""
        Wait And Click Element  ${ca_assign_status_dropdown}
        Select Required Value  ${ca_assign_temp}  ${data}[Assignment Status]
    END
    Wait Until Page Contains  Business Unit
    ${text}=  Get Element Attribute  ${ca_business_unit_field}  value
    IF  "${text}"!="Metrolinx BU"
        Fail
    END
    Capture page Screenshot
    Scroll Element Into View  ${ca_continue}
    Wait And Click Element  ${ca_continue}
    Sleep  3s


Change Additional Info
    [Arguments]  ${data}
    Wait until Page Contains  Dates and Ranks
    IF  "${data}[Contract Start Date]"!=""
        Wait And Send Keys  ${ca_contract_start_input}  ${data}[Contract Start Date]
    END
    IF  "${data}[Contract End Date]"!=""
        Wait And Send Keys  ${ca_contract_end_input}  ${data}[Contract End Date]
    END
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Change Managers
    [Arguments]  ${data}
    IF  "${data}[Manager]"!=""
        Wait And Click Element  ${ca_edit}
        Sleep  2s
        Wait And Send Keys  ${ca_man_name}  ${data}[Manager]
        Wait And Click Element  ${ca_select}
        Wait And Click Element  ${ca_ok}
    END
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Change Payroll
#    Mouse Over  ${ca_continue}
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Change Salary
    [Arguments]  ${data}
#    Wait Until Page Contains  Salary Basis
    IF  "${data}[Salary Basis]"!=""
        Wait And Click Element  ${ca_salary_basis_dropdown}
        Select Required Value  ${ca_salary_basis_temp}  ${data}[Salary Basis]
    END
    Sleep  2s
    IF  "${data}[Salary Amount]"!=""
        Wait Then Click And Set Text   ${ca_salary_amount_input}  ${data}[Salary Amount]
    END
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Change Compensation
#    Wait until Page Contains  Show Prior Compensation
    Mouse Over  ${ca_continue}
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Add Reports
#    Wait Until Page Contains  Search for people to add as reports
    Mouse Over  ${ca_continue}
    Capture Page Screenshot
    Wait And Click Element  ${ca_continue}
    Sleep  3s

Add Comments
    [Arguments]  ${data}
#    Wait Until Page Contains  Attachments
    IF  "${data}[Comments]"!=""
        Mouse Over  ${ca_comments_input}
        Wait And Send Keys  ${ca_comments_input}  ${data}[Comments]
    ELSE
        Fail
    END
    Capture Page Screenshot
    Sleep  3s

Submit changes
    Wait And Click Element  ${ca_submit_btn}
    Wait Until Page Contains  My Client Groups  120s
    Capture Page Screenshot