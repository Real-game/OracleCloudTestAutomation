*** Variables ***
${status}  xpath://label[text()='Status']/following::input[1]
${department}  xpath://label[text()='Department']/following::input[1]
${job}  xpath://label[text()='Job']/following::input[1]
${full_time_or_part_time}  xpath://label[text()='Full Time or Part Time']/following::input[1]
${regular_or_temporary}  xpath://label[text()='Regular or Temporary']/following::input[1]
${org_chart_is_assistant}  xpath://label[text()='Org Chart is Assistant']/following::input[1]


${hiring_status}  xpath://label[text()='Hiring Status']/following::input[1]
${type}  xpath://label[text()='Type']/following::input[1]
${FTE}  xpath://label[text()='FTE']/following::input[1]
${head_count}  xpath://label[text()='Head Count']/following::input[1]
#${overlap_allowed_yes}  xpath://label[text()='Overlap Allowed']/following::input[2]
${overlap_allowed_yes}  xpath:(//input[@class='x19o']/following-sibling::label)[2]

${next_button}  xpath://div[@title="Next"]