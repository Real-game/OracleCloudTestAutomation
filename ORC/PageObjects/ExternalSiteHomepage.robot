*** Settings ***
Library  Selenium2Library
Library  Collections
Resource  ../Locators/ExternalSiteHomepage.robot
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/Mailosaurs.robot
Library  ../Helpers/Helpers.py
Resource  ../PageObjects/ExternalCandidatePersonalInfo.robot

*** Keywords ***
Search Requisition
    [Arguments]  ${id}
    Wait until element is visible  ${ext_search_input}  20s  External Website Search Input not displayed
    Scroll element into view  ${ext_search_input}
    Wait And Set Text  ${ext_search_input}  ${id}
    Wait And Click Element  ${search_btn}
    Sleep  3s
    Pin Requisition  ${id}

Pin Requisition
    [Arguments]  ${id}
    ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  ${validator}
    Sleep    3s
    IF  "${status}"=="True"
        ${pin_btn} =  Catenate  SEPARATOR=   //a[contains(@href,'${id}')]/following-sibling::div//button[contains(@title,'Add')]
        ${flag}=  Run Keyword And Return Status  Page Should Contain Element  ${pin_btn}
        IF  "${flag}"=="True"
            Wait And Click Element  ${pin_btn}
            Sleep  3s
        END
        ${text_ext} =  Catenate  SEPARATOR=   (//a[contains(@href,'${id}')]/following::div/search-result-item-header/div//span)[1]
#        //a[contains(@href,'${id}')]/child::div/search-result-item-header/div/span
        ${text}=  Get Text  ${text_ext}
        Click on My Jobs
        Search and Click Requisition  ${text}
    ELSE
        Log  No requisition found with the id
    END

Click on My Jobs
    Wait And Click Element  ${myjobs_btn}
    Sleep  3s

Search and Click Requisition
    [Arguments]  ${text}
    ${list}=  Get WebElement  ${myjobs_list}
    FOR  ${element}  IN  ${list}
        ${string}=  Get Element Attribute  ${element}  innerHTML
        IF  "${text}"=="Vice President, I&IT Infrastructure"
            Wait And Click Element  ${element}
            Sleep  3s
            Capture Page Screenshot
        ELSE
            Wait And Click Element  ${element}
            Sleep  3s
            Capture Page Screenshot
        END
    END

Click on Apply Now
    Wait And Click Element  ${applynow_btn}
    Sleep  5s

Click on View All Jobs
    Wait And Click Element  ${alljobs_btn}
    Sleep  2s

Click on Filter
    Wait And Click Element  ${filter_btn}
    Sleep  2s

Apply WorkLocations
    [Arguments]  ${value}
    IF  "${value}"!=""
        Wait And Click Element  ${workLocations_expand}
        ${matching_elements}=  Get WebElements   ${workLocation_temp}
        FOR  ${element}  IN  @{matching_elements}
            ${text}=    Get Text  ${element}
            ${status}=  Run Keyword And Return Status  Should Contain  ${value}  ${text}
            IF  '${status}'=='True'
                Wait And Click Element  ${element}
                Sleep  5s
                Exit For Loop
            END
        END
    END
    Sleep    2s
    Capture Page Screenshot

Click on IamEmployee
    Wait and click element    ${open_menu}
    Sleep    3s
    Wait And Click Element  ${employee_btn}
    Sleep  3s
    capture page screenshot

Click on Manage Profile
#    Wait And Click Element  ${manage_profile_btn}
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${user_dropdown}
    IF  "${status}"=="True"
        Sleep    2s
        Wait And Click Element  ${manage_profile_btn}
#        Wait And Click Element  ${profile_btn}
    ELSE
        Sleep    5s
        Wait And Click Element  ${manage_profile_btn}
    END
    Sleep  2s
    Capture Page Screenshot

Login with email
    [Arguments]  ${mail}
    wait until page contains element    ${email_input}    20s
    Wait And Set Text  ${email_input}  ${mail}
    Wait And Click Element  ${send_mail}
    Sleep  15s
    ${inputs}=  Get WebElements  ${otp_inputs}
    ${text}=  Mailinator Email Verification  ${mail}
    ${otp}=  retainOTP  ${text}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
#    Wait And Click Element  ${keep_me_signed_btn}
    Wait And Click Element  ${verify_btn}
    Sleep  10s
    Wait Until Element Contains  ${checker}  ${mail}
    Capture Page Screenshot
#
#Login with Inboxes email
#    [Arguments]  ${mail}
#    wait until page contains element    ${email_input}    20s
#    Wait And Set Text  ${email_input}  ${mail}
#    Wait And Click Element  ${send_mail}
#    Sleep  15s
#    ${inputs}=  Get WebElements  ${otp_inputs}
#    ${text}=  Inboxes Email Verification  ${mail}
#    ${otp}=  retainOTP  ${text}
#    FOR  ${i}  IN RANGE  0  6
#        ${checker1}=  Run Keyword And Return Status  Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
#        IF  '${checker1}'=='False'
#            ${inputs}=  Get WebElements  ${otp_inputs}
#            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
#        END
#
#    END
##    Wait And Click Element  ${keep_me_signed_btn}
#    Wait And Click Element  ${verify_btn}
#    Sleep  10s
#    Wait Until Element Contains  ${checker}  ${mail}
#    Capture Page Screenshot

Authentication for Job Offer
    [Arguments]  ${mail}  ${action}  ${name}  ${reason}
    ${text}=  Respond to Offer  ${mail}
    ${list}=  Get Window Handles
    ${count}=  Get Length  ${list}
    ${count}=  Evaluate  ${count}-1
    Switch Window  ${list}[${count}]
    Sleep  5s
    ${inputs}=  Get WebElements  ${otp_inputs}
    ${otp}=  retainOTP  ${text}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
#    Wait And Click Element  ${keep_me_signed_btn}
    Wait And Click Element  ${verify_btn}
    Wait Until Page Contains  Accept
    IF  "${action}"=="Accept"
        Wait And Click Element  ${esh_offer_accept}
        Sleep  5s
        Wait And Send Keys  ${esh_esign}  ${name}
        Wait And Click Element  ${esh_accept_btn}
    ELSE
        Wait And Click Element  ${esh_offer_decline}
        Sleep  5s
        Wait And Click Element  ${esh_decline_reason_dropdown}
        Sleep  5s
        Select Required Value  ${esh_temp}  ${reason}
        Wait And Click Element  ${esh_decline_btn}
    END
    Sleep  5s
    Capture Page Screenshot

Authentication for Job Offer E2E
    [Arguments]  ${action}  ${name}  ${reason}
    Respond to Offer E2E
    ${list}=  Get Window Handles
    ${count}=  Get Length  ${list}
    ${count}=  Evaluate  ${count}-1
    Switch Window  ${list}[${count}]
    Wait Until Page Contains  Accept
    IF  "${action}"=="Accept"
        Wait And Click Element  ${esh_offer_accept}
        Sleep  5s
        Wait And Send Keys  ${esh_esign}  ${name}
        Wait And Click Element  ${esh_accept_btn}
    ELSE
        Wait And Click Element  ${esh_offer_decline}
        Sleep  5s
        Wait And Click Element  ${esh_decline_reason_dropdown}
        Sleep  5s
        Select Required Value  ${esh_temp}  ${reason}
        Wait And Click Element  ${esh_decline_btn}
    END
    Sleep  10s
    Capture Page Screenshot

Click on Join Our Talent Pool
    [Arguments]  ${input}
    Wait And Click Element  ${esh_join}
    Wait Until Page Contains  Join Our Talent Community
    Wait And Set Text  ${esh_join_email}  ${input}[Email]
    Wait And Click Element  ${esh_join_check}
    sleep  2s
    Wait And Click Element  ${esh_join_sub}
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain  Confirm Your Identity
    IF  "${status}"=="True"
        ${inputs}=  Get WebElements  ${otp_inputs}
        ${text}=  Email Verification  ${input}[Email]
        ${otp}=  retainOTP  ${text}
        FOR  ${i}  IN RANGE  0  6
            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        END
#        Wait And Click Element  ${keep_me_signed_btn}
        Wait And Click Element  ${verify_btn}
        Sleep  10s
        Wait Until Element Contains  ${checker}  ${input}[Email]
        Capture Page Screenshot
    ELSE
        Fill Preferred Category  ${input}[Preferred Category]
        Fill Preferred Location  ${input}[Preferred Location]
        Select Title  ${input}[Title]
        Fill First Name  ${input}[First Name]
        Fill Last Name  ${input}[Last Name]
#        Fill Email Address  ${input}[Email]
        Fill Country Code  ${input}[Country Code]
        Fill Phone Number  ${input}[Phone Number]
        ${match}=  Get WebElements  ${es_check_temp}
        FOR  ${e}  IN  @{match}
            Wait And Click Element  ${e}
        END
        Wait And Click Element  ${es_conf_sub}
        Sleep  10s
        Capture page Screenshot
    END

Fill Preferred Category
    [Arguments]  ${value}
    Wait And Set Text  ${es_pref_cat}  ${value}
    Sleep  3s
    Wait And Click Element  ${list_temp}
    Capture Page Screenshot

Fill Preferred Location
    [Arguments]  ${value}
    Wait And Set Text  ${es_pref_loc}  ${value}
    Sleep  3s
    Wait And Click Element  ${list_temp}
    Capture Page Screenshot

Login with email in E2E
    [Arguments]  ${mail}
    Wait And Set Text  ${email_input}  ${mail}
    Wait And Click Element  ${send_mail}
    Sleep  5s
    ${inputs}=  Get WebElements  ${otp_inputs}
    ${text}=  Email Verification E2E  ${mail}
    ${otp}=  retainOTP  ${text}
    FOR  ${i}  IN RANGE  0  6
        Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
    END
#    Wait And Click Element  ${keep_me_signed_btn}
    Wait And Click Element  ${verify_btn}
    Sleep  10s
    Wait Until Element Contains  ${checker}  ${mail}
    Capture Page Screenshot

Take action on Job Offer
    [Arguments]  ${email}  ${action}  ${name}  ${reason}
    Mailosaur select Job Offer  ${email}
    IF  "${action}" == "Accept"
        Wait And Click Element  ${esh_offer_accept}
        Wait Until Page Contains  Accept Job Offer  20s
        Wait And Set Text  ${esh_esign}  ${name}
        Sleep  5s
        Wait And Click Element  ${esh_accept_btn}
        Sleep  3s
    ELSE
        Wait And Click Element  ${esh_offer_decline}
        Wait Until Page Contains  Decline Job Offer
        Wait And Click Element  ${esh_decline_reason_dropdown}
        Sleep  3s
        Select Required Value  ${esh_temp}  ${reason}
        Wait And Click Element  ${esh_decline_btn}
    END
    Sleep  5s
    Capture Page Screenshot

Select Date of Birth Value under Personal Info
    [Arguments]  ${dob}
    Sleep    30s
    ${status}=  Run Keyword And Return Status  page should contain element  ${dob_disabled}
    IF  "${status}"=="False"
#        xpath: //button[contains(@id,"reset-button")]
        ${given_date_text_split} =  String.Split String	${dob}  -
        ${year} =  set variable  ${given_date_text_split}[2]
        Log to Console  ${year}
        ${month} =  set variable  ${given_date_text_split}[1]
        Log to Console  ${month}
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${remove_month_field}  10s  Month value is not available already
        IF  '${checker}' == 'True'
            Wait And Click Element  ${remove_month_field}
            Sleep  2s
            wait then click and set text    ${month_dropdown}    ${month}
            ${month_value_select} =  Catenate  SEPARATOR=   //*[contains(text(),"${month}")]
            Wait And Click Element  ${month_value_select}
        ELSE
            Sleep  2s
            wait then click and set text    ${month_dropdown}    ${month}
            ${month_value_select} =  Catenate  SEPARATOR=   //*[contains(text(),"${month}")]
            Wait And Click Element  ${month_value_select}
        END
        Sleep  2s
        ${checker2}=  RUN KEYWORD And Return Status  Wait until element is visible  ${remove_day_field}  10s  Day value is not available already
        IF  '${checker2}' == 'True'
            Wait And Click Element  ${remove_day_field}
            Sleep  2s
            wait then click and set text    ${day_dropdown}    ${given_date_text_split}[0]
            ${day_value_select} =  Catenate  SEPARATOR=   //*[text()="${given_date_text_split}[0]"]
            Wait And Click Element  ${day_value_select}
        ELSE
            Sleep  2s
            wait then click and set text    ${day_dropdown}    ${given_date_text_split}[0]
            ${day_value_select} =  Catenate  SEPARATOR=   //*[text()="${given_date_text_split}[0]"]
            Wait And Click Element  ${day_value_select}
        END
#            Execute JavaScript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
        Sleep  2s
        ${checker3}=  RUN KEYWORD And Return Status  Wait until element is visible  ${remove_year_field}  10s  Year value is not available already
        IF  '${checker3}' == 'True'
            Wait And Click Element  ${remove_year_field}
            Sleep  2s
            Wait And Set Text  ${year_input_value}  ${year}
            Sleep  2s
            ${year_value_select} =  Catenate  SEPARATOR=   //*[contains(text(),"${year}")]
            Wait And Click Element  ${year_value_select}
        ELSE
            Sleep  2s
            Wait And Set Text  ${year_input_value}  ${year}
            Sleep  2s
            ${year_value_select} =  Catenate  SEPARATOR=   //*[contains(text(),"${year}")]
            Wait And Click Element  ${year_value_select}
        END
    END
    Capture page screenshot

Enter National Identifier details under Personal Info
    [Arguments]  ${sin}    ${country}
    Sleep    2s
    Wait And Click Element  ${select_Add_national_identifier}
    Sleep  3s
    Select Identifier Country    ${country}
#    Wait And Click Element  ${national_id_dropdown}
    Sleep  3s
    Wait And Click Element  ${Social_insurance_value_select}
    Sleep  3s
    Wait And Set Text  ${sin_input}  ${sin}
    Sleep  3s
    scroll element into view    ${done_button_select}
    Sleep    2s
    Wait And Click Element  ${done_button_select}
    Sleep  5s
    Capture page screenshot

Select Gender value under Personal Info
    [Arguments]  ${gender}

#    Sleep    2s
#    ${gender_selected} =  Catenate  SEPARATOR=   //button[@aria-pressed="true"]/span[text()='${gender}']
#    ${checker3}=  RUN KEYWORD And Return Status  Wait until element is visible  ${gender_selected}  10s  Gender value is not available already
#    IF  '${checker3}' == 'False'
#        scroll element into view    ${gender_value_select}
#        select required value  ${gender_value_select}  ${gender}
#    END
#    Sleep  2s
#    Capture page screenshot
    Wait And Click Element   ${gender_value_dropdown}
    Sleep    2s
    select required value  ${gender_value_select}  ${gender}
    Sleep    2s
    capture page screenshot

Enter E-Signature under Personal Info
    [Arguments]  ${firstname}  ${lastname}
    ${fullname}=  getNameFromCandidateName  ${firstname}  ${lastname}
    Log to console  name: ${fullname}
    Scroll element into view  ${full_name_input}
    Sleep  2s
    Wait And Set Text  ${full_name_input}  ${fullname}
    Sleep  2s
    Capture page screenshot

Click Submit Button under Personal Info
    scroll element into view    ${click_submit_button}
    Wait And Click Element  ${click_submit_button}
    Wait Until Page Contains element  ${Submit_success_message}  120s
    Sleep  5s
    Capture Page Screenshot

Select Identifier Country
    [Arguments]    ${country}
#    ${status}=  Run Keyword And Return Status  page should contain element  ${Canada_country}
#    IF  "${status}"=="False"
#        wait and click element  ${identifier_country_dropdown}
#        Sleep  2s
#        ${country_value_select} =  Catenate  SEPARATOR=   (//*[text()="Canada"])[1]
#        FOR  ${i}  IN RANGE  20
#            Sleep  1s
#            ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${country_value_select}  10s  Country Code is not visible
#            IF  '${checker}' == 'True'
#                Wait And Click Element  ${country_value_select}
#                Exit For Loop
#            END
#            Execute JavaScript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select') and not(contains(@class,'hidden'))]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 200)
#            window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
#        END
#        Wait And Set Text  ${country_search_input}  Canada
#        Sleep  2s
#        Wait And Click Element  xpath: //div[@aria-label="Canada"]
#        Sleep  2s
#    END
#    capture page screenshot
    clear element text    ${country_option}
    Sleep    2s
    wait and click element    ${country_option}
#    wait then click and set text    ${country_option}    ${country}
    Sleep    2s
    Select Required Value with Text    xpath: //*[contains(@id,"cx-select__modal")]//span  ${country}
#    //*[contains(@id,"cx-select__modal")]//span[text()="${country}"]
    capture page screenshot

Select Marital Status under Personal Info
    [Arguments]  ${marital_status}
    Sleep  2s
#    ${marital_selected} =  Catenate  SEPARATOR=   //button[@aria-pressed="true"]/span[text()='${marital_status}']
#    ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${marital_selected}  10s  Marital value is not available already
#    IF  '${checker}' == 'False'
#        scroll element into view    ${marital_status_value_select}
#        select required value  ${marital_status_value_select}    ${marital_status}
#    END
#    Sleep  2s
#    Capture page screenshot
    Wait And Click Element   ${marital_status_dropdown}
    Sleep    2s
    select required value  ${marital_status_value_select}  ${marital_status}
    Sleep    2s
    capture page screenshot

Select Agree on Terms and Condition page
    Sleep    2s
    ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${terms_and_condition_header}  10s    Terms and Condition page is not visible
    IF  '${checker}' == 'True'
        capture page screenshot
        scroll element into view    ${terms_and_condition_agree}
        Sleep    2s
        Wait And Click Element    ${terms_and_condition_agree}
    END
    capture page screenshot

Login with Mailosaur mail
    [Arguments]  ${mail}
    wait until page contains element    ${email_input}    20s
    Wait And Set Text  ${email_input}  ${mail}
    Wait And Click Element  ${send_mail}
    Sleep  15s
    ${inputs}=  Get WebElements  ${otp_inputs}
    ${text}=  Get OTP Details  ${mail}
    log to console    ${text}
    ${otp}=  retainOTP  ${text}
    FOR  ${i}  IN RANGE  0  6
        ${checker1}=  Run Keyword And Return Status  Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        IF  '${checker1}'=='False'
            ${inputs}=  Get WebElements  ${otp_inputs}
            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        END
    END
#    Wait And Click Element  ${keep_me_signed_btn}
    Wait And Click Element  ${verify_btn}
    Sleep  10s
    Wait Until Element Contains  ${checker}  ${mail}
    Capture Page Screenshot