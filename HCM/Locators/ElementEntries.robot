*** Variables ***

${salary_element_entry}   xpath: //a[text()='Hourly Rate'  or text()='Regular Hours']
${benefits_element_entry}   xpath: //span[text()='Benefits']
${accruals_element_entry}   xpath: //span[text()='Absences']
${source_sort_descending_icon}   xpath: //span[text()='Source']/parent::div/parent::th/div/table/tbody/tr/td//a[@title='Sort Descending']
${source_header}    xpath: //span[text()='Source']
${source_sort_ascending_icon}   xpath: //span[text()='Source']/parent::div/parent::th/div/table/tbody/tr/td//a[@title='Sort Ascending']
${element_classification_header}    xpath: //span[text()='Element Classification']
${element_classification_sort_ascending_icon}   xpath: //span[text()='Element Classification']/parent::div/parent::th/div/table/tbody/tr/td//a[@title='Sort Ascending']
${view_element_entries}  xpath: //a[text()='View']
${column_element_entries}  xpath: //td[text()='Columns']
${show_all_element_entries}  xpath: //td[text()='Show All']