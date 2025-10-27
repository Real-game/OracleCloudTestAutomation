*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/Benefits.robot

*** Keywords ***

Select Your Benefits
    Wait And Click Element  ${my_benefits}
    Wait Until Page Contains  My Benefits  20s  My Benefits page is not displayed
    Capture Page Screenshot

See My Benefits
    Wait And Click Element  ${metrolinx_benefit_program}
    Wait Until Page Contains  Metrolinx Benefit Program  20s  Metrolinx Benefit Program page is not displayed
    Capture Page Screenshot

Verify My Benefits
    [Arguments]  ${Dental}  ${Basic_life}  ${long_term_disability}
    Wait Until Page Contains  Health Care  20s  Health Care section is not displayed
    IF  "${Dental}" == "Yes"
        Wait Until Page Contains  Dental  20s  Dental in Health Care section is not displayed
        ${dental_covered}=  GET TEXT  ${dental_cover}
        Log  dental covered : ${dental_covered}
        ${cover_status} =  Run Keyword And Return Status  Should Contain  ${dental_covered}  You
        Log  Dental status: ${cover_status}
        IF  "${cover_status}" == "True"
            ELEMENT SHOULD BE VISIBLE  ${dental_price}
        ELSE
            FAIL  Dental coverage is not include for an employee
        END
    END
    Wait Until Page Contains  Life Insurance  20s  Life Insurance section is not displayed
    IF  "${Basic_life}" == "Yes"
        Wait Until Page Contains  Basic Life  20s  Basic Life in Life insurance section is not displayed
        ${basic_life_covered}=  GET TEXT  ${basic_life_covered}
        Log  Basic Life Covered: ${basic_life_covered}
        ${cover_status1}=  Run Keyword And Return Status  Should Contain  ${basic_life_covered}  You
        Log  Basic Life Status: ${cover_status1}
        IF  "${cover_status1}" == "True"
            ELEMENT SHOULD BE VISIBLE  ${basic_life_price}
        ELSE
            FAIL  Basic life coverage is not include for an employee
        END
    END
    IF  "${long_term_disability}" == "Yes"
        Wait Until Page Contains  Long Term Disability  20s  Long Term Disability is not displayed
    END
    Sleep  3s
    Capture Page Screenshot
