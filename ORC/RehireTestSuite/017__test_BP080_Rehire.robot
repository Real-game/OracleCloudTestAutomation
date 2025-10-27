*** Settings ***
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/PendingEmployees.robot
Documentation  Convert PW to Employee ( Convert Pending Worker to Employee )
...            Prerequisite: Employee's Job application Should be in Moved to HR status
...            Environment Specific Data: Journeys Specialist User
...            Reusable Data: Action
...            Dynamic Data: First Name; Last Name
...            Automation Data: Requisition Id (Get from BP001); Candidate Name (Name Get from BP017)

*** Settings ***

Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test

*** Variables ***
${json_path}    ./TestData/td_BP080_rehire.json
${csv_path}  ./RehireCSV/td_BP080_rehire.csv
${prerequisites_json_path}  ./TestData/td_BP017_rehire.json  #If we want to run this case seperately - Update td_BP017_rehire Json
${common_json_path}    ./TestData/td_User_Details.json
${common_csv_path}  ./CSV/td_User_Details.csv

*** Test Cases ***

Scenario: Convert PW to Employee ( Convert Pending Worker to Employee )
    [Tags]  RehireProcess1
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    ${prerequisites_data}=  readJson  ${prerequisites_json_path}
    appendtojson  ${json_path}  First Name  ${prerequisites_data}[First Name]
    appendtojson  ${json_path}  Last Name  ${prerequisites_data}[Last Name]
    generatecsv  ${json_path}  ${csv_path}
    generatejson  ${csv_path}  ${json_path}
    ${data}=  readJson  ${json_path}
    generatejson  ${common_csv_path}  ${common_json_path}
    ${common_data}=  readJson  ${common_json_path}

    Log  Step 1 - 3
    Login Using  ${common_data}[Journeys Specialist User]
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click on Pending Employees
    Log  Step 8
    ${candidate_name}=  getNameFromCandidateName  ${data}[First Name]  ${data}[Last Name]
    Log  name: ${candidate_name}
    Log  Step 9 - 13
    Take Action on Pending Employee  ${candidate_name}  ${data}[Action]
#    Update Candidate Address in Pending Employee  ${candidate_name}  ${data}[Action]   ${data}[Address]  ${data}[City]   ${data}[Province]  ${data}[Postal Code]
    Sleep  5s
    Logout
#    appendtojson  ${json_path}  Candidate Name  ${candidate_name}
#    generatecsv  ${json_path}  ${csv_path}