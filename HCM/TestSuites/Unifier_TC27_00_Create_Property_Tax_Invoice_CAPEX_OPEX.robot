*** Settings ***
Library  DataDriver  ../CSV/td_TC27_00_Create_Property_Tax_Invoice_CAPEX_OPEX.csv
Resource  ../Keywords/CommonKeywords.robot
Resource  ../Helpers/SetupAndTeardown.robot
Resource  ../PageObjects/UnifierLogin.robot
Resource  ../PageObjects/UnifierLanding.robot
Resource  ../PageObjects/UnifierHome.robot
Resource  ../PageObjects/Unifier_PropertyContract.robot
Resource  ../PageObjects/UnifierPropertyTaxInvoice.robot


*** Settings ***
Suite Setup  Before Suite for Unifier Test
Suite Teardown  After Suite
Test Setup  Before Suite for Unifier Test
Test Teardown  After Suite
Test Template  Create Property Tax Invoice

*** Variables ***
${json_path}    ./TestData/td_TC27_00_Create_Property_Tax_Invoice_CAPEX_OPEX.json
${csv_path}  ./CSV/td_TC27_00_Create_Property_Tax_Invoice_CAPEX_OPEX.csv

*** Test Cases ***
Create Property Tax Invoice CAPEX OPEX with - ${ID} ${Login_User} ${Property_Workspace_Name} ${Metrolinx_Property_Name} ${Roll_Number} ${Invoice_Number} ${Receipt_Date} ${Ref_Owned_Property} ${Vendor_ID} ${Vendor_Site_ID} ${Assessment_Year} ${Education_Levy} ${Total_Annual_Property_Tax} ${Property_Tax_Amount_per_Invoice} $CAPEX-OPEX} ${Project} ${Asset_Category} ${Location} ${Expenditure_Org_Name} ${Expenditure_Type} ${Business_Line} ${Cost_Center} ${GL_Code_Combo} ${Subject_PIN} ${Process_Date}
    [Tags]  PropertyTaxInvoice  ModifyData

*** Keywords ***
Create Property Tax Invoice
    [Arguments]  ${ID}  ${Login_User}  ${Property_Workspace_Name}  ${Metrolinx_Property_Name}  ${Roll_Number}  ${Invoice_Number}  ${Receipt_Date}  ${Ref_Owned_Property}  ${Vendor_ID}  ${Vendor_Site_ID}  ${Assessment_Year}  ${Education_Levy}  ${Total_Annual_Property_Tax}  ${Property_Tax_Amount_per_Invoice}  $CAPEX-OPEX}  ${Project}  ${Asset_Category}  ${Location}  ${Expenditure_Org_Name}  ${Expenditure_Type}  ${Business_Line}  ${Cost_Center}  ${GL_Code_Combo}  ${Subject_PIN}  ${Process_Date}
    Log  Step 1
    Unifier Login Using  ${Login_User}
    Log  Step 2
    Click on home icon in landing Page
    Log  Step 3
    Select Property Tax Invoice from CRE Master Log
    Log  Step 4
    Click Create Property Tax Invoice Icon  ${Property_Workspace_Name}
    Log  Step 5
    Select Value from Advanced Search  Metrolinx Property Name  ${Metrolinx_Property_Name}
    Log  Step 6
    Input Roll Number on Invoice  ${Roll_Number}
    Sleep  3s
    Input Invoice Number  ${Invoice_Number}
    Input Current Receipt Date  ${Receipt_Date}
    Log  Step 7
    Select Value from Advanced Search  Ref. Owned Property  ${Ref_Owned_Property}
    Select Value from Advanced Search  Vendor ID  ${Vendor_ID}
    Select Value from Advanced Search  Vendor Site ID  ${Vendor_Site_ID}
    Log  Step 8
    Select Assessment Year  ${Assessment_Year}
    Input Education Levy  ${Education_Levy}
    Input Total Annual Property Tax  ${Total_Annual_Property_Tax}
    Input Property Tax Amount Per Invoice  ${Property_Tax_Amount_per_Invoice}
    Log  Step 9
    Select CAPEX-OPEX option  ${CAPEX-OPEX}
    Log  Step 10
    IF  "${CAPEX-OPEX}" == "CAPEX"
        Select Value from Advanced Search  Project  ${Project}
        Input EBS Number  ${Asset_Category}
        Select Value from Advanced Search  Asset Category  ${Asset_Category}
        Select Value from Advanced Search  Location (CAPEX)  ${Location}
        Select Value from Advanced Search  Expenditure Org Name  ${Expenditure_Org_Name}
        Select Value from Advanced Search  Expenditure Type  ${Expenditure_Type}
    END
    IF  "${CAPEX-OPEX}" == "OPEX"
        Select Value from Advanced Search  Business Line  ${Business_Line}
        Select Value from Advanced Search  Cost Center  ${Cost_Center}
        Select Value from Advanced Search  GL Code Combo  ${GL_Code_Combo}
    END
    Log  Step 11
    Input Subject PIN  ${Subject_PIN}
    Log  Step 12
    Input Process Date  ${Process_Date}
    Log  Step 13
    Submit Record