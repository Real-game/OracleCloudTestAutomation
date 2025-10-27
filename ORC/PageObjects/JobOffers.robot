*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/JobOffers.robot
Resource  ../PageObjects/ChangeAssignment.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Search for Job Offer
    [Arguments]  ${name}
    Wait And Set Text  ${jo_search}  ${name}
    Sleep  2s
    Wait And Click Element  ${jo_search_img}
    Sleep  5s

Take Action on Job Offer
    [Arguments]  ${reqid}  ${name}  ${value}  ${data}
#    Search for Job Offer
#    Wait Then Click And Set Text  ${jo_search}  ${reqid}
    Wait And Click Element   ${jo_search}
    Sleep  2s
    Wait And Set Text    ${jo_search}  ${reqid}
    Sleep  5s
    Wait And Click Element  ${jo_search_img}
    Sleep  5s
    ${status}=  Run Keyword and Return Status  Page Should Contain   No results found.
    IF  "${status}"!="True"
        ${matching}=  Get WebElements  ${jo_req_temp}
        ${actions_ls}=  Get WebElements  ${jo_actions_temp}
        ${count}=  Get Length  ${matching}
        ${count}=  Evaluate  ${count}-1
        IF  ${count}==0
            Wait And Click Element  ${jo_actions_temp}
            Sleep  2s
            Select Required Value  ${jo_temp}  ${value}
            IF  "${value}"=="Transfer"
                Wait Until Page Contains  Warning
                Sleep  5s
                Wait And Click Element  ${jo_warn_yes}
                Sleep  5s
                Wait Until Page Contains  Change Assignment  20s
                Sleep  5s
                Select Sections to change
                Sleep  5s
                Change When and Why  ${data}
                Sleep  5s
                Change Assignment  ${data}
                Sleep  5s
                Change Additional Info  ${data}
                Sleep  5s
                Change Managers  ${data}
                Sleep  5s
                Change Payroll
                Sleep  5s
                Change Salary  ${data}
                Sleep  5s
                Change Compensation
                Sleep  5s
                Add Reports
                Sleep  5s
                Add Comments  ${data}
                Sleep  5s
                Submit changes
            END
            IF  "${value}"=="Promotion"
                Wait Until Page Contains  Warning
                Wait And Click Element  ${jo_warn_yes}
                Wait Until Page Contains  Change Assignment
                Select Sections to change
                Sleep  5s
                Change When and Why  ${data}
                Sleep  5s
                Change Assignment  ${data}
                Sleep  5s
                Change Additional Info  ${data}
                Sleep  5s
                Change Managers  ${data}
                Sleep  5s
                Change Payroll
                Sleep  5s
                Change Salary  ${data}
                Sleep  5s
                Change Compensation
                Sleep  5s
                Add Reports
                Sleep  5s
                Add Comments  ${data}
                Sleep  5s
                Submit changes
            END
            IF  "${value}"=="Temporary Assignment"
                Wait Until Page Contains  Warning
                Sleep  5s
                Wait And Click Element  ${jo_warn_yes}
                Sleep  5s
                Wait Until Page Contains  Add Assignment  20s
                Sleep  5s
                Select Sections to change
                Sleep  5s
                Change When and Why for Temporary Assignment    ${data}
                Sleep  5s
                Change Assignment  ${data}
                Sleep  5s
                Change Additional Info  ${data}
                Sleep  5s
                Change Managers  ${data}
                Sleep  5s
                Change Payroll
                Sleep  5s
                Change Salary  ${data}
                Sleep  5s
                Change Compensation
                Sleep  5s
                Add Reports
                Sleep  5s
                Add Comments  ${data}
                Sleep  5s
                Submit changes
            END
        ELSE
            FOR  ${i}  IN RANGE  0  ${count}
                ${text}=  Get Text  ${matching}[${i}]
                ${name}=  getFirstName  ${name}
                ${status}=  Run Keyword and return Status  Should Contain  ${text}  ${name}
                IF  "${status}"=="True"
                    Wait And Click Element  ${actions_ls}[${i}]
                    Sleep  2s
                    Select Required Value  ${jo_temp}  ${value}
                    IF  "${value}"=="Transfer"
                        Wait Until Page Contains  Warning
                        Wait And Click Element  ${jo_warn_yes}
                        Wait Until Page Contains  Change Assignment
                        Sleep  5s
                        Select Sections to change
                        Sleep  5s
                        Change When and Why  ${data}
                        Sleep  5s
                        Change Assignment  ${data}
                        Sleep  5s
                        Change Additional Info  ${data}
                        Sleep  5s
                        Change Managers  ${data}
                        Sleep  5s
                        Change Payroll
                        Sleep  5s
                        Change Salary  ${data}
                        Sleep  5s
                        Change Compensation
                        Sleep  5s
                        Add Reports
                        Sleep  5s
                        Add Comments  ${data}
                        Sleep  5s
                        Submit changes
                    END
                    IF  "${value}"=="Promotion"
                        Wait Until Page Contains  Warning
                        Wait And Click Element  ${jo_warn_yes}
                        Wait Until Page Contains  Change Assignment
                        Select Sections to change
                        Sleep  5s
                        Change When and Why  ${data}
                        Sleep  5s
                        Change Assignment  ${data}
                        Sleep  5s
                        Change Additional Info  ${data}
                        Sleep  5s
                        Change Managers  ${data}
                        Sleep  5s
                        Change Payroll
                        Sleep  5s
                        Change Salary  ${data}
                        Sleep  5s
                        Change Compensation
                        Sleep  5s
                        Add Reports
                        Sleep  5s
                        Add Comments  ${data}
                        Sleep  5s
                        Submit changes
                    END
                    IF  "${value}"=="Temporary Assignment"
                        Wait Until Page Contains  Warning
                        Sleep  5s
                        Wait And Click Element  ${jo_warn_yes}
                        Sleep  5s
                        Wait Until Page Contains  Add Assignment  20s
                        Sleep  5s
                        Select Sections to change
                        Sleep  5s
                        Change When and Why for Temporary Assignment  ${data}
                        Sleep  5s
                        Change Assignment  ${data}
                        Sleep  5s
                        Change Additional Info  ${data}
                        Sleep  5s
                        Change Managers  ${data}
                        Sleep  5s
                        Change Payroll
                        Sleep  5s
                        Change Salary  ${data}
                        Sleep  5s
                        Change Compensation
                        Sleep  5s
                        Add Reports
                        Sleep  5s
                        Add Comments  ${data}
                        Sleep  5s
                        Submit changes
                    END
                    Exit For Loop
                END
            END
        END
    ELSE
        Fail
        Log  No Job Offer found
    END