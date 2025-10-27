*** Variables ***
${icon_home}    xpath://a[@title="Home"]
${href_MyTeam}  id:groupNode_manager_resources
${href_Hiring}  link:Hiring
${href_my_client}   id:groupNode_workforce_management
${href_CJR}  link:Create Job Requisition
${href_CJ}  link:Current Jobs
${header}  xpath: //td/div/h1
${href_showmore}  link:Show More
${href_questions}  link:Questions
${header_SA}  xpath: //div/h1[text()[contains(.,"Opportunity Marketplace")]]

${home_notifications}  xpath://a/*[name()="svg" and contains(@aria-label,"Notifications")]
${search_input}  xpath://input[following-sibling::label[text()="Search"]]
${search_image}  xpath://a/*[name()="svg" and contains(@aria-label,"Search")]
${notification_temp}  xpath://a[contains(@class,'xmo title')]
${mouse_over_1}  xpath://span[text()="Salary Basis"]
${mouse_over_2}  xpath://h2/span[b[text()="Job Offer Team"]]
${mouse_over_3}  xpath://h2/span[b[text()="Approval History"]]
${approve_btn}  xpath://button[text()="Approve"]
${sub_btn}  xpath://a/span[text()="Submit"]

${notifications_icon}   xpath: //a[contains(@title,'Notifications')]
${interview_schedule_notification}   xpath: //td/a[contains(@title,'Your interview for the job')][contains(@title,'scheduled')]
${interview_scheduled_window_header}    xpath: //h4[text()[contains(.,'Your interview has been scheduled!')]]
${interview_detail_link}    xpath: //a[text()[contains(.,'interview details')]]
${reject_btn}  xpath://button[text()="Reject"]
${temp}  xpath://ul/li[contains(@class,"x1n6")]
${notifi_dropdown}  xpath://a[@id="pt1:_UISatr:0:soc1::drop"]
${notification_temp2}  xpath://div/table/tbody/tr[2]/td[2]/a[1]
${calendar_attachment_link}     xpath: //a[text()[contains(.,'calendar attachment')]]
${interview_calendar_link}      xpath: //a[text()[contains(.,'interview calendar')]]
${schedule_interview_notification}   xpath: //td/a[contains(@title,'Schedule your interview')]
${pending_notification_drop_down}        xpath: //a[contains(@id,'soc1')]
${all_notifications_link}        xpath: //li[text()[contains(.,'All Notifications')]]
${me_link}                       xpath: //a[text()[contains(.,'Me')]]
${roles_and_delegations_link}    xpath://a[text()[contains(.,'Roles and Delegations')]]
${notification_search_text_box}  xpath: //input[contains(@placeholder,'Search')][@class='x25']
${notifications_search_icon}     xpath: //button[contains(@title,'Search')]
${complete_the_questionnaire_notification}  xpath: //a[contains(@class,'xne')][contains(@title,'interview')]
${submit_feedback_link}      xpath: //a[text()[contains(.,'Submit Feedback')]]
${current_jobs_link}    xpath://a[text()[contains(.,'Current Jobs')]]

${hmp_respond}  xpath://a[contains(text(),"Respond")]
${pjo_download}  xpath://a[span[text()="Download"]]
${pjo_accept}  xpath://a[span[text()="Accept"]]
${pjo_decline}  xpath://button[text()="Decline"]
${dreason_dropdown}  xpath://div[label[text()="Reason"]]/following-sibling::div//a
${do_comment_input}  xpath://div[label[text()="Comment"]]/following-sibling::div/textarea
${do_sub}  xpath://a[span[text()="Sub"]]
${employee_name_input}  xpath://div[span[label[text()="Employee Name"]]]/following-sibling::div//input
${h_notifi_search}  xpath://input[@placeholder='Search']
${mcg_show_more}  xpath://a[text()="Show More" and contains(@id,"workforce")]
${mcg_pending_employee}  xpath://a[text()="Pending Employees"]
#${manage_job_offer}  xpath:(//a[text()="Manage Job Offers"])[2]
${manage_job_offer}  xpath://a[text()="Manage Job Offers"]

${notification_item1}    xpath://a[contains(@class,'title x31i xmr')]

${agency_hiring_link}   xpath: //div[contains(@id,'Agency_Hiring')]//a
${show_all_notifications_link_home_page}   xpath: //button[text()="Show All"]
${show_all_notifications_btn}   xpath:  //button[contains(@title,'Show All')]
${journeys_link}   link: Journeys
${me_tab}       id: groupNode_my_information

${hmp_respond}  xpath://a[contains(text(),"Respond")]
${pjo_download}  xpath://a[span[text()="Download"]]
${pjo_accept}  xpath://a[span[text()="Accept"]]
${pjo_decline}  xpath://button[text()="Decline"]
${dreason_dropdown}  xpath://div[label[text()="Reason"]]/following-sibling::div//a
${do_comment_input}  xpath://div[label[text()="Comment"]]/following-sibling::div/textarea
${do_sub}  xpath://a[span[text()="Sub"]]
${employee_name_input}  xpath://div[span[label[text()="Employee Name"]]]/following-sibling::div//input
${h_notifi_search}  xpath://input[@placeholder='Search']

${agency_hiring_link}   xpath: //div[contains(@id,'Agency_Hiring')]//a
${show_all_notifications_link}   xpath: //a[text()[contains(.,'Show All')]]
${journeys_link}   link: Journeys
${employee_task_notification}   xpath: //a[contains(@title,'Tasks')][contains(@title,'MX Candidate Journeys')]
${new_job_notification}   xpath: //a[contains(@title,'New job requisition')]
${new_job_requisition_hyperlink}   xpath: //span/a

${take_action_alert}  xpath: //a[text()="Click here to take action."]
${submit_offer_approval}  xpath: //a[@accesskey="m"]
${tools}  xpath: //a[text()="Tools"]
${scheduled_processes}  xpath: //a[text()="Scheduled Processes"]
${personal_details}  xpath: //a[text()="Personal Details"]
${personal_details_name}  xpath: (//div[@title="Personal Details"]/following::span)[1]

${Submitted_applications}  xpath: //span[text()="Submitted Applications"]
#//span[contains(@title,"Submitted Applications")]//parent::a
${applied_job}      xpath: //a[contains(@id,'opptyAppliedTabBar-jobsTab-tab')]
${dropdown_offer}  xpath: //span[contains(@aria-label, 'Show Details')]
${view_offer}  xpath: //oj-button//span[text()="View Offer"]
${accept_offer}  xpath:  //a/span[text()='Accept']
${sign_Empname}  xpath: //span/input[contains(@id,'aeo1Sh:aeo1Inp::content')]
${sub_offerbutton}  xpath: //a/span/span[text()='m']

${href_absences}   link:Absences
${href_person_management}  link:Person Management
${search_person_name}  xpath: //label[text()='Name']/following::input[1]
${search_person_management}  xpath: //button[text()='Search']
${include_terminate_checkbox}  xpath: //label[text()="Include terminated work relationships"]
