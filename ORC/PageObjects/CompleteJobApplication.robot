*** Settings ***
Library  Selenium2Library
Library   ../Helpers/Helpers.py
Resource  ../Locators/CompleteJobApplication.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Answer Questions
    [Arguments]  ${dic}
    Wait Until Page Contains  Complete Job Application  20s  Complete Job Application page is not displayed
    @{key_list}=  Get Dictionary Keys  ${dic}
    Sleep  5s
    ${matching_elements}=  Get WebElements   ${no_of_ques}
    FOR  ${element}  IN  @{matching_elements}
          ${title}=  Get Element Attribute  ${element}  title
          ${status}=  Run Keyword And Return Status  List Should Contain Value  ${key_list}  ${title}
          IF  '${status}'=='True'
            ${input_xpath}=  formsXpathForQuestions  ${xpath_form}  ${title}
            Log   ${input_xpath}
            ${check}=  Run Keyword And Return Status  Wait Until Element Is Visible  ${input_xpath}  5s
            IF  '${check}'=='True'
                Wait And Send Keys  ${input_xpath}  ${dic}[${title}]
                Wait And Click Element  ${JAQ_title}
            ELSE
                ${input_xpath}=  formsXpathForQuestions  ${xpath_form_textarea}  ${title}
                Wait And Send Keys  ${input_xpath}  ${dic}[${title}]
            END
          END
          Sleep  3s
    END
    Capture Page Screenshot
    Click on Continue


Upload Resume
    [Arguments]  ${file}
    Sleep  5s
    Wait And Click Element  ${Attach_img}
    Wait And Click Element  ${Attach_file}
    Attach File  ${file}
    execute javascript  window.scrollTo(0,document.body.scrollHeight)
    Capture Page Screenshot
    Click on Continue

Click on Continue
    Wait And Click Element  ${cont_btn}
    Sleep  3s

Sign Signature
    [Arguments]  ${sign}
    Wait And Send Keys  ${sign_input}  ${sign}
    Capture Page Screenshot

Click on Submit Job Application
    Wait And Click Element  ${sub_button}
    #Wait Until Page Contains  Job Info
    Capture Page Screenshot

