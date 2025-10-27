*** Variables ***

${search_for_a_Person}  xpath: //input[@placeholder='Search for a Person']
${select_person}  xpath: //table/tr[2]

${action_dropdown}  xpath: //a[text()='Actions']
${action_value}  xpath: //table[contains(@id,'ATp:ATm')]//following::tr[contains(@id,'_ATp:cmi') or contains(@id,'_ATp:m1')]//td[2]
${bank_accounts}  xpath: //table[@summary='Bank Accounts']
${cancel}  xpath: //span[text()='ancel']
