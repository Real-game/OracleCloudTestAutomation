*** Settings ***
Library  Selenium2Library
Library  ../Helpers/Helpers.py
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Locators/UnifierHome.robot

*** Keywords ***

Click on Board Orders under CRE Master Log
    ${check}=   Run keyword and Return Status  Wait Until Page Contains Element  ${board_orders_link}  60s  board orders link is not displayed
    IF  '${check}'=='False'
        Wait Until Page Contains Element  ${cre_master_log_link}  120s  CRE Master Log link is not displayed in the Unifier home page
        Sleep  30s
        Click Element  ${cre_master_log_link}
        Capture Page Screenshot
    END
    Sleep  10s
    Wait Until Page Contains Element  ${board_orders_link}  60s  Board orders link is not displayed
    Click Element  ${board_orders_link}

Click on + Icon and Select Property Workspace
    [Arguments]  ${property_workspace_name}
    Sleep  10s
    Wait And Click Element  ${new_tab_button}
    Sleep  20s
    Wait And Verify Page Contains Element  ${search_workspace_field}  20s  Workspace Search Field not displayed
    Wait And Set Text  ${search_workspace_field}  ${property_workspace_name}
    Wait And Click Element  xpath: //div[@id='searchResultTable']//mark[@name='${property_workspace_name}']
#    Wait And Click Element  xpath: //div[@id='searchResultTable']//mark[text()='${property_workspace_name}']/parent::a
    Wait Until Page Contains  ${property_workspace_name}  60s  ${property_workspace_name} workspace is not displayed
    Sleep  10s
    Capture Page Screenshot

Select Property Contracts form CRE Portfolio Mgmt
    Sleep  10s
    ${check}=  Verify the element presence  ${cre_portfolio_mgmt_expanded}
    IF  '${check}'!='True'
        Wait And Verify Page Contains Element  ${cre_portfolio_mgmt_list}  20s  CRE Portfolio not displayed
        Click Required Element  ${cre_portfolio_mgmt_list}
    END
    Sleep  10s
    Scroll element into view  ${property_contracts_tab}
    Click Required Element  ${property_contracts_tab}
    Sleep  10s
    Capture Page Screenshot

Click on Owned Properties under CRE Master Log
    ${check}=   Run keyword and Return Status  Wait Until Page Contains Element  ${owned_properties_link}  30s  Owned Properties link is not displayed
    IF  '${check}'=='False'
        Wait Until Page Contains Element  ${cre_master_log_link}  30s  CRE Master Log link is not displayed in the Unifier home page
        Sleep  5s
        Click Element  ${cre_master_log_link}
        Capture Page Screenshot
    END
    Sleep  10s
    Click Element  ${owned_properties_link}
    Capture Page Screenshot

Select Owned Properties form CRE Portfolio Mgmt
    ${check}=  Verify the element presence  ${cre_portfolio_mgmt_expanded}
    IF  '${check}'!='True'
        Click Required Element  ${cre_portfolio_mgmt_list}
    END
    Sleep  10s
    Capture Page Screenshot
    Click Required Element  ${owned_properties_link}
    Sleep  2s
    Capture Page Screenshot And Retry If Required

Select Lease Actions form CRE Portfolio Mgmt
    Sleep  10s
    ${check}=  Verify the element presence  ${cre_portfolio_mgmt_expanded}
    IF  '${check}'!='True'
        Wait And Verify Page Contains Element  ${cre_portfolio_mgmt_list}  20s  CRE Portfolio not displayed
        Click Required Element  ${cre_portfolio_mgmt_list}
    END
    Sleep  10s
    Capture Page Screenshot
    Scroll element into view  ${lease_actions_link}
    Click Required Element  ${lease_actions_link}

Select Tasks Menu
    [Arguments]  ${workspace_name}
    Sleep  5s
    Click Required Element  xpath://li[contains(@aria-label,'${workspace_name}')]//following-sibling::li//span[text()='Tasks']
    Sleep  20s
    #Wait Until Page Contains Element  ${tasks_header}  60s  Tasks page is not displayed
    Capture Page Screenshot

Select Contract Receivables from CRE Cost Mgmt
    [Arguments]  ${workspace_name}
    Sleep  2s
    Switch Window  title:Primavera Unifier
    Click Required Element  xpath: //li[contains(@aria-label,'${workspace_name}')]//following-sibling::li//span[text()='CRE Cost Mgmt.']
    Click Required Element  xpath: //li[contains(@aria-label,'${workspace_name}')]//following-sibling::li//span[text()='Contract Receivables']
    Sleep  10s
    #Wait Until Page Contains Element  ${contracts_receivables_header}  60s  Property Contracts page is not displayed
    Capture Page Screenshot

Click on + Icon and Select a Property Workspace
    [Arguments]  ${property_workspace_name}
    Sleep  5s
    Wait And Click Element  ${new_tab_button}
#    ${work_space}  CATENATE  ${property_workspace_name}${SPACE}
    Wait And Set Text  ${search_workspace_field}  ${property_workspace_name}
#    Wait And Set Text  ${search_workspace_field}  ${work_space}
    Wait And Click Element  xpath: //div[@id='searchResultTable']//mark[@name='${property_workspace_name}']
#    Wait And Click Element  xpath: //div[@id='searchResultTable']//a[text()='${property_workspace_name}']
    Wait Until Page Contains  ${property_workspace_name}  60s  ${property_workspace_name} workspace is not displayed
    Capture Page Screenshot

Click on + Icon and Select Company Workspace
    Wait And Click Element  ${new_tab_button}
    Sleep  20s
    Wait And Click Element  ${mx_company_link_home_page}
    Wait Until Element Is Visible  ${company_logs_link}  30s  Company logs link is not displayed
    Capture Page Screenshot

Select a Customer from Company Logs
    Click Element  ${company_logs_link}
    Wait Until Element Is Visible  ${customers_link}  30s  Customers link is not displayed
    Click Element  ${customers_link}
    Sleep  15s
    Capture Page Screenshot

Select Customer Site link from Company Logs
    Click Element  ${company_logs_link}
    Wait Until Element Is Visible  ${customers_sites_link}  30s  Customers site link is not displayed
    Click Element  ${customers_sites_link}
    Sleep  15s
    Capture Page Screenshot

Select MX Company in the Home Page
    Wait And Click Element  ${m_x_company_tab}
    Sleep  5s
    #Wait Until Page Contains  ${m_x_company_section}  60s  ${m_x_company_section} MX Company is not displayed
    Capture Page Screenshot

Select User Defined from Reports
    Sleep  3s
    ${check}=  run keyword and return status  Wait Until Element Is Visible  ${reports_section}  20s
    IF  '${check}'=='True'
        Wait And Click Element  ${reports_section}
        Sleep  3s
        Capture Page Screenshot And Retry If Required
    END
#    Wait And Click Element  ${reports_section}
    scroll element into view  ${user_defined_link}
    Sleep  2s
    Wait And Click Element  ${user_defined_link}
    Sleep  5s
    #Wait Until Page Contains  ${property_contracts_header}  60s  Property Contracts page is not displayed
    Capture Page Screenshot

Select GL Codes from GL Codes
    Wait And Click Element  ${gl_codes_section}
    Wait And Click Element  ${gl_codes_submenu_link}
    Sleep  5s
    Capture Page Screenshot

Select Location from GL Codes
    Wait And Click Element  ${gl_codes_section}
    Wait And Click Element  ${location_submenu_link}
    Sleep  5s
    Capture Page Screenshot

Select Account from GL Codes
    Wait And Click Element  ${gl_codes_section}
    Wait And Click Element  ${account_submenu_link}
    Sleep  5s
    Capture Page Screenshot

Select Cost Centers from GL Codes
    Wait And Click Element  ${gl_codes_section}
    Wait And Click Element  ${cost_centers_submenu_link}
    Sleep  5s
    Capture Page Screenshot

Select Vendors from Company Logs
    Wait And Click Element  ${company_logs_section}
    Wait And Click Element  ${vendors_submenu_link}
    Sleep  5s
    Capture Page Screenshot

Select Contract Payables from CRE Cost Management
    ${checker}=  Run Keyword and Return Status  Wait And Click Element  ${cre_cost_management_link}
    IF  "${checker}"=="True"
        Sleep  5s
        capture page screenshot
    ELSE
        Sleep  5s
        Wait And Click Element  ${cre_cost_management_link2}
        Sleep  2s
    END
#    Wait and Click Element  ${cre_cost_management_link2}
    Sleep  5s
#    scroll element into view  ${contract_payable_sub_menu_link}
    Sleep  2s
    Wait and Click Element  ${contract_payable_sub_menu_link}
    Capture Page Screenshot

Select Property Tax Invoice from CRE Master Log
    ${check}=   Run keyword and Return Status  Wait And Click Element  ${property_tax_invoice_link}
    IF  '${check}'=='False'
        Wait And Click Element  ${cre_master_log_link}
        Wait And Click Element  ${property_tax_invoice_link}
    END
    Sleep  5s
    Capture Page Screenshot

Click on + icon and select MX CRE BU property shell
    Sleep  5s
    Wait And Click Element  ${new_tab_button}
    Sleep  5s
    Wait And Click Element  ${mx_cre_bu_link}
    Sleep  5s
    #Wait Until Element Is Visible  ${mx_cre_bu_property_shell_header}  30s
    Capture Page Screenshot

Click on Owned Properties BU under CRE Portfolio Management
    Sleep  10s
    ${check}=   Run keyword and Return Status  Wait Until Page Contains Element  ${owned_properties_bu_link}  30s  Owned Properties BU link is not displayed
    IF  '${check}'=='False'
        ${checker}=  Run Keyword and Return Status  Wait And Click Element  ${cre_portfolio_mgmt}
        IF  "${checker}"=="True"
            capture page screenshot
        ELSE
            Sleep  2s
            Wait And Click Element  ${cre_portfolio_mgmt2}
            Sleep  2s
        END
#        Wait Until Page Contains Element  ${cre_portfolio_mgmt}  30s  CRE Portfolio Management link is not displayed in the Unifier home page
#        Sleep  5s
#        Wait and Click Element  ${cre_portfolio_mgmt}
#        Capture Page Screenshot
    END
    Sleep  10s
    Wait And Click Element  ${owned_properties_bu_link}
    Capture Page Screenshot

Click on Property Contracts BU under CRE Portfolio Management
    ${check}=  Verify the element presence  ${cre_portfolio_mgmt_expanded}
    IF  '${check}'!='True'
        Sleep  5s
        Click Required Element  ${cre_portfolio_mgmt_list}
    END
    Sleep  2s
    Wait And Click Element  ${property_contracts_bu_link}
    Sleep  5s
    Capture Page Screenshot

Select Contract Receivables link from CRE Cost Management
    Wait and Click Element  ${cre_cost_management_link}
    Wait and Click Element  ${contract_receivable_sub_menu_link}
    Capture Page Screenshot

Click on menu next to My Dashboard
    Click Required Element  ${my_dashboard_link}
    Sleep  3s
    Click Required Element  ${details_link}
    Sleep  3s
    Capture Page Screenshot

Update the assessment roll number
    [Arguments]  ${assessment_roll_number_value}
    Click Required Element  ${assessment_roll_#}
    Input Text  ${assessment_roll_#}  ${assessment_roll_number_value}
    Sleep  3s
    Capture Page Screenshot
    Click Required Element  ${save_details_button}

Select the dashboard frame
    Sleep  3s
    Select Required frame  ${dashboard_iframe}
    Sleep  5s

Click on CRE Master Log and select Property Contracts
    Sleep  15s
    ${Checker}=  run keyword and return status  Wait until element is visible  ${CRE_tab}  10s  CRE Master Log
    IF  "${Checker}"=="True"
        Wait and Click Element 	${CRE_tab}
    END
#    Click Element 	${CRE_tab}
    Sleep  10s
    Capture Page Screenshot
    Wait and Click Element	${Property_tab}
    Sleep  20s
    Capture Page Screenshot

Click on CRE Master Log and select Contract Recievables
    Sleep  20s
    ${Checker}=  run keyword and return status  Wait until element is visible  ${CRE_tab}  10s  CRE Master Log
    IF  "${Checker}"=="True"
        Wait and Click Element 	${CRE_tab}
    END
    Sleep  10s
    Capture Page Screenshot
    Wait and Click Element	${Receivables_tab}
    Sleep  20s
    Capture Page Screenshot