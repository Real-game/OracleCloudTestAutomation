*** Settings ***
Library  Selenium2Library
Resource  ../Locators/InterviewFeedback.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***

Submit interview feedback questionnaire
    Wait Until Element is Visible    ${interview_feedback_header}   20   Interview feedback header is not displayed
    ${candidate_name}=  Get Element Attribute  ${candidate_name_text}   innerHTML
    Log To Console  candidate name is ${candidate_name}
    ${requisition_title}=  Get Element Attribute  ${requisition_title_text}  innerHTML
    Log To Console  requisition name is ${requisition_title}
    Should Not Be Empty  ${candidate_name}
    Should Not Be Empty  ${requisition_title}
    Sleep  3s
    Scroll Element Into View  ${would_you_recommend_we_hire_the_person_question}
    Click Element  ${would_you_recommend_we_hire_the_person_question}
    Press keys   ${would_you_recommend_we_hire_the_person_question}   Yes
    Scroll Element Into View  ${would_you_recommend_for_another_role_question}
    Click Element  ${would_you_recommend_for_another_role_question}
    Press keys   ${would_you_recommend_for_another_role_question}   Yes
    Sleep  2s
    Scroll Element Into View  ${submit_button}
    Click Element  ${submit_button}
    Sleep  2s
    Click Element  ${yes_button}
    Sleep  2s

