*** Variables ***

${submit_button}  xpath://div[@title="Submit"]
${warning_button_Yes}  xpath://button[span[text()="Y"]]
${confirm_button}  xpath:(//button[@accesskey='K'])[2]

${review_effective_start_date}  xpath:(//td[@class='x15 x4z']/following-sibling::td)[1]
${review_business_unit}  xpath:(//td[@class='x15 x4z']/following-sibling::td)[3]
${review_name}  xpath:(//td[@class='x15 x4z']/following-sibling::td)[5]
${review_code}  xpath:(//td[@class='x15 x4z']/following-sibling::td)[6]

${review_status}  xpath://label[text()="Status"]/following::span[1]
${review_department}  xpath://label[text()="Department"]/following::span[1]
${review_job}  xpath://label[text()="Job"]/following::span[1]
${review_full_part_time}  xpath://label[text()="Full Time or Part Time"]/following::span[1]
${review_regular_temporary}  xpath://label[text()="Regular or Temporary"]/following::span[1]
${review_org_chart_assistant}  xpath://label[text()="Org Chart is Assistant"]/following::span[1]

${review_hiring_status}  xpath://label[text()="Hiring Status"]/following::span[1]
${review_type}  xpath://label[text()="Type"]/following::span[1]
${review_FTE}  xpath://label[text()="FTE"]/following::span[1]
${review_head_count}  xpath://label[text()="Head Count"]/following::span[1]
${review_overlap_allowed}  xpath://label[text()="Overlap Allowed"]/following::span[1]