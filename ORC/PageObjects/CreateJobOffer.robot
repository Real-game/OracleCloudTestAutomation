*** Settings ***
Resource  ../Locators/CreateJobOffer.robot
Resource  ../Keywords/CommonKeywords.robot
Library  Selenium2Library
Resource  ../Helpers/Config.robot

*** Keywords ***
Select Sections
    ${matching}=  Get WebElements  ${options}
    FOR  ${e}  IN  @{matching}
        Wait And Click Element  ${e}
        Sleep  2s
    END
    Capture page Screenshot
    Wait And Click Element  ${continue_btn}
    Wait Until Page Contains  When and Why  25s
    Capture Page Screenshot


Fill When and Why
    [Arguments]  ${data}
    IF  "${data}[Employee Start Date]"!=""
        Wait Then Click And Set Text  ${req_date}  ${data}[Employee Start Date]
    END
    Sleep  4s
    IF  "${data}[Employee Type]"!=""
        Wait And Click Element  ${emp_type_dropdown}
        Wait And Click Element  xpath: //li[text()="${data}[Employee Type]"]
        Sleep  2s
    END
    IF  "${data}[Action]"!=""
        Wait And Click Element  ${emp_action_dropdown}
        Sleep  2s
        Select Required Value  ${action_name_temp}  ${data}[Action]
        Sleep  3s
    END
    Capture page Screenshot
    Wait And Click Element  ${continue}

Fill Assignment Info
    [Arguments]  ${data}
    IF  "${data}[Assignment Status]"!=""
        Wait And Click Element  ${assign_status_dropdown}
        Sleep  3s
        Select Required Value  ${assign_temp}  ${data}[Assignment Status]
        Sleep  3s
    END
    IF  "${data}[Proposed Person Type]"!=""
        Wait And Click Element  ${person_type_dropdown}
        Sleep  1s
        ${proposed_person_xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'  ${data}[Proposed Person Type]  ')]]
        Click Element  xpath: ${proposed_person_xpath}
        Sleep  2s
    END
    IF  "${data}[Sync from Position]"!=""
        Sleep  2s
        Wait And Click Element  ${sync_position_dropdown}
        Sleep  3s
        ${sync_position_xpath}=  Catenate  SEPARATOR=  //li[text()='${data}[Sync from Position]']
        Wait and Click Element  xpath: ${sync_position_xpath}
        Sleep  3s
    END
    ${text}=  Get Element Attribute  ${business_unit_field}  value
    IF  "${text}"!="Metrolinx BU"
        Fail
    END
    Capture page Screenshot
    Wait And Click Element  ${continue}

Fill Offer Team
    [Arguments]  ${data}
    IF  "${data}[Hiring Manager]"!=""
        Wait Until Page Contains Element  ${hiring_manager_label}  20s
        Wait And Send Keys  ${hiring_manager_txt_box}   ${data}[Hiring Manager]
        Wait And Click Element  ${select_value}
        Sleep  2s
        capture page screenshot
    END
#    IF  "${data}[Assistant Hiring Manager]"!=""
#        Wait And Click Element  ${collaborator_type_dropdown}
#        Select Required Value  ${temp}  Assistant Hiring Manager
#        Wait And Send Keys  ${ass_hiring_manager_input}  ${data}[Assistant Hiring Manager]
#        Wait And Click Element  ${select_value}
#    END
    IF  "${data}[HRBP]"!=""
        Wait And Click Element  ${collaborator_type_dropdown}
        Wait And Click Element  xpath: //li[text()="HRBP"]
        Wait And Send Keys  ${hrbp_input}  ${data}[HRBP]
        Wait And Click Element  ${select_value}
    END
    IF  "${data}[Collaborator]"!=""
        Wait And Click Element  ${collaborator_type_dropdown}
        Wait And Click Element  xpath: //li[text()="Collaborator"]
        Wait And Send Keys  ${collab_input}  ${data}[Collaborator]
        Wait And Click Element  ${select_value}
    END
    Capture Page Screenshot
    Wait And Click Element  ${ot_continue}

Fill Payroll Info
    [Arguments]  ${data}
    Wait Until Page Contains  Payroll Frequency  120s
    IF  "${data}[Payroll]"!=""
#       Wait And Click Element  ${payroll_add_btn}
       Wait And Click Element  ${payroll_dropdown}
       Sleep  1s
       ${payroll_xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'  ${data}[Payroll]  ')]]
       Click Element  xpath:${payroll_xpath}
       Sleep  2s
    END
    IF  "${data}[Tax Reporting Input]"!=""
        Wait And Click Element  ${tax_report_unit_dropdown}
        Select Required Value  ${tax_report_temp}  ${data}[Tax Reporting Input]
    END
    Capture Page Screenshot
    Wait And Click Element  ${continue}

Fill Salary
    [Arguments]  ${data}
    IF  "${data}[Salary Basis]"!=""
        Wait And Click Element  ${salary_basis_dropdown}
        Sleep  3s
        Select Required Value  ${salary_basis_temp}  ${data}[Salary Basis]
    ELSE
        Fail
    END
    Sleep  2s
    IF  "${data}[Salary Amount]"!=""
        Sleep  3s
        Wait Then Click And Set Text   ${salary_amount_input}  ${data}[Salary Amount]
    ELSE
        Fail
    END
    Capture Page Screenshot
    Wait And Click Element  ${continue}
    Sleep  5s

Fill Attachments
    [Arguments]  ${data}
    IF  "${data}[Candidate Facing Documents]"!=""
        scroll element into view  ${add_file_dropdown}
        Sleep  2s
        Wait And Click Element  ${add_file_dropdown}
        Wait And Click Element  ${add_file}
        Sleep  2s
        Attach File  ${data}[Candidate Facing Documents]
    END
    IF  "${data}[Internal Documents]"!=""
        scroll element into view  ${add_file_dropdown}
        Sleep  2s
        Wait And Click Element  ${add_file_dropdown}
        Wait And Click Element  ${add_file}
        Sleep  2s
        Attach File  ${data}[Internal Documents]
    END
    Capture Page Screenshot
    Sleep  2s
    Wait And Click Element  ${continue}

#Fill Attachments
#    [Arguments]  ${data}
#    ${add_hover}=  Get WebElements  ${add_file_dropdown}
#    ${add}=  Get WebElements  ${add_file}
#    FOR  ${i}  IN RANGE  0  2
#        IF  "${i}"=="0"
#            IF  "${data}[Candidate Facing Documents]"!=""
#                Wait And Click Element  ${add_hover}[${i}]
#                Wait And Click Element  ${add}[${i}]
#                Attach File  ${data}[Candidate Facing Documents]
#            END
#        END
#        IF  "${i}"=="1"
#            IF  "${data}[Internal Documents]"!=""
#                Wait And Click Element  ${add_hover}[${i}]
#                Wait And Click Element  ${add}[${i}]
#                Attach File  ${data}[Internal Documents]
#            END
#        END
#    END
#    Capture Page Screenshot
#    Wait And Click Element  ${continue}

Fill Additional Info
    [Arguments]  ${data}
    IF  "${data}[Contract Start Date]"!=""
        Wait Then Click And Set Text  ${contract_start_input}  ${data}[Contract Start Date]
    END
    IF  "${data}[Contract End Date]"!=""
        Wait Then Click And Set Text  ${contract_end_input}  ${data}[Contract End Date]
    END
     IF  "${data}[Contract Type]"!=""
            Wait And Click Element  ${contract_type_drop_down}
            Sleep  3s
            ${contracr_type_value}=  Catenate  SEPARATOR=  //span[contains(text(),'${data}[Contract Type]')]
#            Select Required Value  ${contract_temp_list}   ${data}[Contract Type]
            Wait And Click Element  ${contracr_type_value}
     END
    Sleep  3s
    IF  "${data}[OMERS]"!=""
        Wait And Click Element  ${omers_drop_down}
        Sleep  5s
        Select Required Value  ${omers_drop_down_list}  ${data}[OMERS]
    ELSE
        Wait And Click Element  ${omers_drop_down}
        Sleep  2s
        Wait And Click Element  ${omers_drop_down_option_no}
    END
    Sleep  2s
        IF  "${data}[Union Dues Retention]"!=""
            Wait And Click Element  ${union_retention_drop_down}
            Sleep  2s
            Select Required Value  ${union_retention_drop_down_list}  ${data}[Union Dues Retention]
        ELSE
            Wait And Click Element  ${union_retention_drop_down}
            Sleep  2s
            Wait And Click Element  ${union_retention_drop_down_no}
        END
    Sleep  2s
    Capture Page Screenshot
    Sleep  4s
    Wait And Click Element  ${continue}
    Sleep  3s

Fill Offer Letter
    [Arguments]  ${data}
    IF  "${data}[Offer Letter]"!=""
        Wait And Click Element  ${offer_letter_dropdown}
        sleep  3s
        ${status}=  Run Keyword And Return Status  Page Should Contain  ${data}[Offer Letter]
        IF  "${status}"=="True"
            Select Required Value  ${offer_letter_temp}  ${data}[Offer Letter]
            Wait And Click Element  ${ol_download_btn}
        ELSE
            Wait And Click Element  ${offer_letter_search}
            Sleep  5s
            Wait And Send Keys  ${name_input}  ${data}[Offer Letter]
            Wait And Click Element  ${name_search_button}
            Sleep  5s
            Select Required Value  ${offer_letter_partial_search}  ${data}[Offer Letter]
            Sleep  5s
            Wait And Click Element  ${ok_button_name_popup}
            Sleep  5s
        END
    END
    IF  "${data}[Expiration Date]"==""
        Fail
    ELSE
        Sleep  3s
        scroll element into view  ${expiration_input}
        Wait And Set Text   ${expiration_input}  ${data}[Expiration Date]
    END
#    IF  "${data}[Additional Text 1]"!=""
#        Wait And Send Keys  ${additional1}  ${data}[Additional Text 1]
#    END
#    IF  "${data}[Additional Text 2]"!=""
#        Wait And Send Keys  ${additional2}  ${data}[Additional Text 2]
#    END
    Capture Page Screenshot

Click on Submit
    Wait And Click Element  ${submit_btn}
    Sleep  5s
    Wait Until Page Contains  Details   20s
    Capture Page Screenshot

Fill Assignment Info for Transfer
    [Arguments]  ${data}
    IF  "${data}[Assignment Status]"!=""
        Wait And Click Element  ${assign_status_dropdown}
        Select Required Value  ${assign_temp}  ${data}[Assignment Status]
    END
    IF  "${data}[Proposed Person Type]"!=""
        Wait And Click Element  ${person_type_dropdown}
        Sleep  1s
        ${proposed_person_xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'  ${data}[Proposed Person Type]  ')]]
        Click Element  xpath:${proposed_person_xpath}
        Sleep  2s
    END
    IF  "${data}[Sync from Position]"!=""
        Sleep  2s
        Wait And Click Element  ${sync_position_dropdown}
        Sleep  3s
        ${sync_position_xpath}=  Catenate  SEPARATOR=  //li[text()='${data}[Sync from Position]']
        Wait and Click Element  xpath: ${sync_position_xpath}
        Sleep  3s
    END
    ${text}=  Get Element Attribute  ${business_unit_field}  value
    IF  "${text}"!="Metrolinx BU"
        Fail
    END
    IF  "${data}[Assignment Category]"!=""
        Wait And Click Element  ${assignment_category_drop_down}
        Sleep  1s
        ${assignment_category_xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'  ${data}[Assignment Category]  ')]]
        Click Element  xpath: ${assignment_category_xpath}
        Sleep  2s
    END
#    ${bargain_value}=  Get Element Attribute  ${bargaining_unit_label}  innerHTML
#    IF  "${data}[Bargaining Unit]"!=""
#        IF  "${bargain_value}"!="${data}[Bargaining Unit]"
#        Fail
#        END
#    END
    Sleep  25s
    Capture page Screenshot
    Wait And Click Element  ${continue}

Fill When and Why with Transfer Action
    [Arguments]  ${data}
    IF  "${data}[Employee Start Date]"!=""
        Wait Then Click And Set Text  ${req_date}  ${data}[Employee Start Date]
    END
    Sleep  3s
    IF  "${data}[Employee Type]"!=""
        Wait And Click Element  ${emp_type_dropdown}
        Sleep  2s
        Wait And Click Element  ${emp_type_dropdown}
        Sleep  3s
#        ${xpath}=  Catenate  SEPARATOR=  //li[text()[contains(.,'${data}[Employee Type]')]]
        Wait And Click Element  xpath: //li[contains(text(),"${data}[Employee Type]")]
        Sleep  20s
    END
    IF  "${data}[Employee Action]"!=""
        Wait And Click Element  ${employee_action_drop_down}
        Sleep  3s
        Wait And Click Element  ${transfer_option}
        Sleep  3s
    END
    Capture page Screenshot
    Wait And Click Element  ${continue}
    Sleep  3s


Fill Offer Letter for Transfer
    [Arguments]  ${data}
    IF  "${data}[Offer Letter]"!=""
        Wait And Click Element  ${offer_letter_dropdown}
        sleep  1s
        Wait And Click Element  ${transfer_offer_option}
    END
    IF  "${data}[Expiration Date]"==""
        Fail
    ELSE
        Wait And Send Keys  ${expiration_input}  ${data}[Expiration Date]
    END
#    IF  "${data}[Additional Text 1]"!=""
#        Wait And Send Keys  ${additional1}  ${data}[Additional Text 1]
#    END
#    IF  "${data}[Additional Text 2]"!=""
#        Wait And Send Keys  ${additional2}  ${data}[Additional Text 2]
#    END
    Capture Page Screenshot

Click on Offer Team Continue
    Sleep  3s
    Wait And Click Element  ${ot_continue}
    Sleep  30s

Fill Additional Info For Transfer
    [Arguments]  ${data}
    IF  "${data}[Contract Start Date]"!=""
        Wait And Send Keys  ${contract_start_input}  ${data}[Contract Start Date]
    END
    IF  "${data}[Contract End Date]"!=""
        Wait And Send Keys  ${contract_end_input}  ${data}[Contract End Date]
    END
    Sleep  3s
         IF  "${data}[Contract Type]"!=""
            Wait And Click Element  ${contract_type_drop_down}
            Sleep  3s
            ${contracr_type_value}=  Catenate  SEPARATOR=  //span[contains(text(),'${data}[Contract Type]')]
            Wait And Click Element  ${contracr_type_value}
#            Select Required Value  ${contract_temp_list}   ${data}[Contract Type]
        END
    Sleep  3s
    IF  "${data}[OMERS]"!=""
        Wait And Click Element  ${omers_drop_down}
        Sleep  2s
        Select Required Value  ${omers_drop_down_list}  ${data}[OMERS]
    ELSE
        Wait And Click Element  ${omers_drop_down}
        Sleep  2s
        Wait And Click Element  ${omers_drop_down_option_no}
    END
    Sleep  2s
    IF  "${data}[Union Dues Retention]"!=""
            Wait And Click Element  ${union_retention_drop_down}
            Sleep  2s
            Select Required Value  ${union_retention_drop_down_list}  ${data}[Union Dues Retention]
        ELSE
            Wait And Click Element  ${union_retention_drop_down}
            Sleep  2s
            Wait And Click Element  ${union_retention_drop_down_no}
        END
    Sleep  3s
    Capture Page Screenshot
    Sleep  4s
    Wait And Click Element  ${continue}
    Sleep  5s

Select Offer Team Section
    Wait And Click Element  xpath: //span[text()="Offer Team"]
    Capture page Screenshot
    Wait And Click Element  ${continue_btn}
    Wait Until Page Contains  When and Why  25s
    Capture Page Screenshot

Go to Offer Team block and edit hiring manager
    [Arguments]  ${hiring_manager}
    Wait And Click Element  ${continue}
    Sleep  5s
    Wait Until Page Contains  Assignment Status  20s
    Scroll Element Into View  ${continue}
    Wait And Click Element  ${continue}
    Sleep  5s
    Wait Until Page Contains Element  ${hiring_manager_label}  20s
    Wait And Send Keys  ${hiring_manager_txt_box}  ${hiring_manager}
    Wait And Click Element  ${select_value}
    Sleep  2s
    Capture Page Screenshot


