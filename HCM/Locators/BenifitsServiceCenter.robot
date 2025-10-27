*** Variables ***
${search_person}  xpath: //input[@placeholder="Search for a Person"]

${select_recent_search_result}  xpath://table/tr[2]

${people_to_cover}  link: People to Cover

${add_button}  xpath:(//h2[text()="People"]/following::span[text()="Add"])[1]

${relatioship_start_date}  xpath: //label[text()="What's the start date of this relationship?"]/following::input[1]

${submit_button}    xpath: //a[@accesskey="m" and @role="button"]

${last_name_input}    xpath: //label[text()="Last Name"]/following::input[1]

${relationship_dropdown}    xpath://label[text()="Relationship"]/following::input[1]

${potential_life_events_add_button}  xpath:(//h2[text()="Potential Life Events"]/following::span[text()="Add"])[1]

${life_events_dropdown}    xpath://label[text()="Life Event"]/following::input[1]

${occurred_date_input}    xpath://label[text()="Occurred Date"]/following::input[1]

${save_and_close_button}    xpath://a[@accesskey="S"]

${potential_life_events_action_dropdown}    xpath://h2[text()="Potential Life Events"]/following::span[text()="Actions"][1]
