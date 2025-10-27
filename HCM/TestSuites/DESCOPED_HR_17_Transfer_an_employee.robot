*** Settings ***
Library  Selenium2Library
Library  DataDriver  ../CSV/td_HR_17_Transfer_an_Employee.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/Login.robot
Resource  ../PageObjects/HomePage.robot
Resource  ../PageObjects/Transfer.robot
Resource  ../PageObjects/EmploymentInfo.robot
Resource  ../PageObjects/PersonalInformation.robot
Resource  ../PageObjects/PersonManagement.robot
Documentation  Transfer an Employee
...            Prerequisite:  Position code
...            Environment Specific Data:  HR Login User; Position Code; Employee Number
...            Reusable Data: Employment Section;Additional Assignment Info;Maintain Manager Info;Salary Info;Compensation Inf;Reassign reports Info;Add Direct report Info;Comments Info
...            Dynamic Data: Transfer Start Date;Reason for Transfer;Position Code;Salary Basis;Salary Amount;Position Seniority Rank;Bargaining Unit Seniority Rank;Section Seniority Date;Contract Start Date;Contract End Date;Contract Type;Contract Reason;Proposed Manager Name;Add Direct Report Name;Comments


*** Settings ***
Suite Setup  Before Suite
Suite Teardown  After Suite
Test Teardown  After Test
Test Template  Transfer an Employee

*** Variables ***
${json_path}    ./TestData/td_HR_17_Transfer_an_Employee.json
${csv_path}  ./CSV/td_HR_17_Transfer_an_Employee.csv

*** Test Cases ***
Transfer an Employee - ${Id} ${HR Login User} ${Employment Section} ${Employee Number} ${Additional Assignment Info} ${Maintain Manager Info} ${Salary Info} ${Compensation Info} ${Reassign reports Info} ${Add Direct report Info} ${Comments Info} ${Transfer Start Date} ${Reason for Transfer} ${Position Code} ${Position Seniority Rank} ${Bargaining Unit Seniority Rank} ${Section Seniority Date} ${Contract Start Date} ${Contract End Date} ${Contract Type} ${Contract Reason} ${Salary Basis} ${Salary Amount} ${Proposed Manager Name} ${Add Direct Report Name} ${Comments}
#    generatejson  ${csv_path}  ${json_path}
#    ${data}=  readJson  ${json_path}
*** Keywords ***
Transfer an Employee
    [Arguments]  ${Id}  ${HR Login User}  ${Employment Section}  ${Employee Number}  ${Additional Assignment Info}  ${Maintain Manager Info}  ${Salary Info}  ${Compensation Info}  ${Reassign reports Info}  ${Add Direct report Info}  ${Comments Info}  ${Transfer Start Date}  ${Reason for Transfer}  ${Position Code}  ${Position Seniority Rank}  ${Bargaining Unit Seniority Rank}  ${Section Seniority Date}  ${Contract Start Date}  ${Contract End Date}  ${Contract Type}  ${Contract Reason}  ${Salary Basis}  ${Salary Amount}  ${Proposed Manager Name}  ${Add Direct Report Name}  ${Comments}
    Log  Step 1-3
    Login Using  ${HR Login User}
    Log  Step 4
    click on homepage
    Log  Step 5 - 6
    Go to my client groups show more
    Log  Step 7
    Click Option under Employment Section  ${Employment Section}
    Log  Step 8
    Search And Select Person  ${Employee Number}
    Log  Step 9
    Select manage info in Transfer page  ${Additional Assignment Info}  ${Maintain Manager Info}   ${Salary Info}  ${Compensation Info}  ${Reassign reports Info}  ${Add Direct report Info}  ${Comments Info}
#    Select manage info checkbox in Transfer
    Log  Step 10
    Select Continue
    Log  Step 11 - 12
    Fill The Details In When and Why  ${Transfer Start Date}  ${Reason for Transfer}
    Log  Step 13
    Continue
    Log  Step 14 - 15
    Select Position On Transfer Page  ${Position Code}
    Continue
    Log  Step 16 - 23
    Fill Additional Assignment Info In Transfer  ${Additional Assignment Info}   ${Position Seniority Rank}  ${Bargaining Unit Seniority Rank}  ${Section Seniority Date}  ${Contract Start Date}  ${Contract End Date}  ${Contract Type}  ${Contract Reason}
    Log  Step 24
    Select Maintain Manager in Transfer  ${Maintain Manager Info}
    Log  Step 25 - 27
    Fill Salary Details in Transfer  ${Salary Info}  ${Salary Basis}  ${Salary Amount}
    Log  Step 28
    Select Compensation in Transfer  ${Compensation Info}
    Log  Step 29 - 30
    Select Reassign Existing Reports  ${Reassign reports Info}   ${Proposed Manager Name}
    Log  Step 31 - 32
    Select Add Direct Reports  ${Add Direct report Info}  ${Add Direct Report Name}
    Log  Step 32
    Add Comments on Transfer page  ${Comments Info}  ${Comments}
    Log  Step 33
    Submit Details
    Log  Step 34 - 35
    Go to my client groups show more
    Log  Step 36
    Click Employment Info Under Employment Section
    Log  Step 37 - 38
    Search And Select Person  ${Employee Number}
    Log  Step 39
    Expand Employment History
    Log  Step 40
    Verify Employment History has Transfer
    Log  Step 41
#    click on homepage
    Logout
#    Log  Step 42 - 43
#    Go to my client groups show more
#    Log  Step 44
#    Click on Seniority Dates
#    Log  Step 45
#    Search for a person Number  ${data}[Employee Number]
#    Log  Step 46 - 47
#    Check Seniority Dates
