*** Settings ***
Library  Selenium2Library
Library  String
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Variables  Helpers.py
Resource  ../Helpers/Config.robot

*** Variables ***
${URL}  https://ehtc-dev1.fa.ca2.oraclecloud.com/
${Browser}  Chrome
${URL_Analytics}  https://ehtc-dev1.fa.ca2.oraclecloud.com/analytics

*** Keywords ***
Before Suite
    ${file_name}=  Get Variable value  ${SUITE NAME}
    IF  '${local_execution_flag}'=='True'
        Launch Browser  ${URL}  ${local_execution_browser}
    END
    IF  '${sauce_execution_flag}'=='True'
        Launch HCM  ${file_name}
    END
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

Before Suite for Unifier Test
    ${file_name}=  Get Variable value  ${SUITE NAME}
    IF  '${local_execution_flag}'=='True'
        Launch Browser  ${Unifier_URL}  ${local_execution_browser}
    END
    IF  '${sauce_execution_flag}'=='True'
        Launch HCM  ${file_name}
    END
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

Before Suite Analytics
    ${file_name}=  Get Variable value  ${SUITE NAME}
    IF  '${local_execution_flag}'=='True'
        Launch Browser  ${URL_Analytics}  ${local_execution_browser}
    END
    IF  '${sauce_execution_flag}'=='True'
        Launch HCM Analytics  ${file_name}
    END
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

After Suite
    End Web Test

After Test
    IF  '${local_execution_flag}'=='True'
            Run Keyword If Test Failed  Capture Page Screenshot
#            Close Browser
    END
    IF  '${sauce_execution_flag}'=='True'
            Run Keyword If Test Passed  Execute Javascript  sauce:job-result=passed
            Run Keyword If Test Failed  Execute Javascript  sauce:job-result=failed
            Close Browser
    END

Before Suite for EBS
    ${file_name}=  Get Variable value  ${SUITE NAME}
    Launch Browser  ${Ebs}  ${local_execution_browser}
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Sleep    10s
    Set Selenium Timeout    10s

