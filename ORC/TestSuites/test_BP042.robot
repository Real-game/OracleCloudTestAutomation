*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP042.json
${csv_path}  ./CSV/td_BP042.csv
#${prerequisites_json_path}  ./TestData/td_BP017.json  #If we want to run BP042 seperately - Update BP017 Json

*** Test Cases ***

Scenario: Present and Manage Offers (Candidate offer response (External))
    [Tags]  External
    generatejson  ${csv_path}  ${json_path}
#    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
#    appendtojson  ${json_path}  Email  ${prerequisites_data}[Email]
#    generatecsv  ${json_path}  ${csv_path}
#    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
#    Authentication for Job Offer  ${data}[Email]  ${data}[Action on Offer]  ${data}[Full Name]  ${data}[Decline Reason]
    Take action on Job Offer  ${data}[Email]  ${data}[Action on Offer]  ${data}[Full Name]  ${data}[Decline Reason]
    Sleep  10s
