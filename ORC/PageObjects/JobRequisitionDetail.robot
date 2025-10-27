*** Settings ***
Library  Selenium2Library
Library  AutoItLibrary
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisitionDetail.robot


*** Keywords ***
#Edit Posting Description
#    [Arguments]  ${value}
#    Execute Javascript  window.scrollTo(0,1000)
#    Wait And Click Element  ${PD_Expand}
#    Sleep  5s
#    ${Result}=  Get Element Count  ${checker}
#    Log To Console  ${Result}
#    IF  ${RESULT}>0
#        Capture Page Screenshot
#        Wait And Click Element  ${PD_Collapse}
#        Sleep  5s
#    ELSE
#       Wait And Click Element  ${PD_Edit}
#       Sleep  10s
#       Wait And Set Text   ${Desc_input}  ${value}
#       Wait And Click Element  ${Selected_value}
#       Wait And Click Element  ${Save_btn}
#       Capture Page Screenshot
#       Wait And Click Element  ${PD_Collapse}
#       Sleep  5s
#    END

Edit Attachments
    [Arguments]  ${file_path}
    Scroll element into view  ${Att_Expand}
    sleep  2s
    Wait And Click Element  ${Att_Expand}
    Sleep  2s
    Wait And Click Element  ${Att_Edit}
    Sleep  2s
    Wait And Click Element  ${Att_Link}
    Sleep  2s
    Wait And Click Element  ${Att_Add}
    Sleep  5s
    Attach File  ${file_path}
    Capture Page Screenshot
    Wait And Click Element  ${Save_btn}
    Wait And Click Element  ${Att_Collapse}

Edit Offer Info
    Wait And Click Element  ${Off_Expand}
    Sleep  3s
    Capture Page Screenshot
    Wait And Click Element  ${Off_Collapse}

Edit Basic Info
    [Arguments]  ${input_data}
    Wait And Click Element  ${basic_info_edit_button}
    Capture Page Screenshot
    Wait And Set Text  ${other_requisition_title}  ${input_data}[Other Requisition title]
    Sleep  5s
    Scroll Element Into View  ${comment_box}
    Wait And Click Element  ${comment_box}
    Wait And Set Text  ${comment_box}  ${input_data}[Comment Box]
    Wait Until Element Is Visible   ${Save_btn}     20
    Scroll Element Into View  ${Save_btn}
    Capture Page Screenshot
    Wait And Click Element  ${Save_btn}
    Sleep  5s

Review Hiring team section
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Log To console  hiring team is reviewed.

Review Requisition Structure section
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Log To console  requisition structure is reviewed.


Review Details Info section
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Log To console  details info structure is reviewed.


Redraft Job Requisition
    [Arguments]  ${input_data}
    Sleep  4s
    Review Basic Info    ${input_data}
    Review Hiring team section
    Review Requisition Structure section
    Review Details Info section
    Review Posting Description   ${input_data}[Posting Description]
    Sleep  3s
    Wait Until Element Is Visible   ${continue_button}     20
    Scroll Element Into View  ${continue_button}
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}
    Wait Until Element Is Visible   ${continue_button}     20
    Scroll Element Into View  ${continue_button}
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}
    Wait Until Element Is Visible   ${continue_button}     20
    Scroll Element Into View  ${continue_button}
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}
    Scroll Element Into View  ${submit_button}
    Wait And Click Element  ${submit_button}
    Capture Page Screenshot
    Sleep  5s

Edit Hiring Team
    [Arguments]  ${data}
    Wait And Click Element  ${hiring_team_edit_button}
    Capture Page Screenshot
    Edit Collaborator  ${data}
    Sleep  3s
    Scroll Element Into View  ${Save_btn}
    Capture Page Screenshot
    Wait And Click Element  ${Save_btn}
    Sleep  3s

Edit PD Internal Description
    [Arguments]  ${value}
    Wait And Click Element  ${PD_Expand}
    Sleep  5s
    IF  "${value}"!=""
       Wait And Click Element  ${PD_Edit}
       Sleep  5s
       ${check}=  Run Keyword And Return Status  element should be visible  ${internal_description}   10s
       IF  '${check}'=='False'
            Wait And Click Element  ${posting_description_checkbox}
       END
       Sleep  5s
       Wait And Set Text  ${internal_description}  ${value}
    END
    Wait And Click Element  ${Save_btn}
    Capture Page Screenshot
    Wait And Click Element  ${PD_Collapse}
    Sleep  5s

Edit Configuration
    [Arguments]  ${value}
    Wait And Click Element  ${configuration_expand}
    Sleep  3s
    IF  "${value}"!=""
        Wait And Click Element  ${configuration_edit}
        Sleep  2s
        Wait And Click Element  ${automatic_fill_field}
        Sleep  2s
        Select Required Value  ${temp}  ${value}
    END
    Capture Page Screenshot
    Wait And Click Element  ${Save_btn}
    Wait And Click Element  ${configuration_collapse}
    Sleep  3s

Edit Questionnaires
    [Arguments]  ${input_data}
    Wait And Click Element  ${questionnaire_expand}
    Sleep  2s
    Wait And Click Element  ${questionnaires_edit}
    Sleep  2s
    IF  "${input_data}[Internal Questionnaire]"!=""
        Wait And Set Text  ${internal_question}  ${input_data}[Internal Questionnaire]
        Sleep  2s
        Capture Page Screenshot
        Wait And Click Element  ${selected_temp}
        Sleep  2s
    END
    IF  "${input_data}[External Questionnaire]"!=""
        Wait And Set Text  ${external_question}  ${input_data}[External Questionnaire]
        Sleep  2s
        Capture Page Screenshot
        Wait And Click Element  ${selected_temp}
        Sleep  2s
    END
    Wait And Click Element  ${Save_btn}
    Sleep  3s
    Wait And Click Element  ${questionnaires_collapse}

Review Basic Info
    [Arguments]  ${input_data}
    #Wait And Click Element  ${basic_info_edit_button}
    Capture Page Screenshot
    Log  Basic Info section is expanded
    Wait And Set Text  ${requisition_title}  ${input_data}[Requisition title]
    Wait And Set Text  ${other_requisition_title}  ${input_data}[Other Requisition title]
    #Wait And Select From DropDown  ${language_dropdown}  ${language_selection}
    Sleep  5s
    Scroll Element Into View  ${comment_box}
    Log To Console  Updating the basic info section
    Wait And Click Element  ${comment_box}
    Wait And Set Text  ${comment_box}  ${input_data}[Comment Box]
    Wait Until Element Is Visible   ${continue_button}     20
    Scroll Element Into View  ${continue_button}
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}
    Sleep  5s

Review Posting Description
    [Arguments]  ${posting_description_input_text}
    Execute Javascript  window.scrollTo(0,1000)
    Sleep  5s
    ${VALUE}=   Get Element Attribute   ${posting_description_checker}   checked
    Log To Console   Checker value is ${VALUE}
    IF  "${VALUE}"=="true"
        Click Element  ${posting_description_check_box}
    END
    Sleep  7s
    Input Text  ${posting_description_input}   ${posting_description_input_text}
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Capture Page Screenshot
    Wait And Click Element  ${continue_button}

Edit Collaborator
    [Arguments]  ${data}
#     IF  "${data}[Assistant Hiring Manager]"!=""
#        Wait And Click Element  ${jd_collob_dropdown}
#        Select Required Value  ${jd_xpath_template}  Assistant Hiring Manager
#        Wait And Send Keys  ${jd_assis_hiring_manager_input}  ${data}[Assistant Hiring Manager]
#        Wait And Click Element  ${jd_selected_value}
#    END
    IF  "${data}[HRBP]"!=""
        Wait And Click Element  ${jd_collob_dropdown}
        Select Required Value  ${jd_xpath_template}  HRBP
        Sleep  2s
        Wait And Send Keys  ${jd_hrbpinput}  ${data}[HRBP]
        Wait And Click Element  ${jd_selected_value}
    END
    IF  "${data}[Collaborator]"!=""
        Wait And Click Element  ${jd_collob_dropdown}
        Select Required Value  ${jd_xpath_template}  Collaborator
        Sleep  2s
        Wait And Send Keys  ${jd_collabinput}  ${data}[Collaborator]
        Wait And Click Element  ${jd_selected_value}
    END

Edit Requisition Structure
    Wait And Click Element  ${requisition_structure_expand}
    Sleep  2s
    Mouse Over  ${org_label}
    Capture Page Screenshot

Edit Details Section
    Wait And Click Element  ${details_expand}
    Sleep  3s
    Scroll element into view  ${pay_label}
    Mouse Over  ${pay_label}
    Capture Page Screenshot
