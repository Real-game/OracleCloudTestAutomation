*** Settings ***
Resource  ../Locators/EditJobOffer.robot
Resource  ../Keywords/CommonKeywords.robot
Library  Selenium2Library

*** Keywords ***
Select Sections
    ${matching}=  Get WebElements  ${ejo_options}
    FOR  ${e}  IN  @{matching}
        Wait And Click Element  ${e}
    END
    Capture page Screenshot
    Wait And Click Element  ${ejo_continue_btn}
    Wait Until Page Contains  When and Why
    Capture Page Screenshot


Fill When and Why
    [Arguments]  ${data}
    IF  "${data}[Employee Start Date]"!=""
        Wait Then Click And Set Text  ${ejo_req_date}  ${data}[Employee Start Date]
    END
    IF  "${data}[Employee Type]"!=""
        Wait And Click Element  ${ejo_emp_type_dropdown}
        Select Required Value  ${ejo_temp}  ${data}[Employee Type]
    END
    Capture page Screenshot
    Wait And Click Element  ${ejo_continue}

Fill Assignment Info
    [Arguments]  ${data}
    IF  "${data}[Assignment Status]"!=""
        Wait And Click Element  ${ejo_assign_status_dropdown}
        Select Required Value  ${ejo_assign_temp}  ${data}[Assignment Status]
    END
    IF  "${data}[Proposed Person Type]"!=""
        Wait And Click Element  ${ejo_person_type_dropdown}
        Select Required Value  ${ejo_person_type_temp}  ${data}[Proposed Person Type]
    END
    ${text}=  Get Element Attribute  ${ejo_business_unit_field}  value
    IF  "${text}"!="Metrolinx BU"
        Fail
    END
    Capture page Screenshot
    Wait And Click Element  ${ejo_continue}

Fill Offer Team
    [Arguments]  ${data}
    ${matching}=  Get WebElements  ${eoj_remove_temp}
    FOR  ${e}  IN  @{matching}
        Wait And Click Element  ${e}
    END
    IF  "${data}[Assistant Hiring Manager]"!=""
        Wait And Click Element  ${ejo_collaborator_type_dropdown}
        Select Required Value  ${ejo_temp}  Assistant Hiring Manager
        Wait And Send Keys  ${ejo_ass_hiring_manager_input}  ${data}[Assistant Hiring Manager]
        Wait And Click Element  ${ejo_select_value}
    END
    IF  "${data}[HRBP]"!=""
        Wait And Click Element  ${ejo_collaborator_type_dropdown}
        Select Required Value  ${ejo_temp}  HRBP
        Wait And Send Keys  ${ejo_hrbp_input}  ${data}[HRBP]
        Wait And Click Element  ${ejo_select_value}
    END
    IF  "${data}[Collaborator]"!=""
        Wait And Click Element  ${ejo_collaborator_type_dropdown}
        Select Required Value  ${ejo_temp}  Collaborator
        Wait And Send Keys  ${ejo_collab_input}  ${data}[Collaborator]
        Wait And Click Element  ${ejo_select_value}
    END
    Capture Page Screenshot
    Wait And Click Element  ${ejo_ot_continue}

Fill Payroll Info
    [Arguments]  ${data}
    Wait Until Page Contains  Payroll Frequency
    IF  "${data}[Payroll]"!=""
        Wait And Click Element  ${ejo_payroll_add_btn}
        Wait And Click Element  ${ejo_payroll_dropdown}
        Select Required Value  ${ejo_payroll_temp}  ${data}[Payroll]
    END
    IF  "${data}[Tax Reporting Input]"!=""
        Wait And Click Element  ${ejo_tax_report_unit_dropdown}
        Select Required Value  ${ejo_tax_report_temp}  ${data}[Tax Reporting Input]
    END
    Capture Page Screenshot
    Wait And Click Element  ${ejo_continue}

Fill Salary
    [Arguments]  ${data}
    IF  "${data}[Salary Basis]"!=""
        Wait And Click Element  ${ejo_salary_basis_dropdown}
        Select Required Value  ${ejo_salary_basis_temp}  ${data}[Salary Basis]
    ELSE
        Fail
    END
    Sleep  2s
    IF  "${data}[Salary Amount]"!=""
        Wait Then Click And Set Text   ${ejo_salary_amount_input}  ${data}[Salary Amount]
    ELSE
        Fail
    END
    Capture Page Screenshot
    Wait And Click Element  ${ejo_continue}
    Sleep  3s

Fill Attachments
    [Arguments]  ${data}
    ${add_hover}=  Get WebElements  ${ejo_add_file_dropdown}
    ${add}=  Get WebElements  ${ejo_add_file}
    FOR  ${i}  IN RANGE  0  2
        IF  "${i}"=="0"
            IF  "${data}[Candidate Facing Documents]"!=""
                Wait And Click Element  ${add_hover}[${i}]
                Wait And Click Element  ${add}[${i}]
                Attach File  ${data}[Candidate Facing Documents]
            END
        END
        IF  "${i}"=="1"
            IF  "${data}[Internal Documents]"!=""
                Wait And Click Element  ${add_hover}[${i}]
                Wait And Click Element  ${add}[${i}]
                Attach File  ${data}[Internal Documents]
            END
        END
    END
    Capture Page Screenshot
    Wait And Click Element  ${ejo_continue}

Fill Additional Info
    [Arguments]  ${data}
    IF  "${data}[Contract Start Date]"!=""
        Wait And Send Keys  ${ejo_contract_start_input}  ${data}[Contract Start Date]
    END
    IF  "${data}[Contract End Date]"!=""
        Wait And Send Keys  ${ejo_contract_end_input}  ${data}[Contract End Date]
    END
    Capture Page Screenshot
    Wait And Click Element  ${ejo_continue}

Fill Offer Letter
    [Arguments]  ${data}
    IF  "${data}[Offer Letter]"!=""
        Wait And Click Element  ${ejo_offer_letter_dropdown}
        sleep  1s
        Select Required Value  ${ejo_offer_letter_temp}  ${data}[Offer Letter]
        Wait And Click Element  ${ejo_ol_download_btn}
    END
    IF  "${data}[Expiration Date]"==""
        Fail
    ELSE
        Wait And Send Keys  ${ejo_expiration_input}  ${data}[Expiration Date]
    END
    Capture Page Screenshot

Click on Submit
    Wait And Click Element  ${ejo_submit_btn}
    Wait Until Page Contains  Details
    Capture Page Screenshot








