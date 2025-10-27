*** Variables ***

${completed_task_label}     xpath: //label[contains(@id,'etaskCountLabel|label')]
${completed_task_list}      xpath: //span[@class='oj-icon-circle oj-icon-circle-xs oj-icon-circle-forest']
${completed_check_box}      xpath: //span[@class='oj-icon-circle oj-icon-circle-xs oj-icon-circle-forest']/parent::div/preceding-sibling::div//span
${reopen_button}            xpath: //span[text()[contains(.,'Reopen')]][contains(@class,'oj-button')]
${checklist_menu_icon}      xpath: //span[contains(@class,'menu-icon-only-dropdown-icon')]
${reassign_task_link}       xpath: //span[text()[contains(.,'Reassign Task')]]/parent::a
${remove_task_link}       xpath: //span[text()[contains(.,'Remove Task')]]/parent::a
${send_a_reminder_task_link}    xpath: //span[text()[contains(.,'Send a Reminder')]]/parent::a
${remove_confirmation_button}   xpath: //span[contains(@id,'confirm-remove')][text()[contains(.,'Remove')]]
${reassignee_name_input}    xpath: //oj-label[contains(@id,'assignee')]/following-sibling::input
${reassign_save_button}     xpath: //span[contains(@id,'reassignSave')]
${reassign_task_name}       xpath: //h1[text()[contains(.,'Reassign Task')]]/parent::div/following-sibling::div//span[text()[contains(.,'Task')]]//ancestor::oj-label/following-sibling::div/div
${task_list}                xpath: //input[@type='checkbox']
${reassignee_highlighted_result}    xpath: //span[contains(@class,'highlighttext-highlighter')]//ancestor::div[contains(@class,'textslots')]
${MX_candidate_journeys_done_button}    xpath: //button[@title_back_button]
${my_tasks_header}        xpath: //h1[text()[contains(.,'My Tasks')]]
${my_tasks_tab}           xpath: //span[text()[contains(.,'My Tasks')]]
${my_tasks_action_button}        xpath: //oj-menu