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
${excel}    2. TEST - RFP-2024-ITIN-512 - Technical Requirements Evaluator Scoring - All Consensus - 2024-10-21
#RFP-2024-ITIN-512 - Technical Requirements Evaluator Scoring - All Consensus - 2024-10-21 (1)
${published_negotiation}    RFP-2024-ITIN-512,2
${Evaluator_Name}    Marise
${max_pages}    20
&{Supplier_Sheet_Map}
...    ACCENTURE INC.=${{["Accenture", "Accenture Presentation"]}}
...    KPMG LLP=${{["Accenture", "Accenture Presentation"]}}
#...    NOVAMODUS SOLUTIONS INC=${{["Novamodus_Sheet1", "Novamodus_Sheet2"]}}
#...    PANDOS INTELLIGENCE INC=${{["Pandos_Sheet1", "Pandos_Sheet2"]}}
#...    VISIER SOLUTIONS INC=${{["Visier_Sheet1", "Visier_Sheet2"]}}

*** Test Cases ***
Scenario: EBS Score Entry Consensus

    Log  Step 1
    EBS Login    ${login}
    Log  Step 2
    Select Sourcing Homepage form Navigator
    Log    Step 3 - Process each supplier with corresponding worksheets
    @{suppliers}=   Get Dictionary Keys    ${Supplier_Sheet_Map}
    ${total_suppliers}=    Get Length    ${suppliers}
    FOR    ${index}    ${supplier}    ${sheets}    IN ENUMERATE    &{Supplier_Sheet_Map}
        Log    Processing Supplier: ${supplier} with Worksheets: ${sheets}
        Select Published Negotiations    ${published_negotiation}
        Select Go option for Scores Action
        Select Enter Scores for Supplier    ${supplier}

        FOR    ${sheet}    IN    @{sheets}
            Log    Step 4 - Extract internal note and enter it
            ${internal_note}=    extract internal note consensus    ${excel}    ${sheet}
            Enter Internal note on Suppliers Score page    ${internal_note}
            Log    Step 5 - Fill Scores from worksheet: ${sheet}
            IF    'Presentation' in "${sheet}"
                Select Initial Record Date for Technical Presentation Evaluation
            ELSE
                Select Initial Record Date for Technical Evaluation
            END
            FOR    ${page_num}    IN RANGE    1    ${max_pages}+1
                IF    'Presentation' in "${sheet}"
                    Fill Questions On Technical Presentation Evaluation Page For Concensus    ${excel}    ${sheet}    ${Evaluator_Name}
                    ${next_button_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath: (//span[text()='Technical Presentation Evaluation']/following::a[contains(@title,'Next')])[2]    5s
                    IF    '${next_button_visible}' == 'True'
                        Execute JavaScript    window.scrollBy(1000,0)
                        Wait Until Element Is Visible    xpath: (//span[text()='Technical Presentation Evaluation']/following::a[contains(@title,'Next')])[2]    5s
                        wait and click element    xpath: (//span[text()='Technical Presentation Evaluation']/following::a[contains(@title,'Next')])[2]
#                        Scroll To Next Button And Click
                        Sleep    5s
                    ELSE
                        Exit For Loop
                    END
                ELSE
                    Fill Questions On Technical Evaluation Page For Consensus    ${excel}    ${sheet}    ${Evaluator_Name}
                    ${locator_present}=    Run Keyword And Return Status    Element Should Be Visible    xpath: //span[text()='Technical Evaluation']/following::span[text()='Next']
                    ${next_button_visible}=    Run Keyword And Return Status    Element Should Be Visible    xpath: (//span[text()='Technical Evaluation']/following::a[contains(@title,'Next')])[2]    5s
                    IF    '${next_button_visible}' == 'True' and '${locator_present}' == 'False'
                        Execute JavaScript    window.scrollBy(1000,0)
                        Wait Until Element Is Visible    xpath: (//span[text()='Technical Evaluation']/following::a[contains(@title,'Next')])[2]    5s
                        wait and click element    xpath: (//span[text()='Technical Evaluation']/following::a[contains(@title,'Next')])[2]
#                        Scroll To Next Button And Click
                        Sleep    5s
                    ELSE
                        Exit For Loop
                    END
                END
                Sleep    3s
            END
            Sleep    2s
            Click Save as Draft on Score Enter Page
            wait until page contains element    xpath://h1[text()="Confirmation"]    10s
            Capture Page Screenshot
            Sleep    5s
        END

        ${is_last_iteration}=    Evaluate    ${index} + 1 == ${total_suppliers}
        IF    not ${is_last_iteration}
            Go to EBS Homepage
            Select Sourcing Homepage Option
        END
        Sleep    5s
    END
    Log    Step 6 - Process Completed for All Suppliers and Sheets
    Capture Page Screenshot