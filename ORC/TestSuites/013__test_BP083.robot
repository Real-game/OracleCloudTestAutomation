*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/ExternalSiteHomepage.robot
Documentation  Candidate Provide Personal Info (External Candidate)
...            Prerequisite:  Candidate with status of "Post Offer Checks, To be Checked" in environment
...            Environment Specific Data:  Email
...            Reusable Data: Date of Birth; Gender
...            Dynamic Data: Full Name; Social Insurance Number
...            Automation Data: Email (Data fetch from Automation code)

*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP083.json
${csv_path}  ./CSV/td_BP083.csv
${prerequisites_json_path}  ./TestData/td_BP017.json  #If we want to run BP042 seperately - Update BP017 Json

*** Test Cases ***
Scenario: Additional Information Provided for Candidate (Candidate provide personal info (External))
    [Tags]  ExternalNewHire   April19
    generatejson  ${csv_path}  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  Email  ${prerequisites_data}[Email]
    appendtojson  ${json_path}  First Name  ${prerequisites_data}[First Name]
    appendtojson  ${json_path}  Last Name  ${prerequisites_data}[Last Name]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}

    Log  Step 1 - 15
    Mailinator Respond to Additional Info Required  ${data}[Email]
    Log  Step 16 - 18
    Select Date of Birth Value under Personal Info  ${data}[Date of Birth]
    Log  Step 19 - 23
    Enter National Identifier details under Personal Info  ${data}[Social Insurance Number]
    Log  Step 24 - 25
    Select Gender value under Personal Info  ${data}[Gender]
    Log  Step 26
    Enter E-Signature under Personal Info  ${data}[First Name]  ${data}[Last Name]
    Log  Step 27 - 28
    Click Submit Button under Personal Info
