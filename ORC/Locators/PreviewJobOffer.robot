*** Variables ***
${job_offer_header}  xpath://h2[text()[contains(.,'Job Offer')]]
${download_offer_button}    xpath: //a[contains(@class,'download')]
${accept_button}    xpath: //a[text()[contains(.,'Accept')]]
${decline_button}   xpath: //a[text()[contains(.,'Decline')]]
${iframe_title}     xpath: //iframe[@title='Job Offer']
${back button}      xpath: //a[contains(@id,'done')]
${details_link}     xpath: //div[text()[contains(.,'Details')]]

