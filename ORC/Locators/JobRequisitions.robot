*** Variables ***
${add_btn}  id:_FOpt1:_FOr1:0:_FONSr2:0:_FOTr0:0:jrUpl:UPsp1:jrPce:addBtn::icon
#${page_title}   class:xnt
${input_search}    xpath://a[@title='Search']//parent::td//preceding-sibling::td//input
${btn_search}   xpath://a[@title='Search']
${req_title}    xpath://a[contains(@id,'rtLnk')]
${filter}  xpath://td/a[contains(@title,'Remove Filter')]/img

${requisition_status}   xpath: ((//td[@valign="top"])[8]//div/span)[1]
${candidate_search}     xpath: //div[@title='Candidate Search']
${remove_filter}        xpath: //a[contains(@title,'Remove')]

${notififcation_icon}  xpath://a/*[name()="svg" and contains(@aria-label,"Notifications")]
${pending_notification}  xpath://div[@title="Pending Notifications"]//tr[2]/td[2]/a


${show_filter_link}     xpath: //span[text()[contains(.,'Show Filters')]]/parent::a
${phase_drop_down}      xpath: //td[@title='Phase']/preceding-sibling::td/a
${open_phase}           xpath: //a[contains(@id,'Phase_4')]

${no_search_result}        xpath: //span[text()[contains(.,'No results found.')]]
${requisition_application_link}     xpath: //a[contains(@title,'Applications')]
${first_requisition}        xpath: (//a[contains(@id,'jrPse:rtLnk')])[1]
${candidate_pool}  xpath://div[text()="Candidate Pools"]

