*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/Compensation.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Run Grade Step Progression
    Wait And Click Element  ${run_grade_step_progression}
    Wait And Verify Page Contains Text  Run Grade Step Progression  20s  Run Grade Step Progression page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Synchronize Grade Step Rates
    Wait And Click Element  ${synchronize_grade_step_rates}
    Wait And Verify Page Contains Text  Synchronize Grade Step Rates  20s  Synchronize Grade Step Rates page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on View Administrative Reports
    Wait And Click Element  ${view_administrative_reports}
    Wait And Verify Page Contains Text  Administration Reports  20s  Administration Reports page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Run Batch Processes Reports
    Wait And Click Element  ${run_batch_process}
    Wait And Verify Page Contains Text  Run Batch Processes  20s  Run Batch Processes page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on WorkForce Compensation Plans
    Wait Until Page Contains  Workforce Compensation Plans  20s  Workforce compensation plans link is not displayed
    Capture Page Screenshot And Retry If Required
    SCROLL ELEMENT INTO VIEW  ${workforce_compensation_plans}
    Wait And Click Element  ${workforce_compensation_plans}

Click Option under Workforce Compensation
    [Arguments]  ${option}
    ${w_c_xpath}=  Catenate   SEPARATOR=  //h2[text()='Workforce Compensation']//following::a[text()='${option}']
    scroll element into view  ${w_c_xpath}
    Wait And Click Element  ${w_c_xpath}
    Wait Until Page Contains  ${option}  20s  ${option} page is not displayed
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click on Act as Proxy Manager
    Wait Until Page Contains  Act as Proxy Manager  20s  Act as Proxy Manager link is not displayed
    Scroll Element Into View  ${act_as_proxy_manager}
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Click Element  ${act_as_proxy_manager}
    Wait Until Page Contains  Workforce Compensation:  20s  Proxy Manager page is not displayed
    Capture Page Screenshot And Retry If Required

Click Option in Compensation page
    [Arguments]  ${option}
    ${compensation_option_xpath}=  Catenate   SEPARATOR=  //a[text()='${option}']
    scroll element into view  ${compensation_option_xpath}
    Wait And Click Element  ${compensation_option_xpath}
    Wait Until Page Contains  ${option}  20s  ${option} page is not displayed
    Capture Page Screenshot And Retry If Required
