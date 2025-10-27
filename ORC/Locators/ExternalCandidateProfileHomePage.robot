*** Variables ***
${reqids}  xpath://span[contains(@data-bind,'application.jobId')]
${status_hovers}  xpath://li//div[1]/span[2]
${underconsideration_btn}  xpath://span[text()="Under Consideration"]
${withdraw_btn}  xpath://a[text()="Withdraw Application"]
${withdraw_popup}  xpath://span/span[text()="Withdraw Application"]
${delete_profile}  xpath://button[text()="Delete My Profile"]
${delete_popup}  xpath://span[text()="Delete My Profile"]
${back_external_site}  xpath://span[text()="Back to career site"]
${menu_options}  xpath://button[@title="Show menu options"]
${menu_temp}  xpath://button[@title="Show menu options"]/following-sibling::ul/li//button
${phoneno}  xpath://input[@placeholder="Phone number"]
${update_btn}  xpath://span[text()="Update"]
${ver}  xpath://div[@class="apply-flow-block__header"]/p
${profile_name}  xpath://div[@class="candidate-self-service__personal-information"]/h1
${eph_schedule_btn}  xpath://li//div[2]/span[2][contains(text(),"")]/../../../div//button[text()="Schedule"]
${confirm_slot}  xpath://button[contains(@data-bind,"openSchedule")]
${eph_schedule_interview}  xpath://span[text()="Schedule Interview"]/ancestor::button
${active_show_more}  xpath://show-more-active-applications//button
${profile_update_message}  xpath: //div[text()="Your profile was updated"]
