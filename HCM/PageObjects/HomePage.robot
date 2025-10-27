*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/HomePage.Robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Apply MX Accruals Bank Validation Report
     Capture Page Screenshot
     Click Element  ${catalog_link}
     Wait Until Page Contains  Shared Folder  20s  Shared Folder is not displayed
     Capture Page Screenshot
     Click Element  ${shared_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Click Element  ${custom_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Click Element  ${metrolinx_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Click Element  ${reports_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Click Element  ${payroll_report_folder_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Sleep  2s
     Click Element  ${pay_rep_017_expand_icon}
     Sleep  2s
     Capture Page Screenshot
     Wait Until Page Contains  MX_Accrual Banks Validation for BEE Report  20s
     Click Element  ${mx_accrual_bank_report_open_link}
     Sleep  45s
     #Wait Until Page Contains  Apply  20s
     Capture Page Screenshot
     #Scroll Element Into View  ${apply_button}
     Select Frame   ${apply_form}
     Sleep  3s
     Click Element  ${apply_button}
     Sleep  10s
     Capture Page Screenshot

click on homepage
    wait and click element  ${icon_home}
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Go to my client group absence
    wait and click element  ${href_my_client}
    Mouse Over  ${href_absences}
    Capture Page Screenshot
    Click Link  ${href_absences}
    Wait And Verify Page Contains Text  Absence Administration   20s  Absence Administraion page is not displayed
    Capture Page Screenshot

Go to my client group person management
    wait and click element  ${href_my_client}
    Sleep  3s
    Click Element  ${href_person_management}
    Wait And Verify Page Contains Text  Person Management: Search   20s  Person Management page is not displayed
    Capture Page Screenshot And Retry If Required

Go to my client group Manage Positions
    wait and click element  ${href_my_client}
    Sleep  3s
    Wait And Click Element  ${href_showmore}
    Sleep  3s
    Wait And Click Element  ${href_managepositions}
    Sleep  3s
    Wait Until Element Contains  ${header}  Manage Positions
    Capture Page Screenshot

Click On Personal Information
    wait and click element  ${href_personal_information}
    Sleep  3s
    Capture Page Screenshot

Go To My Team
    wait and click element  ${href_MyTeam}
    Sleep  3s
    Capture Page Screenshot

Click My Team Icon
    wait and click element  ${href_My_Team_Icon}
    Sleep  3s
    Capture Page Screenshot and Retry If Required

Go to my client groups show more
    wait and click element  ${href_my_client}
    Mouse Over  ${show_more}
    Click Link  ${show_more}
    Sleep  3s
    Capture Page Screenshot

Click on Termination under Employment
    Wait And Click Element  ${termination}
    Wait until page contains  Termination  20s  Termination page is not displayed
    Sleep  2s
    Capture Page Screenshot

Click Settings And Action Menu
    wait and click element  ${profile_downarrow}
    Sleep  3s
    capture page screenshot

Select Setup And Maintenance
    wait and click element  ${href_setup_maintenance}
    Sleep  3s
    capture page screenshot

Click on Benefits
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_me}
    Wait And Click Element  ${nvg_benefits}
    Wait Until Page Contains  Benefits   20s  Benefits page is not displayed
    Capture Page Screenshot

Go to my client group New Position
    wait and click element  ${href_my_client}
    Capture Page Screenshot
    Wait And Click Element  ${href_new_person}
    Wait Until Page Contains  New Person  20s  New person page is not displayed
    Capture Page Screenshot

Click on Personal info
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_me}
    Capture Page Screenshot
    Wait And Click Element  ${nvg_personal_info}
    Wait Until Page Contains  Personal Details  20s  Personal Info page is not displayed
    Capture Page Screenshot

Click Add Assignment Under Employment Section
    Sleep  3S
    Wait And Click Element  ${href_add_assignment}
    Sleep  5S
    Wait Until Page Contains  Add Assignment  20s  Add Assignment page not visible
    Capture Page Screenshot

Click Change Assignment Under Employment Section
    Sleep  3S
    Wait And Click Element  ${href_change_assignment}
    Sleep  5S
    Wait Until Page Contains  Change Assignment  20s  Change Assignment page not visible
    Capture Page Screenshot

Click Employment Info Under Employment Section
    Wait And Click Element  ${href_employment_info}
    Wait Until Page Contains  Employment Info  20s  Employment Info page not visible
    Capture Page Screenshot

Click on My Team in My Team
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_my_team}
    Wait And Click Element  ${nvg_my_team_option}
    ${my_team_checker}=  Run Keyword and Return Status   Wait Until Page Contains  My Team  20s  My Team page is not displayed
    IF  '${my_team_checker}'=='False'
        Wait Until Page Contains  My Team  20s  My Team page is not displayed
    END
    Sleep  5s
    Capture Page Screenshot And Retry If Required

Click on My Client Group
    [Arguments]  ${group}
    Wait And Click Element  ${navigator}
    wait and click element  ${nvg_my_client_group}
    ${mcg_xpath}=  Catenate   SEPARATOR=  //div[contains(@id,'3_groupNode_workforce_management')]//a[@title='${group}']
    Wait And Click Element  ${mcg_xpath}
    Wait And Verify Page Contains Text  Person Management: Search   20s  Person Management page is not displayed
    Capture Page Screenshot

Click on Hire An Employee
    Sleep  3s
    Capture Page Screenshot
    Wait And Click Element  ${hire_an_employee_link}
    Wait Until Page Contains  What info do you want to manage  20s  Hire an employee page is not displayed
    Capture Page Screenshot

Click Contact Info Under Employment Section
    Wait And Click Element  ${href_contact_info}
    Wait Until Page Contains  Contact Info  20s  Change Assignment page not visible
    Sleep  2S
    Capture Page Screenshot

Click Termination Under Employment Section
    Wait And Click Element  ${href_termination}
    Wait Until Page Contains  Termination  20s  Termination page not visible
    Sleep  2S
    Capture Page Screenshot

click on Nevigator
    Wait And Click Element  ${nevigator_icon}
    Sleep  3s
    capture page screenshot

Select On Tools
    Wait And Click Element  ${nevigator_tools}
    Sleep  3s
    capture page screenshot

Click Link Reports and Analytics
    Wait And Click Element  ${nevigator_tools_report_analytics}
    Sleep  3s
    wait until page contains  Reports and Analytics  20  Reports and Analytics page not found
    capture page screenshot

Click on Seniority Dates
    Wait And Click Element  ${seniority_dates}
    Wait Until Page Contains  Seniority Dates  20s  Seniority Dates page is not visible
    Sleep  2S
    Capture Page Screenshot

Click Option under Employment Section
    [Arguments]  ${group}
    ${mcg_xpath}=  Catenate   SEPARATOR=  //h4[text()='Employment']//following::a[text()='${group}']
    Wait And Click Element  ${mcg_xpath}
    Wait Until Page Contains  ${group}  20s  ${group} page is not displayed
    Sleep  2s
    Capture Page Screenshot

Click Create Work Relationship Under Employment Section
    Wait And Click Element  ${href_create_work_relationship}
    Wait Until Page Contains  Create Work Relationship  20s  Create Work Relationship page not visible
    Sleep  2S
    Capture Page Screenshot

Click Calculation Cards Under Employment Section
    Wait And Click Element  ${href_calculation_cards}
    Wait Until Page Contains  Calculation Cards  20s  Calculation Cards page not visible
    Sleep  2S
    Capture Page Screenshot And Retry If Required

Click on Payroll from Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_my_client_group}
    Capture Page Screenshot
    Wait And Click Element  ${nvg_payroll}
    Sleep  3s
    Wait And Verify Page Contains Text  Calculation Cards  20s  Payroll detail page is not displayed
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Go To My Client Group
    wait and click element  ${href_my_client}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Compensation
    Wait And Click Element  ${href_compensation}
    Wait And Verify Page Contains Text  Base Pay  20s  Compensation page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Career And Performance
    Wait And Click Element  ${href_career_and_performance}
    Wait And Verify Page Contains Text  Career and Performance  20s  Career and Performance page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On Performance
    Wait And Click Element  ${performance_option}
    Wait And Verify Page Contains Text   Performance  20s  Performance page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Me
    Wait And Click Element  ${href_me}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Change Salary Under Compensation Section
    Wait And Click Element  ${change_salary}
    Wait And Verify Page Contains Text  Change Salary  20s  Change Salary page not visible
    Sleep  2S
    Capture Page Screenshot And Retry If Required

Click on Benefits Administration
    Wait And Click Element  ${nvg_benefits_administration}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Enrollment
    Wait And Click Element  ${href_enrollment}
    Wait And Verify Page Contains Text   Benefits Service Center  20s  Benefits Service Center page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On Pay Under Me
    Mouse Over  ${href_me_pay}
    Wait And Click Element  ${href_me_pay}
    Wait And Verify Page Contains Text   Pay  20s  Pay page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Payroll
    Wait And Click Element  ${href_payroll}
    Wait And Verify Page Contains Text   Payroll  20s  Payroll page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Pay
    Wait And Click Element  ${href_pay}
    Wait And Verify Page Contains Text   Pay  20s  Pay page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Pay from Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_me}
    Capture Page Screenshot
    Wait And Click Element  ${nvg_pay}
    Wait Until Page Contains  My Payslips  20s  Pay page is not displayed
    Capture Page Screenshot

Click Benefits Administration
    Wait And Click Element  ${href_benefits_administration}
    Wait Until Page Contains  Enrollment  20s  Benefits Administration page not visible
    Sleep  3S
    Capture Page Screenshot And Retry If Required

Click Enrollment Under Benefits Administration
    Wait And Click Element  ${enrollment_under_benefits_administration}
    Wait Until Page Contains  Benefits Service Center  20s  Benefits Service Center page not visible
    Sleep  3S
    Capture Page Screenshot

Click on Hiring Under My Team
    Sleep  3s
    Wait And Click Element  ${href_Hiring}
    Wait And Verify Page Contains Text   Job Requisitions  20s  Job Requisitions page not found
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Add a Contingent Employee
    Sleep  3s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${add_a_contingent_employee_link}
    Wait And Verify Page Contains Text   Add a Contingent Employee  20s  Add a contingent employee page is not displayed
    Capture Page Screenshot And Retry If Required

Verify Me, My client groups and Tools Tab
    Sleep  2s
    Verify Page Has Hyperlink  Me
    Verify Page Has Hyperlink  My Client Groups
    Verify Page Has Hyperlink  Tools

Verify My client groups apps
    Sleep  2s
    Verify Page Has Hyperlink  Person Management
    Verify Page Has Hyperlink  Profiles

Click on Show More and Verify Quick Action Section
    Wait And Click Element  ${href_showmore}
    Page Should Contain Element  ${compensation_section}
    Page Should Contain Element  ${talent_section}
    Wait And Click Element  ${show_less}

Click on Show More and Verify Talent Quick Action Section
    Wait And Click Element  ${href_showmore}
    Page Should Contain Element  ${talent_section}
    Sleep  3s
    Wait And Click Element  ${show_less}
    Sleep  5s

Verify My Team, My client groups, Benefits Administrations and Tools Tab
    Sleep  2s
    Verify Page Has Hyperlink  My Team
    Verify Page Has Hyperlink  My Client Groups
    Verify Page Has Hyperlink  Benefits Administration
    Verify Page Has Hyperlink  Tools

Verify My CLient Groups apps for Rewards Representative
    Sleep  5s
    Verify Page Has Hyperlink  Person Management
    Verify Page Has Hyperlink  Compensation
    Verify Page Has Hyperlink  Goals
    Verify Page Has Hyperlink  Performance
    Verify Page Has Hyperlink  Profiles
    Verify Page Has Hyperlink  Career Development
    Verify Page Has Hyperlink  Workforce Structures

Verify Quick Actions Link for Rewards Representative
    Sleep  2s
    Verify Page Has Hyperlink  Person
    Verify Page Has Hyperlink  Employment Info
    Verify Page Has Hyperlink  Talent Profile
    Verify Page Has Hyperlink  Performance Goals
    Verify Page Has Hyperlink  Profiles
    Verify Page Has Hyperlink  Setup of Performance Goals Mass Assignment


Verify Homepage have options
    [Arguments]  ${option1}  ${option2}  ${option3}
    IF  "${option1}"!=""
        Verify Page Has Hyperlink  ${option1}
    END
    IF  "${option2}"!=""
        Verify Page Has Hyperlink  ${option2}
    END
    IF  "${option3}"!=""
        Verify Page Has Hyperlink  ${option3}
    END
    Sleep  2s

Verify My Client Groups have Apps and Quick action
    [Arguments]  ${option1}  ${option2}  ${option3}  ${option4}
    IF  "${option1}"!=""
        Verify Page Has Hyperlink  ${option1}
    END
    IF  "${option2}"!=""
        Verify Page Has Hyperlink  ${option2}
    END
    IF  "${option3}"!=""
        Verify Page Has Hyperlink  ${option3}
    END
    IF  "${option4}"!=""
        Verify Page Has Hyperlink  ${option4}
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Click Person Management
    Wait And Click Element  ${href_person_management}
    Wait And Verify Page Contains Text  Person Management  20s  Person Management page is not displayed
    Capture Page Screenshot And Retry If Required

Click on Tools
    Wait And Click Element  ${tools}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Verify Homepage have Apps
    [Arguments]  ${option1}
    IF  "${option1}"!=""
        Sleep  2s
        Verify Page Has Hyperlink  ${option1}
    END
    Sleep  2s
    capture page screenshot and retry if required

Verify Tab Or App And Hyperlink
    [Arguments]  ${app_or_tab_name}
    Wait And Verify Page Contains Text  ${app_or_tab_name}  20s  ${app_or_tab_name} tab/app not found on homepage
    Verify Page Has Hyperlink  ${app_or_tab_name}

Click On Tools Tab
    Wait And Click Element  ${href_tools}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click On Others Tab
    Wait And Click Element  ${href_others}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click Reports and Analytics
    Wait And Click Element  ${href_report_and_analytics}
    Sleep  3s
    wait until page contains  Reports and Analytics  20  Reports and Analytics page not found
    capture page screenshot and retry if required

Click on Performance under My Team via Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_my_team}
    Sleep  2s
    Wait And Click Element  ${navigator_performance}
    Wait And Verify Page Contains Text  Evaluate Performance  20s  Evaluate Performance page is not displayed
    Capture Page Screenshot And Retry If Required

Click on Journeys in Home Page
    Wait Until Page Contains  Journeys  20s  Journeys option is not displayed in the home page me tab
    Capture Page Screenshot
    Click Element  ${href_journeys}
    Wait Until Page Contains  My Journeys  30s  Journeys page is not displayed
    Capture Page Screenshot

Click on Current Jobs
    Wait And Click Element  ${href_current_jobs}
    wait and verify page contains text  Current Jobs  20s  Current Jobs page is not displayed
    Capture Page Screenshot And Retry If Required

Click on Career and performance from Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_me}
    Capture Page Screenshot
    Wait And Click Element  ${navigator_career_performance}
    Wait Until Page Contains  Career and Performance  20s  Career and Performance page is not displayed
    Capture Page Screenshot

Select MX Mandatory Vaccination Report
    Sleep  3s
    Wait And Click Element  ${mx_mand_vacc_rep}
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Career and Performance under Me via Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_me}
    Sleep  2s
    Wait And Click Element  ${nvg_career_and_performance}
    Wait And Verify Page Contains Text  Career and Performance  20s  Career and performance page is not displayed
    Capture Page Screenshot And Retry If Required

Click on My Client Compensation from Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${nvg_my_client_group}
    Capture Page Screenshot
    Wait And Click Element  ${nvg_compensation}
    Wait And Verify Page Contains Element  ${header_compensation}  20s  Compensation page is not displayed
    Capture Page Screenshot And Retry If Required


Verify Me and Tools Tab
    Sleep  2s
    Verify Page Has Hyperlink  Me
    Verify Page Has Hyperlink  Tools

Verify App And Hyperlink in Tabs
    [Arguments]  ${app_name}  ${tab_name}
    Wait And Verify Page Contains Text  ${app_name}  20s  ${app_name} app not found on ${tab_name} tab
    Verify Page Has Hyperlink  ${app_name}

Verify Apps for MX Employee Self Service
    Sleep  2s
    Verify Page Has Hyperlink  Journeys
    Verify Page Has Hyperlink  Checklist Tasks
    Verify Page Has Hyperlink  Pay
    Verify Page Has Hyperlink  Absences
    Verify Page Has Hyperlink  Career and Performance
    Verify Page Has Hyperlink  Personal Information
    Verify Page Has Hyperlink  Benefits
    Verify Page Has Hyperlink  Current Jobs
    Verify Page Has Hyperlink  Hiring
    Verify Page Has Hyperlink  Employment Confirmation Letter

Click on Show More and Employment Info
    Wait And Click Element  ${href_showmore}
    Wait And Click Element  ${employment_info_quick_actions}

Verify My Team tab apps for MX Employee Self Service
    Sleep  2s
    Verify Page Has Hyperlink  My Team
    Verify Page Has Hyperlink  Journeys
    Verify Page Has Hyperlink  Hiring
    Verify Page Has Hyperlink  Career Overview
    Verify Page Has Hyperlink  Performance
    Verify Page Has Hyperlink  MX Complement and Vacancy Report
    Verify Page Has Hyperlink  MX Employee List
    Verify Page Has Hyperlink  MX Employee Leave Balance Report
    Verify Page Has Hyperlink  MX Employee Sick Absences Report
    Verify Page Has Hyperlink  MX Departures Report
    Verify Page Has Hyperlink  MX Mandatory Vaccination Report

Verify My Client Groups Tab is not present
    Sleep  3s
    ${checker}=  Run Keyword and Return Status  element should not be visible  ${href_my_client}  Old UI Pages is accessible
    IF  '${checker}'=='False'
        element should not be visible  ${href_my_client}  Old UI Pages is accessible
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify My Teams Tab is not present
    Sleep  3s
    ${checker}=  Run Keyword and Return Status  element should not be visible  ${href_MyTeam}  My Teams Tab is not present
    IF  '${checker}'=='False'
        element should not be visible  ${href_MyTeam}  My Teams Tab is not present
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Verify Me tab apps for MX Manager Self Service
    Sleep  2s
    Verify Page Has Hyperlink  Journeys
    Verify Page Has Hyperlink  Checklist Tasks
    Verify Page Has Hyperlink  Pay
    Verify Page Has Hyperlink  Absences
    Verify Page Has Hyperlink  Career and Performance
    Verify Page Has Hyperlink  Personal Information
    Verify Page Has Hyperlink  Benefits
    Verify Page Has Hyperlink  Current Jobs
    Verify Page Has Hyperlink  Roles and Delegations
    Verify Page Has Hyperlink  Employment Confirmation Letter
    Verify Page Has Hyperlink  Hiring

Click on an Employee and Check Details
    ${checker}=  Run Keyword and Return Status  element should be visible  ${employee_reporting_to_manager}  Direct Reportee is not seen
    IF  '${checker}'=='False'
        element should be visible  ${employee_reporting_to_manager}  Direct Reportee is not seen
    END
    Sleep  2s
    Capture Page Screenshot And Retry If Required
    Wait And Click Element  ${employee_reporting_to_manager}
    Wait And Verify Page Contains Element  ${assigment_section_header}  20s  Assignement details is not present
    Wait And Verify Page Contains Element  ${managers_section_header}  20s  Managers details is not present
    Wait And Verify Page Contains Element  ${additional_assigment_section_header}  20s  Additional Assigment Info details is not present
    Wait And Verify Page Contains Element  ${employment_history_section_header}  20s  Employment History details is not present
    Sleep  3s

Click on Payroll Calculation under Payroll via Navigator
    Wait And Click Element  ${navigator}
    Wait And Click Element  ${payroll_header}
    Sleep  2s
    ${checker}=  Run Keyword and Return Status  Wait And Click Element  ${payroll_calcualtion}
    IF  '${checker}'=='False'
        Wait And Click Element  ${payroll_header}
        Sleep  2s
        Wait And Click Element  ${payroll_calcualtion}
    END
    Wait And Verify Page Contains Text  Payroll Calculation  20s  Career and performance page is not displayed
    Capture Page Screenshot And Retry If Required

Click on Quick Actions - Person and search
    [Arguments]  ${personnumber}
    Wait And Click Element  ${quick_action_person_link}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${personnumber}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Click on Quick Actions - Document Records and search
    [Arguments]  ${personnumber}
    Wait And Click Element  ${quick_action_document_records}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${personnumber}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Search for Person in Responsive UI
    [Arguments]  ${personnumber}
    Wait And Set Text  ${search_text_box}  ${personnumber}
    Sleep  2s
    Wait And Click Element  xpath: //div[text() = "${personnumber}"]
    Sleep  3s
    Capture Page Screenshot And Retry If Required

Go to my client group Payroll
    [Arguments]  ${group}
    wait and click element  ${href_my_client}
    Sleep  3s
    Wait And Click Element  ${href_showmore}
    Sleep  3s
    ${mcg_xpath}=  Catenate   SEPARATOR=  //h4[text()='Payroll']//following::a[text()='${group}']
    Wait And Click Element  ${mcg_xpath}
    Wait Until Page Contains  ${group}  20s  ${group} page is not displayed
    Sleep  2s
    Capture Page Screenshot
#    Wait And Click Element  ${href_calculationcards_payroll}
#    Sleep  5s
#    Capture Page Screenshot