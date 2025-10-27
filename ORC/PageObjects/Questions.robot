*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/Questions.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Select Subscriber
    [Arguments]  ${value}
    Wait And Click Element  ${subscriber_dropdown}
    Select Required Value  ${sub_temp}  ${value}
    Sleep  2s
    Capture Page Screenshot

Select Question Library
    [Arguments]  ${value}
    Wait And Click Element  ${questionlibrary_dropdown}
    ${xpath}=  formXpath  ${library_temp}  ${value}
    Sleep  3s
    Wait And Click Element  ${xpath}
    Sleep  2s
    Capture Page Screenshot

Search Question Code
    [Arguments]  ${value}
    Wait And Send Keys  ${keyword_search}  ${value}
    Capture Page Screenshot

Click on Search
    Wait And Click Element  ${search_btn}
    Sleep  2s
    Capture Page Screenshot

Select Question and Click on Edit
    [Arguments]  ${value}
    Wait And Click Element  ${questionlibrary_dropdown}
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Not Contain  No data to display.
#    IF  "${status}"!="True"
#        Select Question Library  ${value}
#        Sleep  2s
#        Click on Search
#        ${status}=  Run Keyword And Return Status  Page Should Not Contain  No data to display.
#    END
    IF  "${status}"=="True"
        Wait And Click Element  ${edit_btn}
#        Wait Until Page Contains  Edit Question
        Wait Until Element is visible   ${edit_question_header}     20s     Edit Question page not displayed
        Capture Page Screenshot
    ELSE
        Capture page Screenshot
        Log  No question with the given id
        Sleep  60s
        Fail
    END


