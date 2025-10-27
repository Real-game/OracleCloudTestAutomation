*** Settings ***
Library           Selenium2Library
Library  ../Helpers/Mailosaur.py    ${API_KEY}
Library  ../Helpers/Helpers.py
Library         DateTime
Library           String
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/ExternalSiteHomepage.robot
Documentation  Is in Robot work



*** Variables ***

${mail_URL}  https://accounts.google.com/signin/v2/identifier?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn
${mailinator_URL}  https://www.mailinator.com
${inboxes_URL}    https://inboxes.com/
${public_inbox}  xpath: //a[text()="Public Inbox"]
${get_my_inbox}   xpath: //button[text()="Get my first inbox!"]
${add_inbox_value}    xpath: (//button[text()="Add Inbox"])[1]
${inbox_address}  xpath: //input[@id="inbox_field"]
${username_address}    xpath://input[@placeholder="Enter username"]
${btn_go}  xpath: (//button[contains(text(),"GO")])[2]
${otp_mail}  xpath: (//td[contains(text(),"Confirm your identity")])[1]
${offer_mail}  xpath: (//td[contains(text(),"Your job offer for the")])[1]
${respond_to_job_offer}  xpath: //a[contains(text(),"Respond to Job Offer")]
${respond_to_additional_info}  xpath: //a/span[contains(text(),"Provide Additional Info")]
${domain_select}    xpath://input[@placeholder="Enter username"]/following-sibling::select
${domain_value}    xpath: //input[@placeholder="Enter username"]/following-sibling::select/child::option[text()='blondmail.com']

*** Keywords ***
Email Verification
    [Arguments]  ${email}
    ${pwd}=  Get Password  ${email}
    Execute Javascript   window.open('https://accounts.google.com/signin/v2/identifier?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn');
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait And Set Text      name:identifier     ${email}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Wait And Set Text      name:password     ${pwd}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Sleep  20s
#    Mouse Over  xpath://span[text()="More"]
#    Wait And Click Element  xpath://span[text()="More"]
#    Wait And Click Element  xpath://a[text()="Spam"]
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   confirm your identity
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    ${text} =  Get Text  //body
    ${c}=    Get Lines Containing String    ${text}   one-time pass code
    Switch Window  ${list}[0]
    RETURN    ${c}

Mailinator Email Verification
    [Arguments]  ${email}
    Open Mailinator Mailbox  ${email}
    Wait And Click Element  ${otp_mail}
    Sleep  20s
    select frame   id:html_msg_body
    ${txt} =  Get Text  xpath: //body
    Log  ${txt}
    ${c}=    Get Lines Containing String    ${txt}   one-time pass code
    ${list}=  Get Window Handles
    Switch Window  ${list}[0]
    RETURN    ${c}

#Inboxes Email Verification
#    [Arguments]  ${email}
##    Open Inboxes Mailbox  ${email}
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[1]
#    Sleep    2s
#    scroll element into view    ${otp_mail}
##    ${element}=    Get WebElement    ${otp_mail}
##    Execute JavaScript    arguments[0].scrollIntoView(true);
#    ${checker1}=  RUN KEYWORD And Return Status  Wait And Click Element  ${otp_mail}
#    IF  '${checker1}' == 'True'
#        Execute JavaScript    window.scrollTo(0, 500);
#        Wait And Click Element  ${otp_mail}
#    END
#    Sleep  20s
#    scroll element into view    xpath: (//font)[1]
##    select frame   id:html_msg_body
#    ${txt} =  Get Text  xpath: (//font)[1]
#    Log  ${txt}
#    ${c}=    Get Lines Containing String    ${txt}   one-time pass code
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[0]
#    RETURN    ${c}

Open Mailinator Mailbox
    [Arguments]  ${email}
    ${mail_id}=  Get Mail  ${email}
    Execute Javascript   window.open('${mailinator_URL}');
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait And Click Element  ${public_inbox}
    Sleep  2s
    Wait And Set Text  ${inbox_address}  ${mail_id}
    Wait And Click Element  ${btn_go}
    Sleep  2s

#Open Inboxes Mailbox
#    [Arguments]  ${email}
#    ${mail_id}=  Get Mail  ${email}
#    Execute Javascript   window.open('${inboxes_URL}');
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[1]
#    Sleep    5s
#    reload page
#    Sleep    5s
#    reload page
#    wait until page contains element    ${get_my_inbox}    20s
#    Wait And Click Element  ${get_my_inbox}
#    Sleep  2s
#    Wait And Set Text  ${username_address}  ${mail_id}
#    Sleep    2s
#    Wait And Click Element    ${domain_select}
#    Sleep    2s
#    Wait And Click Element    ${domain_value}
#    Sleep    2s
#    Wait And Click Element  ${add_inbox_value}
#    Sleep  2s
#    capture page screenshot
#    Sleep    10s
#    ${list}=  Get Window Handles
#    Switch Window  ${list}[0]

Email Verification E2E
    [Arguments]  ${email}
    ${pwd}=  Get Password  ${email}
    Execute Javascript   window.open('https://accounts.google.com/signin/v2/identifier?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn');
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Wait And Set Text      name:identifier     ${email}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Wait And Set Text      name:password     ${pwd}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Sleep  10s
#    Mouse Over  xpath://span[text()="More"]
#    Wait And Click Element  xpath://span[text()="More"]
#    Wait And Click Element  xpath://a[text()="Spam"]
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   confirm your identity
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    ${text} =  Get Text  //body
    ${c}=    Get Lines Containing String    ${text}   one-time pass code
    Switch Window  ${list}[1]
    RETURN    ${c}

Mailinator Respond to Job Offer
    [Arguments]  ${email}
    Open Mailinator Mailbox  ${email}
    Wait And Click Element  xpath: (//td[contains(text(),"Your job offer for the")])[1]
    Sleep  2s
    select frame   id:html_msg_body
    Wait And Click Element  ${respond_to_job_offer}
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    wait until page contains  Confirm Your Identity  20s
    Switch Window  ${list}[1]
    scroll element into view  xpath: //a[contains(text(),"Back to Inbox")]
    Sleep  2s
    Execute JavaScript    window.scrollTo(document.body.scrollHeight, 0)
    Sleep  2s
    Wait And Click Element  xpath: //a[contains(text(),"Back to Inbox")]
    Wait And Click Element  ${otp_mail}
    Sleep  20s
    select frame   id:html_msg_body
    ${txt} =  Get Text  xpath: //body
    Log  ${txt}
    ${c}=    Get Lines Containing String    ${txt}   one-time pass code
    ${otp}=  retainOTP  ${c}
    Switch Window  ${list}[2]
    ${inputs}=  Get WebElements  ${otp_inputs}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
    Wait And Click Element  ${verify_btn}
    Sleep  10s

Respond to Offer
    [Arguments]  ${email}
    ${pwd}=  Get Password  ${email}
    Execute Javascript   window.open('https://accounts.google.com/signin/v2/identifier?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn');
    ${list}=  Get Window Handles
    Switch Window  ${list}[1]
    Wait And Set Text      name:identifier  ${email}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Wait And Set Text      name:password     ${pwd}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Sleep  10s
    Mouse Over  xpath://span[text()="More"]
    Wait And Click Element  xpath://span[text()="More"]
    Wait And Click Element  xpath://a[text()="Spam"]
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   in:spam Congratulations
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    Sleep  2s
    Wait And Click Element  xpath://div/div[text()="Spam"]/following-sibling::div
    Sleep  2s
    ${status}=  Run Keyword And Return Status  Page Should Contain  Help improve the Gmail spam filter
    IF  "${status}"=="True"
        Wait And Click Element  xpath://span[@aria-label="Close"]
        Sleep  3s
    END
    Mouse Over  xpath://a[text()="Inbox"]
    Wait And Click Element  xpath://a[text()="Inbox"]
    Reload Page
    Sleep  5s
    Wait Then Click And Set Text  ${ele_text}   Congratulations
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  xpath://div[@aria-label="Show trimmed content"]
    IF  "${status}"=="True"
        ${webelements}=  Get WebElements  xpath://div[@aria-label="Show trimmed content"]
        ${count}=  Get Length  ${webelements}
        ${count}=  Evaluate  ${count}-1
        Wait and Click Element  ${webelements}[${count}]
    END
    ${matching}=  Get WebElements  xpath://a[contains(text(),"Respond") and contains(@style,"text")]
    ${count}=  Get Length  ${matching}
    ${count}=  Evaluate  ${count}-1
    Sleep  3s
    Mouse Over  ${matching}[${count}]
    Wait and Click Element  ${matching}[${count}]
    Sleep  5s
    Switch Window  ${list}[1]
    Sleep  5s
    Mouse Over  xpath://span[text()="More"]
    Wait And Click Element  xpath://span[text()="More"]
    Wait And Click Element  xpath://a[text()="Spam"]
    Wait Then Click And Set Text  ${ele_text}   in:spam confirm your identity
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    ${text} =  Get Text  //body
    ${c}=    Get Lines Containing String    ${text}   one-time pass code
    RETURN    ${c}

Search for schedule Interview mail
    Sleep  3s
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   in:spam Schedule your interview
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]


Respond to Offer E2E
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Reload Page
    Sleep  5s
    Mouse Over  xpath://span[text()="More"]
    Wait And Click Element  xpath://span[text()="More"]
    Wait And Click Element  xpath://a[text()="Spam"]
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   in:spam Congratulations
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    Sleep  5s
    Wait Until Page Contains  Congratulations!  60s
    Wait And Click Element  xpath://div/div[text()="Spam"]/following-sibling::div
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain  Help improve the Gmail spam filter
    IF  "${status}"=="True"
        Wait And Click Element  xpath://span[@aria-label="Close"]
        Sleep  3s
    END
    Mouse Over  xpath://a[text()="Inbox"]
    Wait And Click Element  xpath://a[text()="Inbox"]
    Reload Page
    Sleep  5s
    Wait Then Click And Set Text  ${ele_text}   Congratulations
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  xpath://div[@aria-label="Show trimmed content"]
    IF  "${status}"=="True"
        ${webelements}=  Get WebElements  xpath://div[@aria-label="Show trimmed content"]
        ${count}=  Get Length  ${webelements}
        ${count}=  Evaluate  ${count}-1
        Wait and Click Element  ${webelements}[${count}]
    END
    ${matching}=  Get WebElements  xpath://a[contains(text(),"Respond") and contains(@style,"text")]
    ${count}=  Get Length  ${matching}
    ${count}=  Evaluate  ${count}-1
    Sleep  3s
    Mouse Over  ${matching}[${count}]
    Wait and Click Element  ${matching}[${count}]
    Sleep  5s

Search for Schedule Interview Mail in Candidate Inbox
    [Arguments]  ${email}
    ${pwd}=  Get Password  ${email}
    Execute Javascript   window.open('https://accounts.google.com/signin/v2/identifier?service=mail&passive=1209600&osid=1&continue=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&followup=https%3A%2F%2Fmail.google.com%2Fmail%2Fu%2F0%2F&emr=1&flowName=GlifWebSignIn&flowEntry=ServiceLoginn');
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    Wait And Set Text      name:identifier  ${email}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Wait And Set Text      name:password     ${pwd}
    Wait And Click Element   xpath://span[@class='VfPpkd-vQzf8d' and text()='Next']
    Sleep  10s
    Mouse Over  xpath://span[text()="More"]
    Wait And Click Element  xpath://span[text()="More"]
    Wait And Click Element  xpath://a[text()="Spam"]
    Sleep  3s
    ${ele_text}   set variable    xpath://input[@placeholder='Search mail']
    Wait Then Click And Set Text  ${ele_text}   in:spam Schedule your interview
    Wait And Send Keys    ${ele_text}    ENTER
    Wait And Click Element   xpath://span[@class="il"]

Mailinator Respond to Additional Info Required
    [Arguments]  ${email}
    Open Mailinator Mailbox  ${email}
    Wait And Click Element  xpath: (//td[contains(text(),"Additional information required")])[1]
    Sleep  2s
    select frame   id:html_msg_body
    Wait And Click Element  ${respond_to_additional_info}
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]
    wait until page contains  Confirm Your Identity  40s
    Switch Window  ${list}[1]
    scroll element into view  xpath: //a[contains(text(),"Back to Inbox")]
    Sleep  2s
    Execute JavaScript    window.scrollTo(document.body.scrollHeight, 0)
    Sleep  2s
    Wait And Click Element  xpath: //a[contains(text(),"Back to Inbox")]
    wait until page contains element  ${otp_mail}  40s
    Wait And Click Element  ${otp_mail}
    Sleep  30s
    select frame   id:html_msg_body
    ${txt} =  Get Text  xpath: //body
    Log  ${txt}
    ${c}=    Get Lines Containing String    ${txt}   one-time pass code
    ${otp}=  retainOTP  ${c}
    Switch Window  ${list}[2]
    ${inputs}=  Get WebElements  ${otp_inputs}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
    Wait And Click Element  ${verify_btn}
    Sleep  10s
    Wait until page contains element  ${personal_info_header}  20s  Personal Info Page is not displayed
    Capture Page Screenshot

Get OTP Details
    [Arguments]    ${mail}
#    ${TEST_EMAIL_ADDRESS} =    Catenate  SEPARATOR=   ${mail}@${SERVER_DOMAIN}
    ${MESSAGE}=     Mailosaur.find_email   ${SERVER_ID}    ${mail}
    Mailosaur.subject_should_equal    ${MESSAGE}      Confirm your identity
#    log to console    ${MESSAGE}
    ${msg} =    Mailosaur.message body    ${MESSAGE}
#    log to console    ${msg}
    ${otp}=    Mailosaur.get otp from mail    ${MESSAGE}
    log to console  OTP: ${otp}
    [Return]    ${otp}

Get Link from Mail
    [Arguments]    ${mail}   ${email_subject}   ${link_message}
    ${MESSAGE}=     Mailosaur.find emails    ${SERVER_ID}    ${mail}   ${email_subject}
    Mailosaur.subject_should_equal    ${MESSAGE}   ${email_subject}
#    log to console    ${MESSAGE}
    ${msg} =    Mailosaur.message body    ${MESSAGE}
    log to console    ${msg}
    ${link_href} =    Mailosaur.get html link by text    ${MESSAGE}    ${link_message}
    log to console    ${link_href}
    [Return]    ${link_href}

Mailosaur select Job Offer
    [Arguments]  ${email}
    ${inputs}=  Get WebElements  ${otp_inputs}
    ${text}=  Get OTP Details  ${email}
    log to console    ${text}
    ${otp}=  retainOTP  ${text}
    FOR  ${i}  IN RANGE  0  6
        ${checker1}=  Run Keyword And Return Status  Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        IF  '${checker1}'=='False'
            ${inputs}=  Get WebElements  ${otp_inputs}
            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        END
    END
    ${inputs}=  Get WebElements  ${otp_inputs}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
    Wait And Click Element  ${verify_btn}
    Sleep  10s

