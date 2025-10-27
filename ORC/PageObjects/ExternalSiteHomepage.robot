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
    Wait And Set Text  ${ext_search_input}  ${id}
    Wait And Click Element  ${search_btn}
    Sleep  3s
    Pin Requisition

Pin Requisition
    ${status}=  Run Keyword And Return Status  Page Should Not Contain Element  ${validator}
    IF  "${status}"=="True"
        ${flag}=  Run Keyword And Return Status  Page Should Contain Element  ${pin_btn}
        IF  "${flag}"=="True"
            Wait And Click Element  ${pin_btn}
            Sleep  3s
        END
        ${text}=  Get Text  ${text_ext}
        Click on My Jobs
        Search and Click Requisition  ${text}
    ELSE
        Log  No requisition found with the id
    END

Click on My Jobs
    Wait And Click Element  ${myjobs_btn}

Search and Click Requisition
    [Arguments]  ${text}
    ${list}=  Get WebElements  ${myjobs_list}
    FOR  ${element}  IN  ${list}
        ${string}=  Get Element Attribute  ${element}  title
        IF  "${text}"=="Vice President, I&IT Infrastructure"
            Wait And Click Element  ${element}
            Sleep  3s
            Capture Page Screenshot
        ELSE IF  "${string}"=="${text}"
            Wait And Click Element  ${element}
            Sleep  3s
            Capture Page Screenshot
        END
    END

Click on Apply Now
    Wait And Click Element  ${applynow_btn}
    Sleep  5s

Click on View All Jobs
    Wait And Click Element  ${viewalljobs_btn}
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
                Sleep  2s
                Exit For Loop
            END
        END
    END
    Capture Page Screenshot

Click on IamEmployee
    Wait And Click Element  ${employee_btn}
    Sleep  3s

Click on Manage Profile
    Wait And Click Element  ${manage_profile_btn}
    Sleep  2s
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${user_dropdown}
    IF  "${status}"=="True"
        Wait And Click Element  ${profile_btn}
    END
    Sleep  2s

Login with email
    [Arguments]  ${mail}
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
        Fill Email Address  ${input}[Email]
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
    Mailinator Respond to Job Offer  ${email}
    IF  "${action}" == "Accept"
        Wait And Click Element  ${esh_offer_accept}
        Wait Until Page Contains  Accept Job Offer  20s
        Wait And Set Text  ${esh_esign}  ${name}
        Wait And Click Element  ${esh_accept_btn}
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
    ${status}=  Run Keyword And Return Status  page should contain element  ${dob_disabled}
    IF  "${status}"=="False"
        ${given_date_text_split} =  String.Split String	${dob}  -
        ${year} =  set variable  ${given_date_text_split}[2]
        Log to Console  ${year}
        ${month} =  set variable  ${given_date_text_split}[1]
        Log to Console  ${month}
        ${day_value_select} =  Catenate  SEPARATOR=   //*[text()="${given_date_text_split}[0]"]
        Wait And Click Element   ${month_dropdown}
        Sleep  2s
        Wait And Set Text  ${month_input_select}   ${month}
        Sleep  2s
        ${month_value_select} =  Catenate  SEPARATOR=   //oj-highlight-text[contains(@text,"${month}")]
        Wait And Click Element  ${month_value_select}
        Sleep  2s
        Wait And Click Element  ${day_dropdown}
        Sleep  2s
        Wait And Click Element  ${day_value_select}
        Sleep  2s
        Wait And Set Text  ${year_input_value}  ${year}
        Sleep  2s
    END
    Capture page screenshot

Enter National Identifier details under Personal Info
    [Arguments]  ${sin}
    Wait And Click Element  ${select_Add_national_identifier}
    Sleep  3s
    Select Identifier Country
    Wait And Click Element  ${national_id_dropdown}
    Sleep  3s
    Wait And Click Element  ${Social_insurance_value_select}
    Sleep  3s
    Wait And Set Text  ${sin_input}  ${sin}
    Sleep  3s
    Wait And Click Element  ${done_button_select}
    Sleep  5s
    Capture page screenshot

Select Gender value under Personal Info
    [Arguments]  ${gender}
    Wait And Click Element   ${gender_dropdown}
    Sleep  2s
    select required value  ${gender_value_select}  ${gender}
    Sleep  2s
    Capture page screenshot

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
    Wait And Click Element  ${click_submit_button}
    Wait Until Page Contains element  ${Submit_success_message}  120s
    Sleep  5s
    Capture Page Screenshot

Select Identifier Country
    ${status}=  Run Keyword And Return Status  page should contain element  ${Canada_country}
    IF  "${status}"=="False"
        wait and click element  ${identifier_country_dropdown}
        Sleep  2s
        Wait And Set Text  ${country_search_input}  Canada
        Sleep  2s
        Wait And Click Element  xpath: //div[@aria-label="Canada"]
        Sleep  2s
    END
    capture page screenshot
