*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierCreateNewBoardOrders.robot

*** Keywords ***

Update board order Status
    [Arguments]  ${board_order_status_value}
    Wait Until Element Is Visible  ${board_order_status_drop_down}   60s  Board order status drop down is not displayed
    Click Element  ${board_order_status_drop_down}
    ${xpath}=  Catenate   SEPARATOR=  //li/div[text()='${board_order_status_value}']
    Click Element  xpath:${xpath}
    Capture Page Screenshot

Validate board order details
    [Arguments]  ${application_board_entity_value}  ${board_order_number_value}  ${date_of_agreement_value}  ${board_order_file_number_value}  ${comments_on_payment_structure_value}
    Wait Until Element Is Visible  ${applicable_board_entity_input}   60s  Board order status drop down is not displayed
    Input Text  ${applicable_board_entity_input}  ${application_board_entity_value}
    Input Text  ${board_order_number_input}  ${board_order_number_value}
    Input Text  ${date_of_agreement_input}  ${date_of_agreement_value}
    Input Text  ${board_order_file_number_input}  ${board_order_file_number_value}
    Input Text  ${comments_on_payment_structure_input}  ${comments_on_payment_structure_value}
    Capture Page Screenshot

Validate board order parties information details
    [Arguments]  ${parties_to_agreement_1_value}  ${parties_to_agreement_2_value}  ${parties_to_agreement_3_value}  ${parties_to_agreement_4_value}
    Wait Until Element Is Visible  ${parties_to_agreement_1_input}   60s  Board order status drop down is not displayed
    Input Text  ${parties_to_agreement_1_input}  ${parties_to_agreement_1_value}
    Input Text  ${parties_to_agreement_2_input}  ${parties_to_agreement_2_value}
    Input Text  ${parties_to_agreement_3_input}  ${parties_to_agreement_3_value}
    Input Text  ${parties_to_agreement_4_input}  ${parties_to_agreement_4_value}
    Capture Page Screenshot


Submit the board order
    Click Element  ${submit_board_order}
    Capture Page Screenshot
    Sleep  20s

Switch to board order window
    Sleep  5s
    ${list}=  Get Window Handles
    Switch Window  ${list}[2]

Validate Location Information block
    [Arguments]  ${location_description_value}  ${mileage_point_from_value}  ${mileage_point_to_value}  ${subdivision_value}
    Input Text  ${location_description_input}  ${location_description_value}
    Input Text  ${mileage_point_from_input}  ${mileage_point_from_value}
    Input Text  ${mileage_point_to_input}  ${mileage_point_to_value}
    Click Element  ${subdivision_drop_down}
    ${xpath}=  Catenate   SEPARATOR=  //li/div[text()='${subdivision_value}']
    Click Element  xpath:${xpath}
    Capture Page Screenshot

Validate board order requirements
    [Arguments]  ${property_contract_id_value}  ${board_order_requirements_value}
    Click Element  ${property_contract_lookup_icon}
    Wait Until Element Is Visible  ${property_contract_search_icon}  60s  Property contract search icon is not displayed
    Sleep  10s
    Click Element  ${property_contract_search_icon}
    Wait Until Element Is Visible  ${record_number_search_input}  60s  Record number search input is not displayed
    Sleep  5s
    Input Text  ${record_number_search_input}  ${property_contract_id_value}
    Sleep  3s
    Click Element  ${search_board_order_apply}
    Sleep  5s
    ${record_xpath}=  Catenate  SEPARATOR=  //div[contains(text(),'${property_contract_id_value}')]
    Click Element   xpath: ${record_xpath}
    Sleep  3s
    Click Element  ${select_button}
    Sleep  5s
    Input Text  ${requirements_of_board_order_input}  ${board_order_requirements_value}
    Capture Page Screenshot



