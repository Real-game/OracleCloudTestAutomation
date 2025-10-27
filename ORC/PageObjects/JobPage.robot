*** Settings ***
Library  Selenium2Library
Library  Collections
Resource  ../Locators/JobPage.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Verify Job Details
    [Arguments]  ${min_sal}  ${max_sal}  ${job_type}
    ${v_list}=  Create List  ${job_type}  ${min_sal}  ${max_sal}
    @{list}=  Create List
    ${matching_elements}=  Get WebElements   ${xpath_temp}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        Append To List  ${list}  ${text}
    END
    List Should Contain Sub List  ${list}  ${v_list}
    Log To Console  job Specifications are matching


Click on Apply
    Wait And Click Element  ${apply_btn}
#    Wait Until Page Contains  Job Application Questions
    Capture Page Screenshot


