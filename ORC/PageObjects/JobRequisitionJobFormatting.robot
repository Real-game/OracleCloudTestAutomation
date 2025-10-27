*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/JobRequisitionJobFormatting.robot
*** Keywords ***
Edit Employer Description
     Wait And Click Element  ${Employer_description_edit_button}
     Sleep  2s
     Wait And Click Element  ${internal_dropdown}
     Wait And Click Element  ${select}
     Sleep  5s
     Wait And Click Element  ${employer_check_box}
     Wait And Click Element  ${save_button}

Edit Recruiting Organization Description
    Wait And Click Element  ${Recruiting_description_edit_button}
    Sleep  2s
#    Wait And Click Element  ${internal_dropdown}
#    Wait And Click Element  ${select}
#    Sleep  5s
#    Wait And Click Element  ${employer_check_box}
    Wait And Click Element  ${save_button}


Add Media
    [Arguments]    ${title_value}   ${url_value}   ${type_value}  ${visibility_value}  ${offer_value}
    Sleep  15s
    Wait And Click Element  ${add_button_media}
    Sleep  3s
    Wait And Click Element  ${title_input}
    Sleep  2s
    Wait And Set Text  ${title_input}  ${title_value}
#    Wait And Click Element  ${url_input}
    Wait And Set Text  ${url_input}  ${url_value}
    Sleep  2s
    Wait And Click Element  ${type_dropdown}
    Sleep  2s
    Select Required Value   ${type_option}   ${type_value}
    Sleep  2s
    Wait And Click Element  ${visibility_dropdown}
    Sleep  2s
    Select Required Value   ${visibility_option}   ${visibility_value}
    Sleep  2s
    Wait And Click Element  ${offer_dropdown}
    Sleep  2s
    Select Required Value   ${offer_option}   ${offer_value}
    Sleep  5s
    Wait And Click Element  ${save_button}
