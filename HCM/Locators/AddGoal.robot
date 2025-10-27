*** Variables ***

${save_and_close_button}  xpath://a[@accesskey='S']
${cancel_button}  xpath://a[@accesskey='C']

${goal_plan_dropdown}  xpath: (//a[@class='x1mu'])[1]
${fy_goal_plan}  xpath: //li[text()='FY21-22 Goal Plan']
${goal_name}  xpath: //input[@class='x25']
${description}  xpath: //textarea[@class='x25']
${start_date}  xpath: (//input[@class='x2b'])[1]
${target_completion_date}  xpath: (//input[@class='x2b'])[2]
${addgoal_status_dropdown}  xpath: //input[@title ='Not started']
${comments}  xpath: //div[@id='cke_1_contents']
${comments_text_box}  xpath: //body[@class='cke_editable cke_editable_themed cke_contents_ltr cke_show_borders']
${iframe_add_goal_comments}  xpath: //label[text()="Comments"]/following::iframe[@title="Comments"]