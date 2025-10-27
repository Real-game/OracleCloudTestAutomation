*** Settings ***
Library  Selenium2Library
Resource  ../Locators/ExternalCandidatePersonalInfo.robot
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/CustomKeywords.robot

*** Keywords ***
Fill Personal Info
    [Arguments]  ${input}
    Select Title  ${input}[Title]
    Fill First Name  ${input}[First Name]
    Fill Last Name  ${input}[Last Name]
    Fill Email Address  ${input}[Email]
    Fill Country Code  ${input}[Country Code]
    Fill Phone Number  ${input}[Phone Number]
    Fill Country  ${input}[Country]
    Fill Address  ${input}[Address]
    Fill Province  ${input}[Province]
    Fill City  ${input}[City]
    Fill Postal Code  ${input}[Postal Code]
    Fill Questions  ${input}
    Attach Resume  ${input}[Resume Path]
    Validating Sections
    Sign E-Signature  ${input}[First Name]  ${input}[Last Name]



Select Title
    [Arguments]  ${value}
    Wait And Click Element  ${title_dropdown}
    Sleep  3s
    ${matching_elements}=  Get WebElements   ${list_temp_value}
    FOR  ${element}  IN  @{matching_elements}
        ${text}=    Get Text  ${element}
        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${value}
        IF  '${status}'=='True'
            Wait And Click Element  ${element}
            Exit For Loop
        END
    END

Fill First Name
    [Arguments]  ${value}
    Wait Then Click And Set Text  ${first_name}  ${value}

Fill Last Name
    [Arguments]  ${value}
    Wait Then Click And Set Text  ${last_name}  ${value}
    Capture Page Screenshot

Fill Email Address
    [Arguments]  ${value}
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${email}
    IF  "${status}"=="True"
        Wait Then Click And Set Text  ${email}  ${value}
        Capture Page Screenshot
    END

Fill Country Code
    [Arguments]  ${value}
    ${list}=  Split String  ${value}  \n
#    IF  "${list}[0]"!="+"
#        ${value}=  Catenate  SEPARATOR=  +  ${value}
#    END
    Wait And Click Element  ${cc_dropdown}
#    Wait And Click Element    ${cc_dropdown_input}
    Sleep    3s
    ${cc_xpath}=  CATENATE  SEPARATOR=  //span[contains(text(),'${value}')]
    FOR  ${i}  IN RANGE  100
        Sleep  1s
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${cc_xpath}  10s  Country Code is not visible
        IF  '${checker}' == 'True'
            Wait And Click Element  ${cc_xpath}
            Exit For Loop
        END
        Execute JavaScript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
    END
#    Wait And Click Element  ${record_xpath}
    Sleep  3s
    Capture Page Screenshot
#    execute javascript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
#    Wait Then Click And Set Text    ${cc_dropdown_input}    ${value}
#    Sleep    2s
#    ${matching_elements}=  Get WebElements   ${list_temp_value}
#    FOR  ${element}  IN  @{matching_elements}
#        ${text}=    Get Text  ${element}
#        ${status}=  Run Keyword And Return Status  Should Contain  ${text}  ${value}
#        IF  '${Status}'=='True'
#            Wait And Click Element  ${element}
#            Exit For Loop
#        END
#    END
#    Capture Page Screenshot

Fill Phone Number
    [Arguments]  ${value}
    Wait Then Click And Set Text  ${phoneno_input}  ${value}
    Capture Page Screenshot

Fill Country
    [Arguments]  ${value}
    Wait And Click Element  ${country_dropdown}
    Sleep  2s
    ${coun_xpath}=  CATENATE  SEPARATOR=  //oj-highlight-text[@aria-label='${value}']
    FOR  ${i}  IN RANGE  100
        Sleep  3s
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${coun_xpath}  10s  Country is not visible
        IF  '${checker}' == 'True'
            Wait And Click Element  ${coun_xpath}
            Exit For Loop
        END
        Execute JavaScript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
    END
#    Wait And Send Keys  ${country_search}  ${value}
#    Sleep  2s
#    Select Required Value  ${list_temp_value}  ${value}
    Capture Page Screenshot

Fill Address
    [Arguments]  ${value}
    Wait Then Click And Set Text  ${Address_input}  ${value}
    Capture Page Screenshot

Fill Province
    [Arguments]  ${value}
#    Wait Then Click And Set Text  ${province_input}  ${value}
    Wait and click element  ${province_input}
    Sleep    2s
    ${province_xpath}=  CATENATE  SEPARATOR=  //oj-highlight-text[@aria-label='${value}']
    FOR  ${i}  IN RANGE  100
        Sleep  3s
        ${checker}=  RUN KEYWORD And Return Status  Wait until element is visible  ${province_xpath}  10s  Province is not visible
        IF  '${checker}' == 'True'
            Wait And Click Element  ${province_xpath}
            Exit For Loop
        END
        Execute JavaScript    window.document.evaluate("//*[contains(@id,'lovDropdown_single-select')]/oj-list-view", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollBy(0, 150)
    END
#    Wait and set text  ${province_search}  ${value}
#    Sleep    3s
#    Wait and click element    ${list_temp_value}
    Capture Page Screenshot

Fill City
    [Arguments]  ${value}
    Wait and click element  ${city_input}
    Sleep    2s
    Wait And Set Text    ${city_input1}  ${value}
    Sleep    3s
    Wait and click element    ${list_temp_value}
    Capture Page Screenshot

Fill Postal Code
    [Arguments]  ${value}
    Wait and click element  ${postal_code_input}
    Sleep    2s
    Wait and set text  ${postal_code_input_value}  ${value}
    Sleep    5s
    Wait and click element    ${list_temp_value}
    Capture Page Screenshot

Fill Questions
    [Arguments]  ${dic}
    ${status}=  Run Keyword And Return Status  Page Should Contain  Are you legally entitled to work in
    IF  "${status}"=="True"
        Wait And Click Element  ${workincanada_dropdown}
        Sleep  2s
        Select Required Value  ${list_temp_value}  ${dic}[Are you eligible to work in Canada?]
    END
    ${status}=  Run Keyword And Return Status  Page Should Contain  what is the maximum number of days you are willing to go into the office
    IF  "${status}"=="True"
        Wait And Click Element  ${hybrid_work_dropdown}
        Sleep  2s
        Select Required Value  ${list_temp_value}  ${dic}[maximum number of days you are willing to go into the office]
    END

#    ${status}=  Run Keyword And Return Status  Page Should Contain  Are you legally entitled to work in
#    IF  "${status}"=="True"
#        Wait And Click Element  ${workinoffice_dropdown}
#        Sleep  2s
#        Select Required Value  ${list_temp}  ${dic}[Are you eligible to work in Canada?]
#    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Do you identify as:
    IF  "${status}"=="True"
        ${xpath}=  formQuesXpath  ${radio_gender}  ${dic}[Gender Identity]
        Sleep  3s
        Wait And Click Element  ${xpath}
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Sexual Orientation
    IF  "${status}"=="True"
        ${xpath}=  formQuesXpath  ${sexual_orientation_temp}  ${dic}[Sexual Orientation]
        Sleep  3s
        Select Required Value with Text  ${xpath}  ${dic}[Sexual Orientation]
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Persons with Disabilities
    IF  "${status}"=="True"
        ${xpath}=  formQuesXpath  ${person with disability}  ${dic}[Persons with Disabilities]
        Sleep  2s
        scroll element into view  ${xpath}
        Sleep  3s
        Wait And Click Element  ${xpath}
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Indigenous person from
    IF  "${status}"=="True"
        ${xpath}=  formQuesXpath  ${radio_ques1}  ${dic}[Indigenous Persons or Indigeneity]
        Sleep  2s
        scroll element into view  ${xpath}
        Sleep  3s
        Wait And Click Element  ${xpath}
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  What racial
    IF  "${status}"=="True"
        ${xpath}=  formQuesXpath  ${race_ethnicity_temp}  ${dic}[Race and Ethnicity]
        Sleep  3s
        scroll element into view  ${xpath}
        Sleep  3s
        Wait And Click Element  ${xpath}
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  conviction for a criminal offence
    IF  "${status}"=="True"
        Wait And Click Element  ${criminaloffence_dropdown}
        Sleep  2s
        Select Required Value  ${list_temp_value}  ${dic}[criminal offence]
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Have you been fully vaccinated*
    IF  "${status}"=="True"
        scroll element into view  ${covidques_dropdown}
        Sleep  2s
        Wait And Click Element  ${covidques_dropdown}
        Sleep  3s
        Select Required Value  ${list_temp_value}  ${dic}[vaccinated]
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Family Member of a current Metrolinx
    IF  "${status}"=="True"
        Wait And Click Element  ${familymember_dropdown}
        Sleep  2s
        Select Required Value  ${list_temp_value}  ${dic}[Are you a Family Member of a current Metrolinx Employee?]
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  previously employed by Metrolinx?
    IF  "${status}"=="True"
        IF  "${dic}[Were you previously employed by Metrolinx?]"=="Yes - I remember my employee number"
            Wait And Click Element  ${previouslyemployed_dropdown}
            Sleep  2s
            Select Required Value  ${list_temp_value}  ${dic}[Were you previously employed by Metrolinx?]
            Sleep  3s
            Wait And Click Element  ${provide_employee_number}
            Sleep  2s
            Wait And Set Text  ${provide_employee_number}  ${dic}[Candidate Person Number]
        ELSE
            Wait And Click Element  ${previouslyemployed_dropdown}
            Sleep  2s
            Select Required Value  ${list_temp_value}  ${dic}[Were you previously employed by Metrolinx?]
        END
    END

    ${status}=  Run Keyword And Return Status  Page Should Contain  Source type:
    IF  "${status}"=="True"
        Wait And Click Element  ${sourcetype_dropdown}
        Sleep  2s
        Select Required Value  ${list_temp_value}  ${dic}[Source type]
    END

    @{key_list}=  Get Dictionary Keys  ${dic}
    ${matching_elements}=  Get WebElements   ${ques_temp}
    FOR  ${element}  IN  @{matching_elements}
          ${title}=  Get Element Attribute  ${element}  aria-label
          ${status}=  Run Keyword And Return Status  List Should Contain Value  ${key_list}  ${title}
          IF  '${status}'=='True'
            Mouse Over  ${element}
            Wait And Click Element  ${element}
            Select Required Value  ${list_temp_value}  ${dic}[${title}]
          END
          Sleep  3s
    END
    Capture Page Screenshot



Attach Resume
    [Arguments]  ${value}
    ${status}=  Run Keyword And Return Status  Page Should Contain Element  ${upload}
    IF  "${status}"=="True"
        Wait And Click Element  ${upload}
        Sleep  5s
        Attach File  ${value}
    END


Sign E-Signature
    [Arguments]  ${FN}  ${LN}
    ${value}=  Catenate  ${FN}  ${LN}
    Wait Then Click And Set Text  ${e-sign_input}  ${value}
    Sleep  5s
    Capture Page Screenshot

Click on Submit Application
    Wait And Click Element  ${submit}
    Sleep  20s
    Capture Page Screenshot

Check Error Popup
    Page Should Not Contain Element  ${external_error}  Error Warning Dispalyed
    Sleep  2s
    Capture Page Screenshot

Go Back to Job Details
    Wait And Click Element  ${cross}
    Sleep  10s


Validating Sections
    ${status}=  Run Keyword And Return Status  Page Should Contains  Education
    IF  "${status}"=="True"
        Log  Asking for Education Details
        Fail
    END

