*** Settings ***
Library  Selenium2Library
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/PersonalInformation.robot

*** Keywords ***

Click My Contact Information
    Wait And Click Element  ${href_my_contact_information}
    Wait Until Page Contains  Contact Info  20s  Contact Info page is not displayed
    Sleep  3s
    Capture Page Screenshot

Click Communication Edit Icon
    wait and click element  ${href_edit_number}
    Sleep  3s
    Capture Page Screenshot

Select Type
    [Arguments]  ${type}
    Wait And Send Keys  ${href_type}  ${type}
    Sleep  3s
    Capture Page Screenshot

Enter Area Code
    [Arguments]  ${area_code}
    Wait And Set Text  ${href_area_code}  ${area_code}
    Sleep  3s
    Capture Page Screenshot

Enter Number
    [Arguments]  ${number}
    Wait And Set Text  ${href_number}  ${number}
    Sleep  3s
    Capture Page Screenshot

Click Adderess Edit Icon
    wait and click element  ${href_edit_address}
    Sleep  3s
    Capture Page Screenshot

Select Start Date
    ${date}=  Get Current Date Dd Mmm Yyyy
    Wait And Set Text  ${href_address_change_start_date}  ${date}
    Sleep  3s
    Capture Page Screenshot

Enter Address1
    [Arguments]  ${Address1}
    Wait And Set Text  ${href_address1}  ${Address1}
    Sleep  3s
    Capture Page Screenshot

Enter Address2
    [Arguments]  ${Address2}
    Wait And Set Text  ${href_address2}  ${Address2}
    Sleep  3s
    Capture Page Screenshot

Click Submit
    wait and click element  ${hsubmit_button}
    Sleep  3s
    Capture Page Screenshot

Click Family And Emergency Contacts
    Wait And Click Element  ${href_my_family_friend_emergency}
    Capture Page Screenshot

Click Add And Then Create A New Contact
    [Arguments]  ${action}
    wait and click element  ${href_add_button}
    Sleep  3s
    Wait And Click Element  xpath: //td[text()="${action}"]
#    Select Required Value  ${href_add_button_action}   Create a New Contact
    Sleep  3s
    Capture Page Screenshot

Click Add And Then Select a Coworker as a Contact
    wait and click element  ${href_add_button}
    Sleep  3s
    Select Required Value  ${href_add_button_action}   Select a Coworker as a Contact
    Sleep  5s
    Capture Page Screenshot

Enter Last Name
    [Arguments]  ${last_name}
    Wait And Set Text  ${href_last_name}  ${last_name}
    Sleep  3s
    Capture Page Screenshot

Enter First Name
    [Arguments]  ${first_name}
    Wait And Set Text  ${href_first_name}  ${first_name}
    Sleep  3s
    Capture Page Screenshot

Select Title
    [Arguments]  ${title}
    Wait And Click Element  ${href_title}
    Wait And Click Element  xpath: //li[text()="${title}"]
    Sleep  3s
    Capture Page Screenshot

Selet Relationship
    [Arguments]  ${relationship}
    Wait And Click Element  ${href_relationship}
    Wait And Click Element  xpath: //li[text()="${relationship}"]
    Sleep  3s
    Capture Page Screenshot

Select Relationship Start Date
    [Arguments]  ${date}
    Wait And Set Text  ${href_relationship_start_date}  ${date}
    Sleep  3s
    Capture Page Screenshot

Submit Contact Information
    Wait And Click Element  ${href_emergency_details_submit}
    Sleep  3s
    Capture Page Screenshot

Click Employment Info Page
    Wait And Click Element  ${href_employment_info_tab}
    Sleep  5s
    Capture Page Screenshot

Click Home Phone Edit Icon
    Wait And Click Element  ${edit_home_num}
    Sleep  3s
    Capture Page Screenshot

Click My Documents
    Wait Until Page Contains  My Documents  20s  Personal Information page is not displayed
    Capture Page Screenshot
    Wait And Click Element  ${href_my_documents}
    Wait Until Page Contains  Document Records  20s  Document Records page is not displayed
    Sleep  2s
    Capture Page Screenshot

Search for a person
    [Arguments]  ${person}
    Wait And Send Keys  ${search_person}  ${person}
    Wait And Click Element  ${select_first_row}
    Wait Until Page Contains  ${person}  20s  Person Name is not displayed in page
    Sleep  2s
    Capture Page Screenshot

Enter Home Number
    [Arguments]  ${number}
    Wait And Set Text  ${home_number_input}  ${number}
    Sleep  3s
    Capture Page Screenshot

Enter City
    [Arguments]  ${city}
    Wait And Send Keys  ${city_input}  ${city}
    Sleep  3s
    Wait And Click Element  ${select_first_row}
    Sleep  3s
    Capture Page Screenshot

Enter Postal Code
    [Arguments]  ${postal_code}
    Wait And Send Keys  ${postal_code_input}  ${postal_code}
    Sleep  3s
    Wait And Click Element  ${select_first_row}
    Sleep  3s
    Capture Page Screenshot

Click on My Compensation
    Wait Until Page Contains  My Compensation  20s  My Compensation in Personal Information page is not displayed
    Sleep  2s
    Scroll Element Into View  ${my_compensation}
    Capture Page Screenshot
    Sleep  2s
    Wait And Click Element  ${my_compensation}
    Wait Until Page Contains  Current Salary  20s  My Compensation page is not displayed
    Capture Page Screenshot

Search for a person Number
    [Arguments]  ${person}
    Wait And Send Keys  ${search_person}  ${person}
    Wait And Click Element  ${select_first_row}
    Sleep  5s
    Capture Page Screenshot