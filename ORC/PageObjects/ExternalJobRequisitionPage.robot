*** Settings ***
Library  Selenium2Library
Resource  ../Locators/ExternalJobRequisitionPage.robot
Resource  ../Locators/ExternalSiteHomepage.robot
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/Mailosaurs.robot

*** Keywords ***
Enter Email
    [Arguments]  ${mail}
#    ${time}=   Get Time  epoch
#    ${email_address_value}=  Catenate   SEPARATOR=	 Autotest  ${time}    @mailinator.com
    Wait and Send Keys  ${email_input}  ${mail}
    Sleep  2s
    Wait And Click Element  ${checkbox}
    Sleep  3s
    wait and click element  ${email_input}
    Sleep  2s
    scroll element into view  ${next_btn}
    Wait And Click Element  ${next_btn}
    Sleep  5s
    ${status}=  Run Keyword And Return Status  Page Should Contain  Confirm Your Identity
    IF  "${status}"=="True"
        Sleep  5s
        ${inputs}=  Get WebElements  ${otp_inputs}
        ${text}=  Mailinator Email Verification  ${mail}
        ${otp}=  retainOTP  ${text}
        FOR  ${i}  IN RANGE  0  6
            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        END
#        Wait And Click Element  ${keep_me_signed_btn}
        Wait And Click Element  ${verify_btn}
    END
    Sleep  10s
    Capture Page Screenshot

Enter Email E2E
    [Arguments]  ${mail}
    Wait and Send Keys  ${email_input}  ${mail}
    Sleep  2s
    Wait And Click Element  ${checkbox}
    Wait And Click Element  ${next_btn}
    Sleep  3s
    ${status}=  Run Keyword And Return Status  Page Should Contain  Confirm Your Identity
    IF  "${status}"=="True"
        Sleep  5s
        ${inputs}=  Get WebElements  ${otp_inputs}
        ${text}=  Email Verification E2E  ${mail}
        ${otp}=  retainOTP  ${text}
        FOR  ${i}  IN RANGE  0  6
            Wait And Set Text  ${inputs}[${i}]  ${otp}[${i}]
        END
#        Wait And Click Element  ${keep_me_signed_btn}
        Wait And Click Element  ${verify_btn}
    END
    Sleep  5s
    Capture Page Screenshot