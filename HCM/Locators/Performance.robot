*** Variables ***

${fyxx_xx_annual_review_manager}    link: FY21-22 Annual Review Managers

${performance_goals}    link: Performance Goals
${competencies}    link: Competencies

${improve_intake_process}    link: Improve Intake Process for IT Ops work
${click_here_button}    xpath: //button[text()="Click Here"]

${edit_button}    xpath: //div[@title="Edit Basic Info"]
${status_dropdown}    xpath: //label[text()='Status']/parent::div/following-sibling::div//a
${save_button}    xpath: //span[text()="Save"]
${back_arrow}    xpath: //a[@title="Done"]

${comment_input_box}    xpath: //div[@aria-label="Editor editing area: main"]/p
${iframe_disaster_recovery_project}    xpath: (//a[text()="Disaster Recovery Project"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])[1]
${iframe_xcel_infrastructure_modernization_project}    xpath: (//a[text()="Xcel Infrastructure Modernization Project"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])[1]
${iframe_enhancement_delivery_process}    xpath: (//a[text()="Enhancement Delivery Process"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])[1]
${iframe_application_lifecycle_management}    xpath: (//a[text()="Application Lifecycle Management"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])[1]
${iframe_improve_intake_process}    xpath: (//a[text()="Improve Intake Process for IT Ops work"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])[1]

${save_and_close}    xpath: //span[text()="ave and Close"]

${rating_dropdown}    xpath: //label[text()="Employee Competency Rating"]

${select_recent_search_result}  xpath://table/tr[2]

${submit_button}    xpath: //a[@accesskey="m" and @role="button"]

${review_period_dropdown}  xpath: //a[contains(@id,'mv04Sel')]
${review_period_value}  xpath: //ul[contains(@aria-label,'Review Period')]//li
${share_and_release}  xpath: //span[text()='Share and Release']
${submit_option}  xpath: //a[@accesskey='m']

${performance_review_dropdown}  xpath: (//label[text()="Review Period"]/following::input)[1]
${performance_review_value}  xpath: //ul[contains(@id,':wd04Sel')]//child::li

${acknowledge_document}  xpath: //span[text()='Acknowledge Document']
${continue_acknowledge_document}  xpath: //span[text()='Continue']

${edit_overall_feedback}  xpath: //span[text()="Edit"]
${iframe_participant_comments}    xpath: (//label[text()="Participant Comments"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])

${iframe_manager_comments_overall_feedback}    xpath: (//label[text()="Manager Comments"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"])

${click_here_performance_goals}    xpath: (//a[text()="Performance Goals"]/following::span[text()="Click Here"])[1]

${click_here_performance_management_process_stage}    xpath: (//h2[text()="Performance Management Process Stage"]/following::span[text()="Click Here"])[1]

${click_here_competencies}    xpath: (//a[text()="Competencies"]/following::span[text()="Click Here"])[1]
${competencies_manager_rating}    xpath: //label[text()="Manager Competency Rating"]

${goal_created_by_employee_action}    xpath: (//a[@href='#']//img)[3]
${delete_goal_created_by_employee}    xpath: //td[text()="Delete Goal"]

${warning_yes_button}    xpath: //a[@accesskey="Y"]

${add_button}  xpath: //span[text()='Add']

${goal_plan_dropdown}  xpath: //label[text()='Goal Plan']//following::a[contains(@id,'gp1Sel')]
#${goal_plan_value}  xpath: //ul[contains(@id,'sh:gp1Sel')]//following::li[@class='x1n6' or @class='x1n6 p_AFSelected']

${goal_name_input}  xpath: //label[text()='Goal Name']//following::input[contains(@id,'sh:gn1Inp')]

${goal_description}  xpath: //label[text()='Description']//following::textarea[contains(@id,'sh:dsc1Inp')]

${goal_start_date}  xpath: //label[text()='Start Date']//following::input[contains(@id,'sh:st1Dt')]

${target_date}  xpath: //label[text()='Target Completion Date']//following::input[contains(@id,'tgt1Dt')]

${goal_status_dropdown}  xpath: //label[text()='Status']//following::a[contains(@id,'sh:ssSel')]
#${goal_status_value}  xpath: //ul[contains(@id,'ssSel')]//following::li[@class='x1n6' or @class='x1n6 p_AFSelected']

${goal_comment_iframe}  xpath: //label[text()="Comments"]/following::iframe[@class="cke_wysiwyg_frame cke_reset"]

${iframe_count}  xpath: //iframe[@class="cke_wysiwyg_frame cke_reset"]

${performance_templates_link}  link: Performance Templates

${show_filter}  xpath: //span[text()='Show Filters']
${clear_document_status_filter}  xpath: //a[@title='Clear filter Document Status']

${add_person_dropdown}  xpath: //label[text()='Add Person']//following::input[contains(@id,'ap01Srh')]
${add_person_value}  xpath: //table/tr[2]

${send_request}  xpath: //span[text()='Send Request']

${due_date}  xpath: //input[contains(@id,':ps01Dt::content')]
${message_to_participant}  xpath: //label[text()='Message to Participants']//following::textarea[contains(@id,'ps01Inp')]
${submit_send_request}  xpath: //span[text()='it']

${show_additional_info}  xpath: //a[text()='Show Additional Info']
${click_here}  xpath: //h2[text()='Performance Management Process Stage']//following::div[contains(@id,'pd07Pse:pd04Btn')]//a[@role='button']
${met_with_manager_dropdown}  xpath: //a[contains(@id,'dc_soc1::drop')]
${iframe_provide_performance_comments}  xpath: //iframe[@class='cke_wysiwyg_frame cke_reset']
${comments_text_box}  xpath: //div[@aria-label="Editor editing area: main"]/p
${manager_comments_expand}  xpath: //h2[contains(text(),'Manager Comments')]//following::a/img[@title='Expand']
${checkin_comments}  xpath: //label[text()='Please provide your check-in comments here.']//preceding-sibling::div

${did_you_meet_dropdown}  xpath: //span[text()='Did you meet with the employee for a mid-year review to discuss progress towards goals? If yes, please indicate the day and month of meeting.']/following::input[1]

${check_in_date_input}  xpath: //input[@placeholder="dd-mmm-yyyy"]
${load_more_option}  xpath: //a[text()='Load More Items']

${document_filter_completed}  xpath: //td[@title='Document Status']//ancestor::h3//following-sibling::div//a[text()='Completed']
${performance_documents_link}  link: Performance Documents
${overall_feedback_save_button}  xpath: //span[text()='ave']