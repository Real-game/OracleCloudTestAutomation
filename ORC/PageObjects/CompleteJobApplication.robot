*** Settings ***
Library  Selenium2Library
Library   ../Helpers/Helpers.py
Resource  ../Locators/CompleteJobApplication.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Answer Questions
    [Arguments]  ${dic}
    Sleep    5s
    wait until page contains   Job Application  20s  Job Application page is not displayed
    Sleep    15s
    ${status}=  run keyword and return status   element should be visible    ${pip_plan}
    IF  "${status}"=="True"
        scroll element into view    ${pip_plan}
        Sleep    2s
        Wait And Click Element  ${pip_plan}
        Sleep  2s
        Select Required Value  ${list_value}  ${dic}[Are you currently placed on a Performance Improvement Plan due to unsatisfactory performance in your current role?]
    END
    Sleep    5s
    ${status}=  run keyword and return status   element should be visible    ${internal_mobility_policy}
    IF  "${status}"=="True"
        scroll element into view    ${internal_mobility_policy}
        Sleep    2s
        ${xpath}=   Catenate  SEPARATOR=    //*[normalize-space(contains(text(),"Internal Mobility Policy"))]//ancestor::oj-label-value//oj-option[text()="${dic}[Internal Mobility Policy]"]
        wait and click element    ${xpath}
        Sleep  2s
        capture page screenshot
    END
    ${status}=  run keyword and return status   element should be visible    ${current_role_12_month}
    IF  "${status}"=="True"
        scroll element into view    ${current_role_12_month}
        Sleep    2s
        ${xpath1}=   Catenate  SEPARATOR=    //*[text()="Have you been in your current role for 12 months?"]/ancestor::oj-label-value//oj-option[contains(text(),"${dic}[Have you been in your current role for 12 months?]")]
        wait and click element    ${xpath1}
        Sleep  2s
        capture page screenshot
    END
    ${status}=  run keyword and return status   element should be visible    ${contract_or_temp_assignment}
    IF  "${status}"=="True"
        scroll element into view    ${contract_or_temp_assignment}
        Sleep    2s
        ${xpath1}=   Catenate  SEPARATOR=    //*[text()="Are you currently on a contract and/or on a temporary assignment?"]/ancestor::oj-label-value//oj-option[contains(text(),"${dic}[Are you currently on a contract and/or on a temporary assignment?]")]
        wait and click element    ${xpath1}
        Sleep  2s
        capture page screenshot
    END
#    @{key_list}=  Get Dictionary Keys  ${dic}
#    Sleep  5s
#    ${matching_elements}=  Get WebElements   ${no_of_ques}
#    FOR  ${element}  IN  @{matching_elements}
#          ${title}=  Get Element Attribute  ${element}  title
#          ${status}=  Run Keyword And Return Status  List Should Contain Value  ${key_list}  ${title}
#          IF  '${status}'=='True'
#            ${input_xpath}=  formsXpathForQuestions  ${xpath_form}  ${title}
#            Log   ${input_xpath}
#            log to console    ${input_xpath}
#            ${check}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${input_xpath}  10s
#            IF  '${check}'=='True'
#                select checkbox    ${input_xpath}
##                Wait And Send Keys  ${input_xpath}  ${dic}[${title}]
##                Wait And Click Element  ${JAQ_title}
#            ELSE
#                ${input_xpath}=  formsXpathForQuestions  ${xpath_form_textarea}  ${title}
#                Wait And Send Keys  ${input_xpath}  ${dic}[${title}]
#            END
#          END
#          Sleep  3s
#    END
    Capture Page Screenshot
#    Click on Continue


Upload Resume
    [Arguments]  ${file}
    Sleep  5s
    wait and click element    xpath: //div[contains(@aria-label,"Drag and Drop")]
#    Wait And Click Element  ${Attach_img}
#    Wait And Click Element  ${Attach_file}
    Attach File  ${file}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Capture Page Screenshot
#    Click on Continue

Click on Continue
    Wait And Click Element  ${cont_btn}
    Sleep  3s

Sign Signature
    [Arguments]  ${sign}
    Wait And Send Keys  ${sign_input}  ${sign}
    Capture Page Screenshot

Click on Submit Job Application
    Wait And Click Element  ${sub_button}
    Sleep    10s
    Wait Until Page Contains    Submitted Applications    20s
    Capture Page Screenshot

