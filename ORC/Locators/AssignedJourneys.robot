*** Variables ***
${search_for_journeys_input}      xpath: //div[@slot='assignedJourneys']//input
${search_icon_assigned_journeys}       xpath: //div[@slot='assignedJourneys']//button
${active_tile}              xpath: //div[@class='oj-sp-profile-card-header-content']/div[text()[contains(.,'Journeys')]]
${internal_journey_title}   xpath: //span[@title='Internal Journeys']//ancestor::oj-action-card
${my_tasks_tab}     xpath: //span[@class='oj-tabbar-item-label']//span[text()[contains(.,'My Tasks')]]
${completed_tasks}  xpath://span[@slot="COM" and @class="oj-ux-ico-check"]/ancestor::div[@class="oj-listitemlayout-grid"]
${display_name_validator}  xpath://span[text()="Display Name"]/../../../following-sibling::div/div
${mouse_over}  xpath://div[text()="Contact Info"]
