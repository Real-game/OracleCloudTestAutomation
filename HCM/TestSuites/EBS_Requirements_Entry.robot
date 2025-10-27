*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/EbsScoreEntry.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/ebs_test.py
Documentation  EBS - Technical Evaluation - Requirements Entry

*** Settings ***
Suite Setup  Before Suite for EBS
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***

#ACCENTURE INC.
#IBM CANADA LIMITED
#Infosys Public Services, Inc.
#KPMG LLP
#ORACLE CANADA ULC

${login}    SWAGATIKAR
${excel}   TestFile RFP Entry
${Sheetname}    EntrySheet
${column}    D
${row}    3
${published_negotiation}    129688-6
#RFP-2024-ITIN-512,2
#RFQ-2024-PROC-634
#129688-3
#${internal_note}      Testing
${supplier}    ACCENTURE
${max_pages}    15
${BASE_NAME}    Technical_Description_
${type}    Internal Optional
${value_type}    Text
${score_method}    Manual

*** Test Cases ***
Scenario: EBS Requirement Entry

#    EBS Login    ${login}
    Sleep    150s
#    EBS Login    ${login}
#    ${ebs_header_xpath}=  Catenate   SEPARATOR=  xpath://h1[text()="Add Requirement (RFQ ${published_negotiation})"]
#    wait until page contains element    ${ebs_header_xpath}    20s    Webpage Header Not displayed
    ${values}=    GET COLUMN VALUES   ${excel}    ${Sheetname}    ${column}    ${row}
    ${length}=    Get Length    ${values}
    FOR    ${index}    IN RANGE    ${length}
        ${value}=    Get From List    ${values}    ${index}
        ${requirement_name}=    Set Variable    ${BASE_NAME}${index + 1}
        Log    Inputting value: ${value} with unique name: ${requirement_name}
        Enter Requirement Name in Add Requirement Page  ${requirement_name}
        Select Type of Requirement    ${type}
#        Sleep    2s
        Select Value Type of Requirement    ${value_type}
        Select Scoring Method of Requirement    ${score_method}
        Sleep    3s
        Wait Until Element Is Visible    xpath=//td[@title='Requirement']//iframe    10s    Iframe not loaded
        Select Frame    xpath=//td[@title='Requirement']//iframe

        ${escaped_value}=    Replace String    ${value}    "    \\"
        Execute JavaScript    document.body.innerText = "${escaped_value.replace('\n', '\\n')}";
        unselect frame
        capture page screenshot
#        Sleep    2s
        ${is_last}=    Evaluate    ${index} == ${length} - 1
        # Run different keywords based on whether it's the last iteration
        Run Keyword If    not ${is_last}    Select Apply and Add Requirement
        Run Keyword If    ${is_last}    Select Apply in Add Requirement
        Sleep    3s
    END
    Sleep    10s
    capture page screenshot