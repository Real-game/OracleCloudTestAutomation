*** Settings ***
Library  Selenium2Library
Library  BuiltIn
Library  ../Keywords/CommonKeywords.py
Library  ../Helpers/Helpers.py
Library  ../Helpers/ebs_test.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/CustomKeywords.robot
Resource  ../Locators/EbsScoreEntry.robot
Library    Collections  # To use the `Run Keyword And Return Status` function

*** Keywords ***
EBS Login
    [Arguments]  ${user_id}
    ${password} =  Get Password  ${user_id}
    Login  ${ebs_txt_userid}  ${user_id}  ${ebs_txt_pass}  ${password}  ${ebs_btn_submit}
    Sleep  3s
#    wait until page contains element    ${ebs_homepage_title}    20s    Homepage is not displaying or failed to load
    capture page screenshot

Select Sourcing Homepage form Navigator
#    Wait And Click Element    ${ebs_navigator}
#    Sleep    2s
    wait until page contains element    ${ebs_evaluator_option}    20s    MX SC Collaboration option not visible
    Wait And Click Element    ${ebs_evaluator_option}
    Sleep    2s
    Wait And Click Element    ${ebs_sourcing_option}
    Sleep    2s
    capture page screenshot
    Sleep  2s
    wait and click element    ${ebs_sourcing_homepage_option}
    Sleep   2s
    capture page screenshot

Select Published Negotiations
    [Arguments]    ${RFQ_number}
    ${rfq_xpath} =    catenate   SEPARATOR=  //a[@title='${RFQ_number}']
    Sleep    2s
    Wait And Click Element    ${rfq_xpath}
    Sleep    3s
    ${rfq_header_xpath} =    catenate   SEPARATOR=  //h1[contains(text(),"${RFQ_number}")]
    wait until page contains element    ${rfq_header_xpath}    20s    RFQ : ${RFQ_number} title not visible
    capture page screenshot

Select Go option for Scores Action
    ${Enter_Scores_text} =   get text    ${ebs_scores_dropdown}
    ${check} =    Run Keyword And Return Status    Should Be Equal  ${Enter_Scores_text}  Enter Scores    RFQ Actions is not selected as Enter Scores
    capture page screenshot
    IF  '${check}'=='False'
        wait and click element    ${ebs_score_drop}
        Sleep    2s
        select required value with text    ${ebs_score_value}    Enter Scores
#        Fail  Expected text is "Enter Scores" and actual text is ${Enter_Scores_text}
    END
    Sleep    5s
    Wait And Click Element    ${ebs_scores_go_button}
    Sleep    2s
    wait until page contains    Enter Scores By Quote    20s    Enter Scores By Quote page is not displayed
    capture page screenshot

Select Enter Scores for Supplier
    [Arguments]    ${supplier_name}
    ${xpath} =    Catenate   SEPARATOR=  (//a[contains(text(),'${supplier_name}')]/following::img[@title='Scores'])[1]
    Wait And Click Element    ${xpath}
    Sleep    2s
    capture page screenshot

Enter Internal note on Suppliers Score page
    [Arguments]    ${note}
    wait and set text    ${ebs_internal_note}    ${note}
#    Sleep    2s
    capture page screenshot

Get Text of question
    [Arguments]    ${index}
    ${q} =    get text    xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])[${index}]
    log to console   question:_${q}_

Get Text From First Or Second Locator
    [Arguments]    ${LOCATOR_TYPE_1}    ${LOCATOR_TYPE_2}
    ${is_present1}=    Run Keyword And Return Status    Element Should Be Visible    ${LOCATOR_TYPE_1}
    IF    ${is_present1}
        ${text}=    Get Text    ${LOCATOR_TYPE_1}
    ELSE
        ${text}=    Get Text    ${LOCATOR_TYPE_2}
    END
    RETURN    ${text}

#Fill Questions On Current Page
Fill Questions On Technical Evaluation Page
    [Arguments]    ${excel}    ${sheetname}
    ${count}=    get element count      xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])
    ${count}=  Evaluate  ${count}+${1}
    FOR    ${index}    IN RANGE    1    ${count}
        ${ques_xpath}=  catenate   SEPARATOR=  xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"]//td[1])[${index}]
        ${ques_xpath1}=    catenate    SEPARATOR=  xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])[${index}]
#       ((//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])/span)[1]
        ${question}=    Get Text From First Or Second Locator    ${ques_xpath}    ${ques_xpath1}
        ${score}    ${note}=    GET QUESTION DETAILS FROM EXCEL    ${excel}   ${question}    ${sheetname}
        ${score_xpath}=    catenate   SEPARATOR=  xpath: (//input[contains(@id,'Score') and @type='text'])[${index}]
        ${note_xpath}=    catenate   SEPARATOR=  xpath: (//input[contains(@id,'Note') and @type='text'])[${index}]
        ${score}=    validate_score    ${score}
        Input text    ${score_xpath}    ${score}
        Sleep    2s
        Input Text    ${note_xpath}     ${note}
    END

Fill Questions On Technical Evaluation Page For Consensus
    [Arguments]    ${excel}    ${sheetname}    ${Evaluator_Name}
    ${count}=    get element count      xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])
    ${count}=  Evaluate  ${count}+${1}
    FOR    ${index}    IN RANGE    1    ${count}
        ${ques_xpath}=  catenate   SEPARATOR=  xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"]//td[1])[${index}]
        ${ques_xpath1}=    catenate    SEPARATOR=  xpath: (//table[contains(@id,"Requirements:0")]//td[@class="x1t x50"][1])[${index}]
        ${question}=    Get Text From First Or Second Locator    ${ques_xpath}    ${ques_xpath1}
        ${score}    ${note}=    GET EVALUATOR QUESTION DETAILS FROM EXCEL    ${excel}   ${question}    ${sheetname}    ${Evaluator_Name}
        ${score_xpath}=    catenate   SEPARATOR=  xpath: (//input[contains(@id,'Score') and @type='text'])[${index}]
        ${note_xpath}=    catenate   SEPARATOR=  xpath: (//input[contains(@id,'Note') and @type='text'])[${index}]
        ${score}=    validate_score    ${score}
        Input text    ${score_xpath}    ${score}
#        Sleep    2s
        Enter Internal Comments for Technical Evaluation Requirements  ${index}   ${note_xpath}   ${note}
#        Input Text    ${note_xpath}     ${note}
    END

Scroll To Next Button And Click
    # Scroll horizontally to make the Next button visible and then click
    Execute JavaScript    window.scrollBy(1000,0)
    Wait Until Element Is Visible    ${ebs_next_button}    5s
    wait and click element    ${ebs_next_button}

Click Save as Draft on Score Enter Page
    Wait And Click Element    ${EBS_SAVE_AS_DRAFT}
    Sleep    2s
    capture page screenshot

Click Submit Score on Scroe Enter Page
    Wait And Click Element    ${ebs_submit_score}
    Sleep    2s
    capture page screenshot

Enter Requirement Name in Add Requirement Page
    [Arguments]    ${name}
    Wait And Set Text    ${ebs_requirement_name_inp}    ${name}
#    Sleep    2s
    capture page screenshot

Select Type of Requirement
    [Arguments]    ${type}
    scroll element into view    ${ebs_req_type_dropDown}
    Wait And Click Element    ${ebs_req_type_dropDown}
#    Sleep    2s
    select required value with text     ${ebs_req_type_value}    ${type}
    capture page screenshot

Select Value Type of Requirement
    [Arguments]    ${type}
    scroll element into view    ${ebs_value_type_dropDown}
    Wait And Click Element    ${ebs_value_type_dropDown}
    Sleep    2s
    select required value with text    ${ebs_value_type_value}    ${type}
    capture page screenshot

Select Scoring Method of Requirement
    [Arguments]    ${method}
    scroll element into view    ${ebs_scoring_method_dropDown}
    Wait And Click Element    ${ebs_scoring_method_dropDown}
#    Sleep    2s
    select required value with text     ${ebs_scoring_method_value}    ${method}
    Sleep    3s
    capture page screenshot

Select Apply and Add Requirement
    Wait And Click Element    xpath:(//button[@title="Apply and Add Requirement"])[2]
    Sleep    2s
    capture page screenshot

Select Apply in Add Requirement
    Wait And Click Element    xpath://button[@id="Apply"]
    Sleep    2s
    capture page screenshot

Go to EBS Homepage
    Wait And Click Element    xpath:(//img[@title='Home'])[2]
    Sleep    2s
    capture page screenshot

Select Sourcing Homepage Option
    ${checker} =    RUN KEYWORD AND RETURN STATUS    wait until element is visible    ${ebs_sourcing_homepage_option}    20s
    IF  '${checker}'=='True'
        Wait And Click Element    ${ebs_sourcing_homepage_option}
        Sleep    2s
        capture page screenshot
    ELSE
        Select Sourcing Homepage form Navigator
        CAPTURE PAGE SCREENSHOT
    END

Fill Questions On Technical Presentation Evaluation Page
    [Arguments]    ${excel}    ${sheetname}
    ${count}=    get element count      xpath: (//span[text()='Technical Presentation Evaluation']/following::div//following::table[contains(@id,"Requirements")]//td[@class="x1t x50"][1])
    ${count}=  Evaluate  ${count}+${1}
    FOR    ${index}    IN RANGE    1    ${count}
        ${technical_presentation_xpath}=    catenate    SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::div//following::table[contains(@id,"Requirements")]//td[@class="x1t x50"][1])[${index}]
        ${question}=    Get Text    ${technical_presentation_xpath}
        ${score}    ${note}=    GET QUESTION DETAILS FROM EXCEL    ${excel}   ${question}    ${sheetname}
        ${score_xpath}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::input[contains(@id,'Score') and @type='text'])[${index}]
        ${note_xpath}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::input[contains(@id,'Note') and @type='text'])[${index}]
        ${score}=    validate_score    ${score}
        Input text    ${score_xpath}    ${score}
#        Sleep    2s
        Enter Internal Comments for Technical Presentation Requirements   ${index}    ${note_xpath}     ${note}
#        Input Text    ${note_xpath}     ${note}
    END

Fill Questions On Technical Presentation Evaluation Page For Concensus
    [Arguments]    ${excel}    ${sheetname}    ${Evaluator_Name}
    ${count}=    get element count      xpath: (//span[text()='Technical Presentation Evaluation']/following::div//following::table[contains(@id,"Requirements")]//td[@class="x1t x50"][1])
    ${count}=  Evaluate  ${count}+${1}
    FOR    ${index}    IN RANGE    1    ${count}
        ${technical_presentation_xpath}=    catenate    SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::div//following::table[contains(@id,"Requirements")]//td[@class="x1t x50"][1])[${index}]
        ${question}=    Get Text    ${technical_presentation_xpath}
        ${score}    ${note}=    GET EVALUATOR QUESTION DETAILS FROM EXCEL    ${excel}   ${question}    ${sheetname}    ${Evaluator_Name}
        ${score_xpath}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::input[contains(@id,'Score') and @type='text'])[${index}]
        ${note_xpath}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::input[contains(@id,'Note') and @type='text'])[${index}]
        ${score}=    validate_score    ${score}
        Input text    ${score_xpath}    ${score}
#        Sleep    2s
        Enter Internal Comments for Technical Presentation Requirements    ${index}    ${note_xpath}     ${note}
#        Input Text    ${note_xpath}     ${note}
    END

Enter Internal Comments for Technical Presentation Requirements
    [Arguments]   ${index}    ${xpath}    ${value}
    ${check_length} =    get length    ${value}
    IF    ${check_length}>230
        ${note_xpath1}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Presentation Evaluation']/following::a[contains(@id,'IntComDetailsImage')])[${index}]
        Wait And Click Element    ${note_xpath1}
        Sleep    5s
        select frame    xpath: //iframe[@title="Internal Comments" and contains(@style,"visibility: visible")]
        wait until element is visible    ${internal_note_textarea}    10s
        input text    ${internal_note_textarea}    ${value}
        Wait And Click Element    ${internal_comments_save}
        Sleep    2s
        element should be visible    xpath: //div[text()="Internal Comments has been updated"]    5s
        unselect frame
        Execute javascript  window.scrollTo(0,-document.body.scrollHeight)
        scroll element into view    xpath: //div[@aria-hidden="false"]//child::a[@title="Close Popup"]
        wait and click element    xpath: //div[@aria-hidden="false"]//child::a[@title="Close Popup"]
#        unselect frame
        capture page screenshot
    ELSE
        Input Text    ${xpath}     ${value}
    END
    capture page screenshot

Enter Internal Comments for Technical Evaluation Requirements
    [Arguments]   ${index}    ${xpath}    ${value}
    ${check_length} =    get length    ${value}
    IF    ${check_length}>230
        ${note_xpath1}=    catenate   SEPARATOR=  xpath: (//span[text()='Technical Evaluation']/following::a[contains(@id,'IntComDetailsImage')])[${index}]
        Wait And Click Element    ${note_xpath1}
        Sleep    5s
        select frame    xpath: //iframe[@title="Internal Comments" and contains(@style,"visibility: visible")]
        wait until element is visible    ${internal_note_textarea}    10s
        input text    ${internal_note_textarea}    ${value}
        Wait And Click Element    ${internal_comments_save}
        Sleep    2s
        element should be visible    xpath: //div[text()="Internal Comments has been updated"]    5s
        unselect frame
        Execute javascript  window.scrollTo(0,-document.body.scrollHeight)
        scroll element into view    xpath: //div[@aria-hidden="false"]//child::a[@title="Close Popup"]
        wait and click element    xpath: //div[@aria-hidden="false"]//child::a[@title="Close Popup"]
#        unselect frame
        capture page screenshot
    ELSE
        Input Text    ${xpath}     ${value}
    END
    capture page screenshot


Select Initial Record Date for Technical Presentation Evaluation
    wait and click element    ${ebs_presentation_eval_record_date_set}
    Sleep    2s
    wait and click element    xpath: //span[text()='Technical Presentation Evaluation']/following::select[@title='Select record set'][1]/option[1]
    Sleep    3s
    capture page screenshot

Select Initial Record Date for Technical Evaluation
    wait and click element    xpath: //span[text()='Technical Evaluation']/following::select[@title='Select record set'][1]
    Sleep    2s
    wait and click element    xpath: //span[text()='Technical Evaluation']/following::select[@title='Select record set'][1]/option[1]
    Sleep    3s
    capture page screenshot

