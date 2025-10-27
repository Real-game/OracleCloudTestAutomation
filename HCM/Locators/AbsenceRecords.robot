*** Variables ***

${search_for_a_person_input}   xpath: //input[@placeholder='Search for a Person']
${absence_records_link}       xpath: //a[text()='Absence Records']




${search_person}  xpath: //input[@placeholder="Search for a Person"]

${select_recent_search_result}  xpath://table/tr[2]

${existing_absences_table}  xpath: //h1[text()="Existing Absences"]/following::div[3]

${plan_balances_table}  xpath://h2[text()="Plan Balances"]/following::div[1]

${back_arrow}  xpath://a[contains(@id, "SPdonei")]