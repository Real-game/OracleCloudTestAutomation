*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/EbsScoreEntry.robot
Library  ../Helpers/Helpers.py
Library  ../Helpers/ebs_test.py
Library    Collections
Documentation  EBS - Technical Evaluation - Scoring Entry

*** Settings ***
Suite Setup  Before Suite for EBS
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***

${login}    MARISEC
${excel}   TestFile RFP Entry
${published_negotiation}    RFP-2024-ITIN-512,2
#RFQ-2024-PROC-634
${max_pages}    20
&{Supplier_Sheet_Map}
...    ACCENTURE INC.=EntrySheet
...    KPMG LLP=EntrySheet

*** Test Cases ***
Scenario: EBS Score Entry

    Log  Step 1 - 3
    EBS Login    ${login}
    Sleep    10s
#    EBS Login    ${login}
    Log  Step 4 - 6
    Select Sourcing Homepage form Navigator
    Log    Step 7 - Process each supplier with corresponding worksheet
    @{suppliers}=    collections.get dictionary keys    ${supplier_sheet_map}
    Log    ${suppliers}
    ${total_suppliers}=    Get Length    ${suppliers}
    Log    Total Suppliers: ${total_suppliers}
    FOR    ${index}    ${supplier}    ${sheet}    IN ENUMERATE     &{Supplier_Sheet_Map}
        Log    Processing Supplier: ${supplier} with Worksheet: ${sheet}
        Select Published Negotiations    ${published_negotiation}
        Log  Step 8
        Select Go option for Scores Action
        Log  Step 9
        Select Enter Scores for Supplier    ${supplier}
        Log  Step 10 - 18
        ${internal_note}=    extract internal note    ${excel}    ${sheet}
        Enter Internal note on Suppliers Score page    ${internal_note}
        FOR    ${page_num}    IN RANGE    1    ${max_pages}+1
            Fill Questions On Technical Evaluation Page    ${excel}    ${sheet}
            ${next_button_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath: (//a[contains(text(),'Next')])[2]    5s
            IF    '${next_button_visible}' == 'True'
                Scroll To Next Button And Click
                Sleep    5s
            ELSE
                Exit For Loop
            END
            Sleep    3s
#            Sleep    5s
        END
        Sleep    2s
        Click Save as Draft on Score Enter Page
        wait until page contains element    xpath://h1[text()="Confirmation"]    10s
        capture page screenshot
        Sleep    10s
#       Click Submit Score on Scroe Enter Page
        # If it's not the last iteration, go back to the homepage
        ${is_last_iteration}=    Evaluate    ${index} + 1 == ${total_suppliers}
        IF    not ${is_last_iteration}
            Go to EBS Homepage
            Select Sourcing Homepage Option
        END
#        Run Keyword Unless    ${is_last_iteration}    Go to EBS Homepage
#        Run Keyword Unless    ${is_last_iteration}    Select Sourcing Homepage Option
        Sleep    5s
    END
    capture page screenshot
