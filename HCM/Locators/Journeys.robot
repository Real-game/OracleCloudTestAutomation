*** Variables ***
${open_journeys}    xpath: //span[@aria-label='Open']
${tasks_list}       xpath: //ul[@aria-label='Tasks']//li[@role='row']
${completed_task_list}    xpath: //span[contains(@class,'ico-check')]


${journeys_link}  xpath: //div[@id='cluster_groupNode_manager_resources']//a[text()='Journeys']
${assigned_journeys_tab}  xpath: //a//span[text()='Assigned Journeys']
${reports}  xpath: //div//span[text()='Reports']
${direct_reports_radio}  xpath: //label//span[text()='Direct Reports']
${reports_radio_overlay}  xpath: //div[@id='assigned-journey-filter-popup_layer_overlay']

${assigned_journey_tasks_list}       xpath: //ul[@aria-label='Employee tasks']//li[contains(@id,'ui')]
${cultural_census_task_list}       xpath: //div[text()='Metrolinx Cultural Census']