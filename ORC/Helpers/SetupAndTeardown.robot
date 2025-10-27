*** Settings ***
Library  Selenium2Library
Library  String
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Variables  Helpers.py
Resource  ../Helpers/Config.robot

*** Variables ***
${URL}  https://fa-ehtc-dev9-saasfaprod1.fa.ocs.oraclecloud.com
${Browser}  Chrome
${ext_URL}  https://fa-ehtc-dev9-saasfaprod1.fa.ocs.oraclecloud.com/hcmUI/CandidateExperience/en/sites/CX_1


*** Keywords ***
#Before Suite
#    Launch Browser  ${URL}  ${Browser}
#    MAXIMIZE BROWSER WINDOW
#    Set Screenshot Directory  ./Screenshots
#    Set Selenium Timeout    10s
#
#After Suite
#    End Web Test
#
#After Test
#    Run Keyword If Test Failed  Capture Page Screenshot

Before Suite ExternalSite
    ${file_name}=  Get Variable value  ${SUITE NAME}
    IF  '${local_execution_flag}'=='True'
        Launch Browser  ${ext_URL}  ${local_execution_browser}
    END
    IF  '${sauce_execution_flag}'=='True'
        Launch ORC ExternalSite  ${file_name}
    END
#    Launch Browser  ${ext_URL}  ${Browser}
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

Before Suite
    ${file_name}=  Get Variable value  ${SUITE NAME}
    IF  '${local_execution_flag}'=='True'
        Launch Browser  ${URL}  ${local_execution_browser}
    END
    IF  '${sauce_execution_flag}'=='True'
        Launch ORC  ${file_name}
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
        Launch ORC Analytics  ${file_name}
    END
    MAXIMIZE BROWSER WINDOW
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

After Suite
    End Web Test

After Test
    IF  '${local_execution_flag}'=='True'
            Run Keyword If Test Failed  Capture Page Screenshot
    END
    IF  '${sauce_execution_flag}'=='True'
            Run Keyword If Test Passed  Execute Javascript  sauce:job-result=passed
            Run Keyword If Test Failed  Execute Javascript  sauce:job-result=failed
            Close Browser
    END

Before Suite Start
    ${file_name}=  Get Variable value  ${SUITE NAME}
    Set Screenshot Directory  ./Screenshots
    Set Selenium Timeout    10s

Before Test
    Launch Browser  ${URL}  ${local_execution_browser}
    MAXIMIZE BROWSER WINDOW

After Test Run
    Run Keyword If Test Failed  Capture Page Screenshot
    close all browsers