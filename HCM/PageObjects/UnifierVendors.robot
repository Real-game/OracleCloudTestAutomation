*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierVendors.robot

*** Keywords ***
Select Vendors Frame
    Sleep  3s
    Select Frame  ${vendor_iframe}
    Sleep  3s

Open a specific Vendor
    [Arguments]  ${vendor_ID}
    Wait And Click Element  ${vendor_search_icon}
    Sleep  2s
    Wait And Click Element  ${vendor_id_search_condition_link}
    Wait And Click Element  ${search_condition_equals}
    Sleep  2s
    Wait And Set Text  ${vendor_id_search_field}  ${vendor_ID}
    Sleep  2s
    Wait And Click Element  ${apply_btn_search}
    Sleep  7s
    Wait And Click Element  ${close_btn_search}
    Sleep  2s
    Capture Page Screenshot
    ${xpath}  CATENATE  //td[@data-index='ven_vendorid_txt']//div[text()='${vendor_ID}']
    Double Click Element  ${xpath}
    Sleep  3s
    Switch Window  NEW
    MAXIMIZE BROWSER WINDOW
    Sleep  2s
    Capture Page Screenshot

Verify Vendor Status
    Wait Until Page Contains Element  ${site_information_tab}  60s  Vendor is not opened in a new window
    ${status}  Get Text  ${vendor_status_header}
    Should be equal  ${status}  Active  Vendor Status is not Active
    Capture Page Screenshot

Verify Site Information and Contact Info
    [Arguments]  ${site_id}  ${contact_num}
    Wait And Click Element  ${site_information_tab}
    Sleep  3s
    ${xpath}  CATENATE  //td[@data-index='ven_SiteID_txt']//div[text()='${site_id}']
    Element Should Be Visible  ${xpath}  Site ID ${site_id} added in EBS is not present
    Wait And Click Element  ${xpath}
    ${contact_info}  Get Text  ${work_phone_value}
    Should be equal  ${contact_info}  ${contact_num}  Contact Information is not the same as in EBS

Verify Vendor Header Information
    [Arguments]  ${vendor_ID}  ${vendor_name}  ${vendor_number}
    ${vendor_id_unifier}  Get Text  ${vendor_id_header}
    Should be equal  ${vendor_id_unifier}  ${vendor_ID}  Vendor ID is not the same as in EBS
    ${vendor_name_unifier}  Get Text  ${vendor_name_header}
    Should be equal  ${vendor_name_unifier}  ${vendor_name}  Vendor Name is not the same as in EBS
    ${vendor_number_unifier}  Get Text  ${vendor_number_header}
    Should be equal  ${vendor_number_unifier}  ${vendor_number}  Vendor Number is not the same as in EBS

Verify Added Site ID
    [Arguments]  ${site_id}
    Wait And Click Element  ${site_information_tab}
    Sleep  3s
    ${xpath}  CATENATE  //td[@data-index='ven_SiteID_txt']//div[text()='${site_id}']
    Element Should Be Visible  ${xpath}  Site ID ${site_id} added to the Exisiting Vendor in EBS is not present

Switch To Vendor Window
    Switch Window  title:Primavera Unifier
    Sleep  2s
    Select Vendors Frame
    Sleep  2s

Verify Vendor Status - Inactive
    Wait Until Page Contains Element  ${site_information_tab}  60s  Vendor is not opened in a new window
    ${status}  Get Text  ${vendor_status_header}
    Should be equal  ${status}  Inactive  Merged Vendor Status is Active
    Capture Page Screenshot





