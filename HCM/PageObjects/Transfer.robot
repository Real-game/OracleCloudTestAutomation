*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/CustomKeywords.robot
Resource  ../Locators/Transfer.robot

*** Keywords ***

Search And Select Person
    [Arguments]  ${value}
    Wait And Click Element  ${search_input_person_name}
    Sleep  2s
    Wait And Send Keys  ${search_input_person_name}  ${value}
    Sleep  3s
    Wait And Click Element  ${select_recent_search_result}
    Sleep  3s
    capture page screenshot

Select Continue
    Wait And Click Element  ${continue_button}
    Sleep  3s
    capture page screenshot

Fill The Details In When and Why
    [Arguments]  ${date}  ${reason}
    Wait And Set Text  ${transfer_start_date}  ${date}
    Sleep  3s
    IF  "${reason}"!=""
        wait and click element  ${transfer_reason}
        Sleep  3s
        ${check}=  Run Keyword and Return Status  Wait Until Page Contains Element  xpath://div[text()='${reason}']  10s  Transfer reason is not displayed
        IF  '${check}'=='True'
            Wait and click element  xpath://div[text()='${reason}']
        ELSE
            wait and click element  ${transfer_reason}
            Sleep  5s
            wait and click element  xpath://div[text()='${reason}']
        END
    END
    Sleep  3s
    capture page screenshot

Select Position On Transfer Page
    [Arguments]  ${value}
    Sleep  2s
    wait until element is visible  ${select_position}  20s
    scroll element into view  ${select_position}
    Sleep  3s
    Wait And Send Keys  ${select_position}  ${value}
    Sleep  5s
    ${value_xpath}=  Catenate   SEPARATOR=  //span[text()='${value}']
    Wait And Click Element  ${value_xpath}
    Sleep  3s
    ${transfer_yes_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${yes_button}  10s
    IF  "${transfer_yes_check}"=="True"
        Wait And Click Element  ${yes_button}
    END
    Sleep  5s
    capture page screenshot

Continue
    scroll element into view  ${continue}
    Wait And Click Element  ${continue}
    Sleep  5s
    capture page screenshot

Submit Details
    Wait And Click Element  ${submit_button}
    Wait And Verify Page Contains Element  ${href_my_client}  180s  An Employee's Transfer Submission Process still not finished
    capture page screenshot

Select manage info in Transfer page
    [Arguments]  ${assign_info}  ${manager_maintain_option}  ${salary_option}  ${compensation_option}  ${reassign_report_option}  ${direct_report_option}  ${comment_option}
    IF  "${assign_info}"=="Yes"
        ${assign_info_status}=  Run Keyword and Return Status   Page Should Contain Element  ${Additional_Assignments_info}
        IF  "${assign_info_status}"=="True"
            Wait And Click Element  ${Additional_Assignments_info}
            Sleep  2s
        END
    END
    IF  "${manager_maintain_option}"=="Yes"
        ${manager_maintain_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${maintain_managers_info}
        IF  "${manager_maintain_option_status}"=="True"
            Wait And Click Element  ${maintain_managers_info}
            Sleep  2s
        END
    END
    IF  "${salary_option}"=="Yes"
        ${salary_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${salary_info}
        IF  "${salary_option_status}"=="True"
            Wait And Click Element  ${salary_info}
            Sleep  2s
        END
    END
    IF  "${compensation_option}"=="Yes"
        ${compensation_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${compensation_info}
        IF  "${compensation_option_status}"=="True"
            Wait And Click Element  ${compensation_info}
            Sleep  2s
        END
    END
    IF  "${reassign_report_option}"=="Yes"
        ${reassign_report_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${reassign_report_info}
        IF  "${reassign_report_option_status}"=="True"
            Wait And Click Element  ${reassign_report_info}
            Sleep  2s
        END
    END
    IF  "${direct_report_option}"=="Yes"
        ${direct_report_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${add_direct_report_info}
        IF  "${direct_report_option_status}"=="True"
            Wait And Click Element  ${add_direct_report_info}
            Sleep  2s
        END
    END
    IF  "${comment_option}"=="Yes"
        ${comment_option_status}=  Run Keyword and Return Status   Page Should Contain Element  ${comment_attachment_info}
        IF  "${comment_option_status}"=="True"
            Wait And Click Element  ${comment_attachment_info}
            Sleep  2s
        END
    END
    Capture Page Screenshot And Retry If Required

#Select manage info checkbox in Transfer
#    ${assign_info}=  Run Keyword and Return Status   Page Should Contain Element  ${Additional_Assignments_info}
#    IF  "${assign_info}"=="True"
#        Wait And Click Element  ${Additional_Assignments_info}
#        Sleep  2s
#    END
#    ${manager_maintain_option}=  Run Keyword and Return Status   Page Should Contain Element  ${maintain_managers_info}
#    IF  "${manager_maintain_option}"=="True"
#        Wait And Click Element  ${maintain_managers_info}
#        Sleep  2s
#    END
#    ${salary_option}=  Run Keyword and Return Status   Page Should Contain Element  ${salary_info}
#    IF  "${salary_option}"=="True"
#        Wait And Click Element  ${salary_info}
#        Sleep  2s
#    END
#    ${compensation_option}=  Run Keyword and Return Status   Page Should Contain Element  ${compensation_info}
#    IF  "${compensation_option}"=="True"
#        Wait And Click Element  ${compensation_info}
#        Sleep  2s
#    END
#    ${reassign_report_option}=  Run Keyword and Return Status   Page Should Contain Element  ${reassign_report_info}
#    IF  "${reassign_report_option}"=="True"
#        Wait And Click Element  ${reassign_report_info}
#        Sleep  2s
#    END
#    ${direct_report_option}=  Run Keyword and Return Status   Page Should Contain Element  ${add_direct_report_info}
#    IF  "${direct_report_option}"=="True"
#        Wait And Click Element  ${add_direct_report_info}
#        Sleep  2s
#    END
#    ${comment_option}=  Run Keyword and Return Status   Page Should Contain Element  ${comment_attachment_info}
#    IF  "${comment_option}"=="True"
#        Wait And Click Element  ${comment_attachment_info}
#        Sleep  2s
#    END
#    Capture Page Screenshot And Retry If Required

Fill Additional Assignment Info In Transfer
    [Arguments]  ${assign_info}  ${position_seniority_rank}  ${bargaining_unit_seniority_rank}  ${section_seniority_date}  ${contract_start_date}  ${contract_end_date}  ${contract_type}  ${contract_reason}
    IF  "${assign_info}"=="Yes"
        ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${additional_assignment_info_header}
        IF  "${checker}"=="True"
            IF  "${position_seniority_rank}"!=""
                Wait And Set Text  ${position_seniority_rank_input}  ${position_seniority_rank}
                Sleep  2s
            END
            IF  "${bargaining_unit_seniority_rank}"!=""
                Wait And Set Text  ${bargaining_unit_seniority_rank_input}  ${bargaining_unit_seniority_rank}
                Sleep  2s
            END
            IF  "${section_seniority_date}"!=""
                Wait And Set Text  ${section_seniority_date_input}  ${section_seniority_date}
                Sleep  2s
            END
            IF  "${contract_start_date}"!=""
                Wait And Set Text  ${contract_start_date_input}  ${contract_start_date}
                Sleep  2s
            END
            IF  "${contract_end_date}"!=""
                Wait And Set Text  ${contract_end_date_input}  ${contract_end_date}
                Sleep  2s
                END
            IF  "${contract_type}"!=""
                Wait And Click Element  ${contract_type_dropdown}
                Sleep  2s
                ${type_xpath}=  Catenate   SEPARATOR=  //li[contains(text(),'${contract_type}')]
                Wait And Click Element   ${type_xpath}
                Sleep  2s
            END
            IF  "${contract_reason}"!=""
                Wait And Click Element  ${contract_reason_dropdown}
                Sleep  2s
                ${reason_xpath}=  Catenate   SEPARATOR=  //li[contains(text(),'${contract_reason}')]
                Wait And Click Element   ${reason_xpath}
                Sleep  2s
            END
            Capture Page Screenshot And Retry If Required
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
        END
    END
    Capture Page Screenshot And Retry If Required

Select Maintain Manager in Transfer
    [Arguments]  ${manager_maintain_option}
    IF  "${manager_maintain_option}"=="Yes"
        ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${maintain_managers_header}
        IF  "${checker}"=="True"
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
            Capture Page Screenshot And Retry If Required
        END
    END

Fill Salary Details in Transfer
    [Arguments]  ${salary_option}  ${salary_basis}  ${salary_amount}
    IF  "${salary_option}"=="Yes"
        ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${salary_heading}
        IF  "${checker}"=="True"
            IF  "${salary_basis}"!=""
                Wait And Click Element  ${salary_basis_dropdown}
                Sleep  2s
                ${basis_xpath}=  Catenate   SEPARATOR=  //th/div[contains(text(),'${salary_basis}')]
                Wait And Click Element   ${basis_xpath}
                Sleep  2s
            END
            IF  "${salary_amount}"!=""
                Wait And Click Element  ${salary_value}
                Sleep  3s
                Wait And Click Element  ${salary_header}
                Sleep  2s
                scroll element into view  ${salary_header}
                ${check}=  Run Keyword and Return Status  Wait and clear and send keys  ${salary_value}  ${salary_amount}
                IF  '${check}'=='False'
                    Sleep  3s
                    Wait And Click Element  ${salary_header}
                    Sleep  3s
                    scroll element into view   ${salary_header}
                    Sleep  3s
                    Wait Then delete And Set Text  ${salary_value}  ${salary_amount}
                END
                Sleep  2s
                Capture Page Screenshot And Retry If Required
            END
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
        END
    END
    Capture Page Screenshot And Retry If Required


Select Reassign Existing Reports
    [Arguments]  ${reassign_report_option}  ${input}
    IF  "${reassign_report_option}"=="Yes"
        ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${direct_report_all_checkbox}
        IF  "${checker}"=="True"
            IF  "${input}"!=""
                ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${direct_report_all_checkbox}
                IF  "${checker}"=="True"
                    Wait And Click Element  ${direct_report_all_checkbox}
                    Sleep  2s
                    Wait And Set Text  ${direct_report_input}  ${input}
                    Sleep  2s
                    Wait And Click Element  ${direct_report_select}
                END
            END
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
        END
    END
    Capture Page Screenshot And Retry If Required

Select Add Direct Reports
    [Arguments]  ${direct_report_option}  ${input}
    IF  "${direct_report_option}"=="Yes"
        ${checker}=  RUN KEYWORD And Return Status  element should be visible  ${add_direct_report_header}
        IF  "${checker}"=="True"
            IF  "${input}"!=""
                Wait And Send Keys  ${add_direct_report_input}  ${input}
                Sleep  2s
                Wait And Click Element  ${direct_report_select}
            END
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
        END
    END
    Capture Page Screenshot And Retry If Required

Select Compensation in Transfer
    [Arguments]   ${compensation_option}
    IF  "${compensation_option}"=="Yes"
        Sleep  3s
        ${checker}=  run keyword and return status  element should be visible  ${compensation_header}
        IF  "${checker}"=="True"
            ${continue_check}=  Run Keyword and Return Status   Wait Until Element Is Visible  ${continue}  5s
            IF  "${continue_check}"=="True"
                scroll element into view  ${continue}
                Wait And Click Element  ${continue}
            END
            Sleep  5s
        END
    END
    Capture Page Screenshot And Retry If Required

Add Comments on Transfer page
    [Arguments]  ${comment_option}  ${comment}
    IF  "${comment_option}"=="Yes"
        Wait And Set Text  ${comment_box}  ${comment}
        Sleep  2s
        Capture Page Screenshot And Retry If Required
    END
    Capture Page Screenshot And Retry If Required