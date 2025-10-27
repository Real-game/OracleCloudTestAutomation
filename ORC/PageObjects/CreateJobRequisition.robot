*** Settings ***
Library  ../Helpers/Helpers.py
Library  AutoItLibrary
Library  Selenium2Library
Resource  ../Locators/CreateJobRequisition.robot
Resource  ../Keywords/CommonKeywords.robot


*** Keywords ***
Create Requisition
    [Arguments]  ${input_data}
    Filling details in How block    ${input_data}
    Filling details in Basic Info block  ${input_data}[Business Justification]
    Sleep   3s
    Filling details in Hiring Team block    ${input_data}[Hiring Manager]  ${input_data}
    Sleep  3s
    Filling details in Requisition Structure block  ${input_data}
    Log To console  Details filled in Requisition Structure block.
    Sleep  5s
    Upload file  ${input_data}[File Path]
    Save and close

Create a Requisition
    [Arguments]  ${input_data}  ${input_data2}
    Filling details in How block    ${input_data}
    Filling details in Basic Info block   ${input_data}[Business Justification]
    Sleep   3s
    Filling details in Hiring Team block    ${input_data2}[Hiring Manager]  ${input_data2}
    Sleep  3s
    Filling details in Requisition Structure block  ${input_data}
    Log To console  Details filled in Requisition Structure block.
    Sleep  3s
    Upload file  ${input_data2}[File Name]
    Save and close
    Sleep  5s

Upload file
    [Arguments]  ${file}
    IF  "${file}"!=""
        scroll element into view  ${Attach_img}
        Wait And Click Element  ${Attach_img}
        Sleep  2s
        Scroll element into view  ${Attach_img}
        Wait And Click Element  ${Attach_file}
        Attach File  ${file}
        execute javascript  window.scrollTo(0,document.body.scrollHeight)
        Capture Page Screenshot
    END


Filling details in How block
    [Arguments]  ${input_data}
    Wait And Click Element  ${Use_input_box}
    ${xpath_value}=  Catenate  SEPARATOR=  //li[text()="${input_data}[Use]"]
    Wait And Click Element   ${xpath_value}
    IF  "${input_data}[Use]" == "Position"
        Wait And Send Keys    ${pos_input_box}   ${input_data}[position_id]
        Sleep  5s
        Wait And Click Element   ${selected_value}
        Sleep  2s
        Capture Page Screenshot
    ELSE IF  "${input_data}[Use]" == "Existing Requisition"
        Wait And Click Element   ${requisition_drop_down}
        Wait And Send Keys    ${requisition_drop_down}     ${input_data}[Requisition Title]
        Sleep  3s
        Wait And Click Element   ${requisition_result}
    END
    Sleep  3s
    Wait And Click Element  ${btn_continue}
    Sleep  2s
    Capture page screenshot

Filling details in Basic Info block
    [Arguments]  ${value}
    Wait And Click Element  ${BusJus_input_box}
    ${xpath_value}=  Catenate  SEPARATOR=  //li[text()="${value}"]
    Wait And Click Element   ${xpath_value}
    Sleep  2s
    Mouse Over  ${btn_continue}
    Capture Page Screenshot
    Wait And Click Element  ${btn_continue}
    Sleep  2s
    Capture page screenshot


Filling details in Hiring Team block
    [Arguments]  ${HM_value}  ${data}
    Verify the recruiter is pre filled
    IF  "${data}[Recruiter]"!=""
        Wait And Set Text  ${recruiter}  ${data}[Recruiter]
        Wait And Click Element  //div[contains(text(),"${data}[Recruiter]")]
        Sleep  3s
        END
    IF  "${HM_value}"!=""
        Sleep    3s
        ${Hiring_manager}=  Get Element Attribute  ${HM_input_box}  value
        ${Alert}=  Run KEYWORD AND RETURN Status  should contain  ${Hiring_manager}  ${HM_value}
        Wait And Send Keys  ${HM_input_box}  ${HM_value}
        Sleep  2s
        Wait And Click Element   ${selected_value}
        Sleep  5s
        Capture Page Screenshot
        IF  "${Alert}"=="False"
            Mouse Over  ${Alert_No_btn}
            Wait And Click Element  ${Alert_No_btn}
        END
    END
    Sleep  3s
    Set Collaborator  ${data}
    Capture Page Screenshot
    Wait And Click Element  ${btn_continue}
    Sleep  3s
    Capture page screenshot


Filling details in Requisition Structure block
    [Arguments]    ${test_data}
    #Wait And Click Element  ${RT_input_box}
    Wait And Click Element  ${recruiting_type_drop_down}
    Sleep  5s
#    Select Required Value with Text  ${recruiting_type_list}  ${test_data}[Recruiting type]
    #Wait And Click Element  ${Org_input_box}
    Wait And Click Element  xpath: //li[text() = "${test_data}[Recruiting type]"]
    Sleep  3s
    Scroll Element Into View  ${selected_Org}
    Wait And Click Element  ${selected_Org}
    Sleep  2s
    Wait And Click Element  ${org_selection}
    Sleep  3s
    Scroll Element Into View  ${selected_Loc}
    Wait And Click Element  ${selected_Loc}
    Sleep  2s
    Wait And Click Element  ${loc_selection}
    Sleep  3s
    Mouse Over  ${btn_continue}
    Capture Page Screenshot
    Wait And Click Element  ${btn_continue}
    Sleep  5s
    Capture page screenshot

Save and close
    ${check}=  Run Keyword And Return Status    Wait Until Page Contains Element    ${save_close_btn}  20s
    IF  '${check}'=='True'
        Wait And Click Element  ${save_close_btn}
        Capture Page Screenshot
    ELSE
        Wait And Click Element  xpath: //*[contains(@title,'ave and Close')]
    END
    Sleep    2s
    Capture Page Screenshot

Review Basic info section
    Wait Until Page Contains  Number of Openings  20s  Basic Info section is not expanded
    Log To console  into the basic info review section
    Verify number of openings is readable
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  3s
    Capture Page Screenshot
    Log To console  basic info is reviewed.

Review Hiring team section
    Sleep  3s
    Verify the recruiter is pre filled
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Sleep  3s
    Log To console  hiring team is reviewed.

Review Requisition Structure section
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  3s
    Capture Page Screenshot
    Log To console  requisition structure is reviewed.

Add Details Info section
    Sleep  2s
    Wait And Set Text   ${work_contract_input}  No
#    Wait And Set Text   ${work_contract_input}  Yes - Short Term Contract
    Press Keys	${work_contract_input}  ENTER
    Sleep  2s
    Wait And Click Element  ${minimum_salary_input}
    Wait And Click Element  ${minimum_salary_input_selection}
    Sleep  2s
    Wait And Click Element  ${maximum_salary_input}
    Wait And Click Element  ${maximum_salary_input_selection}
    Sleep  2s
    Wait And Click Element  ${division_input}
    Wait And Click Element  ${division_select}
    Sleep  2s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  3s
    Capture Page Screenshot
    Log To console  details info is reviewed.

Add Posting Description
    [Arguments]  ${posting_description}
    Wait Until Page Contains  Short Description for Internal Candidates  20s  Posting Description section is not expanded
#    ${check}=  Run Keyword And Return Status  Wait Until Page Contains Element  ${posting_description_input}  5s  Posting Description Input text box is not displayed
#    IF  '${check}'=='False'
#        Sleep  20s
#        Click Element  ${posting_description_check_box}
#        Sleep  2s
#    END
#    Wait And Click Element  ${posting_description_input}
#    Sleep  2s
#    Wait And Set Text   ${posting_description_input}  ${posting_description}
#    Sleep  2s
#    Press Keys	${posting_description_input}  ENTER
    Sleep  3s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  3s
    Capture Page Screenshot
    Log To console  posting desc is reviewed.

Review offer info
    Sleep  2s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Sleep  3s
    Log To console  offer info is reviewed.

Review Attachment Info
    Sleep  2s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Sleep  3s
    Capture Page Screenshot
    Log To console  attachment info is reviewed.

Review Configuration Info
    [Arguments]    ${test_data}
#    Sleep  4s
#    Wait Until Element Is Visible   ${candidate_selection_process}
#    ${text_value}=  Get Element Attribute   ${candidate_selection_process}   title
#    #Should Contain     ${text_value}    ${test_data}[Recruiting type]
    Sleep  10s
    Scroll Element Into View  ${continue_button}
    Wait And Click Element  ${continue_button}
    Capture Page Screenshot
    Sleep  3s
    Log To console  configuration info is reviewed.

Review Questionnaire section
    Wait Until Page Contains  Internal Prescreening Questionnaire  20s  Questionnaire section is not expanded
    Scroll Element Into View  ${internal_questionnaire_1}
    Wait And Click Element  ${internal_questionnaire_1}
    Sleep  6s
    Scroll Element Into View  ${question_1}
    Wait And Click Element  ${question_1}
    Capture Page Screenshot

Submit Job Requisition by Reviewer
    [Arguments]  ${input_data}
    Review Basic info section
    Review Hiring team section
    Review Requisition Structure section
    Add Details Info section
    Add Posting Description   ${input_data}[Posting description]
    Review offer info
    Review Attachment Info
    Review Configuration Info   ${input_data}
#    Review Questionnaire section
    Sleep  2s
    Scroll Element Into View  ${submit_button}
    Wait And Click Element  ${submit_button}
    Capture Page Screenshot
    Log To console  Requisition is submitted.
    Sleep  10s

Set Collaborator
    [Arguments]  ${data}
#     IF  "${data}[Assistant Hiring Manager]"!=""
#        Wait And Click Element  ${collob_dropdown}
#        Select Required Value  ${xpath_template}  Assistant Hiring Manager
#        Wait And Send Keys  ${assis_hiring_manager_input}  ${data}[Assistant Hiring Manager]
#        Wait And Click Element  ${selected_value}
#    END
    IF  "${data}[HRBP]"!=""
        scroll element into view  ${collob_dropdown}
        Wait And Click Element  ${collob_dropdown}
        Sleep  2s
        Select Required Value  ${xpath_template}  HRBP
        Sleep  2s
        Wait And Send Keys  ${hrbpinput}  ${data}[HRBP]
        Sleep  2s
        Wait And Click Element  ${selected_value}
    END
    IF  "${data}[Collaborator]"!=""
        scroll element into view  ${collob_dropdown}
        Wait And Click Element  ${collob_dropdown}
        Sleep  2s
        Select Required Value  ${xpath_template}  Collaborator
        Sleep  2s
        Wait And Send Keys  ${collabinput}  ${data}[Collaborator]
        Sleep  2s
        Wait And Click Element  ${selected_value}
    END


Verify number of openings is readable
    Element Should Be Visible   ${no_of_openings_value}
    ${number_of_openings_class_name}=   Get Element Attribute   ${no_of_openings_value}  class
    Should Contain    ${number_of_openings_class_name}  ReadOnly
    Log To console  Number of openings field is displayed as 1 and the field is read-only
    Log  Number of openings field is displayed as 1 and the field is read-only

Verify the recruiter is pre filled
    ${recruiter_name_value}=    Get Element Attribute   ${recruiter_name}  value
    Should Not Be Empty    ${recruiter_name_value}
    Log To console  Recruiter name is pre filled
    Log   Recruiter name is pre filled


Submit Job Requisition for an existing requisition by Reviewer
    [Arguments]  ${input_data}
    Filling details in How block    ${input_data}
    Review Basic info section
    Review Hiring team section
    Review Requisition Structure section
    Add Details Info section
    Add Posting Description   ${input_data}[Posting description]
    Review offer info
    Review Attachment Info
    Review Configuration Info   ${input_data}
    Review Questionnaire section
    Sleep  2s
    Scroll Element Into View  ${submit_button}
    Wait And Click Element  ${submit_button}
    Capture Page Screenshot
    Log To console  Requisition is submitted.
    Sleep  4s

Get Requisition Id
    ${text}=  Wait And Get Text  ${req_para}
    ${id}=  getIdFromName  ${text}
    RETURN  ${id}

Create Pipeline Requisition
    [Arguments]  ${input_data}  ${input_data2}
    Filling details in How block for a pipeline requisition    ${input_data}
    Filling details in Basic Info block   ${input_data}[Business Justification]
    Sleep   3s
    Filling details in Hiring Team block    ${input_data2}[Hiring Manager]  ${input_data2}
    Sleep  3s
    Filling details in Requisition Structure section  ${input_data}
    Sleep  3s
    Add Details Info section
    Add Posting Description   ${input_data}[Posting description]
    Review offer info
    Upload file  ${input_data2}[File Name]
    Review Attachment Info
    Review Configuration Info   ${input_data}
    Review Questionnaire section
    Sleep  2s
    Scroll Element Into View  ${submit_button}
    Wait And Click Element  ${submit_button}
    Capture Page Screenshot


Filling details in How block for a pipeline requisition
    [Arguments]  ${input_data}
    Wait And Click Element  ${requisition_type}
    Sleep  2s
    Press Keys  ${requisition_type}   ${input_data}[Requisition Type]
    Sleep  2s
    Wait And Click Element  ${Use_input_box}
    Sleep  2s
    Select Required Value   ${xpath_template}   ${input_data}[Use]
    Sleep  2s
    IF  "${input_data}[Use]" == "Position"
    Wait And Send Keys    ${pos_input_box}     ${input_data}[position_id]
    Sleep  2s
    Wait And Click Element   ${selected_value}
    Sleep  2s
    ${business_unit_text}=   Get Element Attribute  ${business_unit_value}  value
    Log To Console  business unit text is ${business_unit_text}
    Should Contain  ${business_unit_text}  Metrolinx BU
    Capture Page Screenshot
    ELSE IF  "${input_data}[Use]" == "Existing Requisition"
    Wait And Click Element   ${requisition_drop_down}
    Sleep  2s
    Wait And Send Keys    ${requisition_drop_down}     ${input_data}[Requisition Title]
    Sleep  20s
    Wait And Click Element   ${requisition_result}
    END
    Sleep  3s
    Wait And Click Element  ${btn_continue}

Filling details in Requisition Structure section
    [Arguments]    ${test_data}
    Wait And Click Element  ${recruiting_type_drop_down}
    Sleep  5s
    Select Required Value with Text  ${recruiting_type_list}  ${test_data}[Recruiting type]
    #Wait And Click Element  ${Org_input_box}
    Sleep  3s
    Scroll Element Into View  ${selected_Org}
    Wait And Click Element  ${selected_Org}
    Wait And Click Element  ${org_selection}
    Sleep  3s
    Scroll Element Into View  ${selected_Loc}
    Wait And Click Element  ${selected_Loc}
    Wait And Click Element  ${loc_selection}
    Sleep  3s
    Mouse Over  ${btn_continue}
    Capture Page Screenshot
    Wait And Click Element  ${btn_continue}
