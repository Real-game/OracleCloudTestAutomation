*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Library  ../Keywords/CommonKeywords.py
Resource  ../Locators/UpdatePosition.robot

*** Keywords ***

Click On Edit Then Update Position
    wait and click element  ${Edit_button}
    Sleep  2s
    Select Required Value  ${Edit_action}   Update
    Sleep  5s
    Capture Page Screenshot

Check Effective Date
    ${date}=  get_current_date_dd_mmm_yyyy
    Wait Until Element Is Visible   ${get_effective_date_selected}      10s
    element attribute value should be  ${get_effective_date_selected}  value  ${date}
    Capture Page Screenshot

Select Action Reason And Click OK
    [Arguments]  ${reason}
    Wait And Send Keys  ${action_reason}  ${reason}
    Sleep  3s
    wait and click element  ${ok_button}
    Capture Page Screenshot

Update Details
    [Arguments]  ${type_value}  ${count_value}  ${FTE_value}  ${warning_y_n}
    IF  "${type_value}"!=""
        Wait And Send Keys  ${type}  ${type_value}
    END
    IF  "${FTE_value}"!=""
        Wait And Set Text  ${FTE}  ${FTE_value}
        Wait And Click Element  ${page_header}
        Sleep  3s
        ${warning_check}=  Run Keyword and Return Status  wait until element is visible  ${warning_button_Yes}  10s
        IF  '${warning_check}'=='True'
            Capture Page Screenshot And Retry If Required
            ${warning}=  get text  ${warning_message}
            IF  '${warning_y_n}'!=''
                Wait And Click Element  xpath://button[span[text()="${warning_y_n}"]]
                Log to console  ${warning}
            ELSE
                Fail  Failed with warning : ${warning}
            END
        END
    END
    Sleep  5s
    IF  "${count_value}"!=""
        mouse over  ${head_count}
        Sleep  3s
        Wait And Set Text   ${head_count}  ${count_value}
        Wait And Click Element  ${page_header}
        Sleep  3s
        ${warning_check}=  Run Keyword and Return Status  wait until element is visible  ${warning_button_Yes}  10s
        IF  '${warning_check}'=='True'
            Capture Page Screenshot And Retry If Required
            ${warning}=  get text  ${warning_message}
            IF  '${warning_y_n}'!=''
                Wait And Click Element  xpath://button[span[text()="${warning_y_n}"]]
                Log to console  ${warning}
            ELSE
                Fail  Failed with warning : ${warning}
            END
        END
    END
    Sleep  5s
    capture page screenshot

Update Details Quick Action
    [Arguments]  ${regular_temporary_value}  ${fulltime_parttime_value}
    Wait And Send Keys  ${fulltime_parttime}  ${fulltime_parttime_value}
    Sleep  5s
    Wait And Send Keys  ${regular_temporary}  ${regular_temporary_value}
    Sleep  5s
    capture page screenshot

Click Review Button
    Wait And Click Element  ${review_button}
    Sleep  5s
    ${error_check}=  Run Keyword and Return Status  wait until element is visible  ${error_message}  10s  Error in review details
    IF  '${error_check}'=='True'
        ${error}=  get text  ${error_message}
        Fail  Failed with error : ${error}
    END
    Capture Page Screenshot
