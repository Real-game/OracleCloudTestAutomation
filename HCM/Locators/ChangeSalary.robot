*** Variables ***

${employment_search}  xpath: //input[@placeholder='Search for a Person']
${employment_search_result}  xpath: //table/tr[2]

${propose_new_salary_button}  xpath: //button[text()="Propose New Salary"]

${select_date_icon}  xpath: //a[@title="Select Date"]
${select_current_date}  xpath: //td[contains(@class,"_AFSelected")]

${action_drop_down}  xpath: //a[@title="Search: Action"]

${ok_button}  xpath: //button[@accesskey="K"]

${salary_amount}  xpath: (//label[text()="Salary Amount"]/following::input)[1]
${continue_button}  xpath: //a[@accesskey="u"]

${submit_button}  xpath: //div[@title="Submit"]
${warning_yes_button}  xpath: //button[@accesskey="Y"]