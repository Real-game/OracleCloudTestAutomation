*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/CreatePositionPositionDetails.robot

*** Keywords ***

Add Position Description
    [Arguments]  ${status_value}  ${department_value}  ${job_value}  ${full_time_or_part_time_value}  ${regular_or_temporary_value}  ${org_chart_is_assistant_value}
    Wait And Send Keys  ${status}  ${status_value}
    Sleep  5s
    Wait And Set Text  ${department}  ${department_value}
    Sleep  5s
    Wait And Set Text  ${job}  ${job_value}
    Sleep  3s
    Wait And Send Keys  ${full_time_or_part_time}  ${full_time_or_part_time_value}
    Sleep  3s
    Wait And Send Keys  ${regular_or_temporary}  ${regular_or_temporary_value}
    Sleep  3s
    Wait And Set Text  ${org_chart_is_assistant}  ${org_chart_is_assistant_value}
    Sleep  5s
    Capture Page Screenshot

Add Hiring Information
    [Arguments]  ${hiring_status_value}  ${type_value}  ${FTE_value}  ${head_count_value}  ${overlap_allowed_value}
    Wait And Send Keys  ${hiring_status}  ${hiring_status_value}
    Sleep  3s
    Wait And Send Keys  ${type}  ${type_value}
    Sleep  3s
    #Wait And Set Text  ${FTE}  ${FTE_value}
    ${checker}=  RUN KEYWORD And Return Status  Wait And Set Text  ${FTE}  ${FTE_value}
    IF  '${checker}' == 'False'
        Wait And Set Text  ${FTE}  ${FTE_value}
    END
    Sleep  5s
    #Wait And Set Text  ${head_count}  ${head_count_value}
    ${checker}=  RUN KEYWORD And Return Status  Wait And Set Text  ${head_count}  ${head_count_value}
    IF  '${checker}' == 'False'
        Wait And Set Text  ${head_count}  ${head_count_value}
    END
    Sleep  3s
    IF  "${overlap_allowed_value}" == "Yes"
        Wait And Click element  ${overlap_allowed_yes}
    END
    Capture Page Screenshot


