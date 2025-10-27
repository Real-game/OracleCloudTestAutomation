*** Settings ***
Library  Selenium2Library
Resource  ../Locators/Jobs.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Search Job
    [Arguments]  ${job_id}
    Wait And Send Keys  ${input_search_jobs}  ${job_id}
    Wait And Click Element  ${img_search}
    Sleep  20s
    ${xpath}=   Catenate  SEPARATOR=  //div/a/span[contains(text(),'${job_id}')]
    Wait Until Element Is Visible  ${xpath}
    Capture Page Screenshot
    Wait And Click Element  ${xpath}
    Wait Until Page Contains  Job Info  20  Job info header is not displayed
    Capture Page Screenshot

Search for the job and click on actions
    [Arguments]     ${job_id}
    Clear Element Text  ${input_search_jobs}
    Wait And Send Keys  ${input_search_jobs}  ${job_id}
    Sleep  3s
    Wait And Click Element  ${img_search}
    Wait Until Element Is Visible  ${searched_job}  10s
    Capture Page Screenshot
    Sleep  2s
    Wait And Click Element  ${actions_drop_down}
    Sleep  2s

Click on Refer A candidate option
    Wait And Click Element  ${refer_a_candidate_option}


Click on Refer An Employee option
    Wait And Click Element  ${refer_an_employee_option}

Click on Referral tab
    Wait And Click Element  ${referral_tile}

Verify the submitted referral
    [Arguments]  ${job_id}  ${candidate_name}
    Wait Until Page Contains  Candidates You Referred  20  Referrals page is not displayed
    ${xpath_value}=  Catenate   SEPARATOR=   //span[text()[contains(.,'     ${candidate_name}   ')]]//ancestor::table[contains(@class,'xkg')]//a[contains(@title,'   ${job_id}   ')]
    Wait Until Page Contains Element  xpath: ${xpath_value}  20  Referral is not displayed
    Capture Page Screenshot

Click on Jobs Done button
    Wait And Click Element  ${jobs_done_button}