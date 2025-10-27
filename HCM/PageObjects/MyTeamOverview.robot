*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/MyTeamOverview.robot

*** Keywords ***
Select Employee By Name
    [Arguments]  ${value}
    Sleep  5s
    Click Element  ${search_text_box_my_team}
    Input Text  ${search_text_box_my_team}  ${value}
    Sleep  2s
    Click Element  ${search_button}
    Wait Until Page Contains  ${value}  20s  Searched person: ${value} is not listed
    wait and click element  link:${value}
    Sleep  5s
    Capture Page Screenshot

Click Show More
    Wait And Click Element  ${href_showmore}
    Sleep  3s
    Capture Page Screenshot

Click On Skills and Qualification
    Wait And Click Element  ${skill_n_qualification}
    Wait Until Page Contains  Skills and Qualifications   20s   Skills and Qualifications page is not displayed
    Sleep  3s
    Capture Page Screenshot

Upload file
    [Arguments]  ${file}
    IF  "${file}"!=""
        Wait And Click Element  ${Attach_img}
        Wait And Click Element  ${Attach_file}
        Sleep  5s
        Attach File  ${file}
        execute javascript  window.scrollTo(0,document.body.scrollHeight)
        Capture Page Screenshot
    END

Click Save
    Wait And Click Element  ${save_btn}
    Sleep  2s
    Capture Page Screenshot

Expand Attachments and Edit
    [Arguments]  ${file}
    Wait And Click Element  ${attachment_dropdown}
    Sleep  2s
    Scroll element into view  ${edit_option}
    Wait And Click Element  ${edit_option}
    Sleep  2s
    Upload file  ${file}
    Click Save

Click And Verify All Pages Should Be Visible
    Wait And Click Element  ${href_skills_and_qualification}
    page should contain  Skills and Qualifications
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_career_evelopment}
    page should contain  Career Development
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_performance}
    page should contain  Performance
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_feedback}
    page should contain  Feedback
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_document_records}
    page should contain  Document Records
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_employment_info}
    page should contain  Employment Info
    Sleep  2s
    capture page screenshot
    Wait And Click Element  ${href_compensation}
    page should contain  Compensation
    Sleep  2s
    capture page screenshot

Select The Employee By Name
    [Arguments]  ${value}
    Sleep  2s
    ${checker}=  RUN KEYWORD And Return Status  Wait and click element  link:${value}
    IF  '${checker}' == 'False'
        wait and click element  link:${value}
    END
    Sleep  5s
    Capture Page Screenshot

Click On Compensation
    Wait And Click Element  ${compensation}
    Wait Until Page Contains  Compensation   20s   Compensation page is not displayed
    Sleep  5s
    Capture Page Screenshot

Verify Compensation page
    Wait Until Page Contains  Current Salary  20s  Current Salary option is not displayed in Compensation page
    ${salary}=  Wait And Get Text  ${current_salary}
    Log  Current Salary : ${salary}
    Sleep  3s
    Capture Page Screenshot

Click On Performance On Employment Info Page
    Wait And Click Element  ${href_performance}
    page should contain  Performance
    Sleep  2s
    capture page screenshot

Click on Employment Info Performance
    Wait And Click Element  ${performance}
    Wait Until Page Contains  Performance   20s   Performance page is not displayed
    Sleep  3s
    Capture Page Screenshot

Get Compensation page Info
    Wait Until Page Contains  Current Salary  20s  Current Salary option is not displayed in Compensation page
    Sleep    5s
    ${salary}=  Wait And Get Text  ${current_salary_value}
    Log  Current Salary : ${current_salary_value}
    Capture Page Screenshot
    ${annual_salary}=   Wait And Get Text  ${annual_salary_value}
    Log  Annual Current Salary : ${annual_salary_value}
    [return]  ${salary}  ${annual_salary}
