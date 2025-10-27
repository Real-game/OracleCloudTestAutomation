*** Settings ***
Library  ../Helpers/Helpers.py
Library  AutoItLibrary
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ChecklistTask.robot

*** Keywords ***

Complete Personal information task
    Wait Until Page Contains  Personal Details  20s  Personal Information task is not displayed
    Wait And Click Element   ${personal_information_chevron_icon}
    Wait And Click Element   ${go_to_application_task_link}
    Wait Until Page Contains   Biographical Info  20s   Biographical Info text is not displayed
    ${country_value}=  Get Element Attribute  ${country_text}   innerHTML
    ${start_date_value}=  Get Element Attribute  ${start_date_text}   innerHTML
    ${marital_status_value}=    Get Element Attribute  ${marital_status_text}   innerHTML
    ${gender_value}=    Get Element Attribute  ${gender_text}   innerHTML
    Wait And Click Element  ${biographical_info_expand_icon}
#    ${date_of_birth_value}=  Get Element Attribute  ${date_of_birth_text}   innerHTML
    Should Not Be Empty  ${country_value}
    Should Not Be Empty  ${start_date_value}
#    Should Not Be Empty  ${marital_status_value}
#    Should Not Be Empty  ${gender_value}
#    Should Not Be Empty  ${date_of_birth_value}
    Wait And Click Element  ${personal_details_done}
    Wait Until Page Contains  Welcome to Metrolinx   20s
#    Wait And Click Element  ${checklist_done_button}

Complete Emergency details task
    Wait Until Page Contains  Family and Emergency  20s  Family and Emergency details task is not displayed
    Click Element   ${family_and_emergency_details_chevron_icon}
    Wait And Click Element   ${go_to_application_task_link}
    Wait Until Page Contains   My Contacts  20s   My contacts text is not displayed
    Wait And Click Element  ${add_contact_button}
    Wait And Click Element  ${create_a_new_contact_link}

Click on back button in Checklist task
    Capture Page Screenshot
    Wait And Click Element  ${personal_details_done}

Click on Done button of a checklist task
    Capture Page Screenshot
    Wait And Click Element  ${checklist_done_button}
    Sleep  100s

Complete Direct Deposit task
    Wait Until Page Contains  Direct Deposit  20s  Direct Deposit task is not displayed
    Click Element   ${direct_deposit_chevron_icon}
    Scroll Element Into View  ${direct_deposit_chevron_icon}
    Wait And Click Element   ${go_to_application_task_link}
    Wait Until Page Contains   My Banking Information  20s   My banking information text is not displayed


Complete Banking task
#    Wait Until Page Contains  Direct Deposit  20s  Direct Deposit task is not displayed
    Click Element   ${Banking_chevron_icon}
    Scroll Element Into View  ${Banking_chevron_icon}


Complete tax form instructions task
    Wait Until Page Contains  Tax Form Instructions  20s  Tax form instructions task is not displayed
    Click Element   ${tax_form_instructions_chevron_icon}
    Scroll Element Into View  ${tax_form_instructions_chevron_icon}
    Scroll Element Into View  ${more_actions}
    Wait And Click Element   ${more_actions}
    Sleep  3s
    Wait And Click Element   ${add_to_calendar_option}

Complete TD1 Tax forms task
    Wait Until Page Contains  Tax Forms-TD1  20s  Tax forms-TD1 task is not displayed
    Wait and Click Element   ${tax_forms_td1_chevron_icon}
    Sleep  5s
    Scroll Element Into View   ${file_picker_icon}
    Wait And Click Element  ${file_picker_icon}

Upload file
    [Arguments]  ${file}
    IF  "${file}"!=""
        Scroll Element Into View   ${file_picker_icon}
        Wait And Click Element  ${file_picker_icon}
        Attach File  ${file}
        execute javascript  window.scrollTo(0,document.body.scrollHeight)
        Capture Page Screenshot
    END
    Sleep  20s

Complete TD1ON Tax forms task
    Wait Until Page Contains  Tax Forms-TD1ON  20s  Tax forms-TD1ON task is not displayed
    Click Element   ${tax_forms_td1ON_chevron_icon}
    Sleep  5s
    Scroll Element Into View   ${file_picker_icon}
    Wait And Click Element  ${file_picker_icon}
    Capture Page Screenshot

Complete AODA training task
    [Arguments]   ${candidate_name}
    Wait Until Page Contains  AODA Training  20s  AODA Training task is not displayed
    Click Element   ${aoda_training_chevron_icon}
    Sleep  5s
    Scroll Element Into View   ${signer_name_input}
    Wait And Click Element  ${signer_name_input}
    Sleep  5s
    Input Text  ${signer_name_input}  ${candidate_name}
    Sleep  5s
    Capture Page Screenshot

Complete OHSA Training task
    Wait Until Page Contains  OHSA Training  20s  OHSA Training task is not displayed
    Click Element   ${ohsa_training_chevron_icon}
    Sleep  5s
    Scroll Element Into View   ${file_picker_icon}
    Wait And Click Element  ${file_picker_icon}
    Capture Page Screenshot
