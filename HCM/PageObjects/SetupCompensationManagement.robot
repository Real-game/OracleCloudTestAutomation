*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Locators/SetupCompensationManagement.robot
Resource  ../Keywords/CommonKeywords.robot

*** Keywords ***
Click Workforce Structures Then Show All Tasks
    wait and click element  ${workforce_structure}
    Sleep  3s
    select from list by label  pt1:r1:0:r0:0:r1:0:AP1:AT1:_ATp:soc1  All Tasks
    Sleep   3s
    capture page screenshot

Click Manage Positions
    wait and send keys  ${search_input_box}  Manage Positions
    Sleep  3s
    wait and click element  ${search_icon}
    Sleep  3s
    wait and click element  ${workforce_structure_manage_positions}
    Sleep  3s
    capture page screenshot