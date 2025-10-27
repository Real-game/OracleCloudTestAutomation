*** Variables ***
${jo_search}  xpath://input[contains(@placeholder,"Keywords")]
${jo_search_img}  xpath://a[img[@title="Search"]]
${jo_req_temp}  xpath://table[contains(@id,"hro4Pgl")]//td/span
${jo_actions_temp}  xpath://a[img[contains(@title,'Actions')]]
${jo_temp}  xpath://tr[contains(@id,"actCmi")]/td[2]
${jo_warn_yes}  xpath://a[span[text()="Yes"]]