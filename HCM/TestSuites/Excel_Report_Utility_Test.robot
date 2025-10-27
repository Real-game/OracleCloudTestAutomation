*** Settings ***
Library  ../Helpers/ExcelReportUtility.py

*** Settings ***


*** Variables ***
${reference_report}  Report1  #Reference report default path set to: HCM\TestData and default file type is .xls
${reference_report_start_row}  7
${validation_report}  Report2  #validation report default path set to: Downloads and default file type is .xls
${validation_report_start_row}  7

*** Test Cases ***
Scenario: Excel utility custom keyword check
    #Check entire report
    Log  Checking entire report...
    log to console  Checking entire report...
    ${all_data_validation_result}=  ExcelReportUtility.compare_excel_all_columns  ${reference_report}  ${validation_report}
    Log  ${all_data_validation_result}
    log to console  ${all_data_validation_result}
    IF  "${all_data_validation_result}"!="True"
        fail  Report is not same. Please find log for details.
    END

    #Skip given rows and check report
    Log  Skipping given rows and checking report...
    log to console  Skipping given rows and checking report...
    ${skip_column_list}=  create list  Last Name  First Name
    ${skip_column_data_validation_result}=  ExcelReportUtility.compare_excel_skip_columns  ${reference_report}  ${validation_report}  ${skip_column_list}  ${reference_report_start_row}  ${validation_report_start_row}
    Log  ${skip_column_data_validation_result}
    log to console  ${skip_column_data_validation_result}
    IF  "${skip_column_data_validation_result}"!="True"
        fail  Report is not same. Please find log for details.
    END

    #Check specific row of report
    Log  Checking given rows and skipping remaining report...
    log to console  Checking given rows and skipping remaining report...
    ${specific_column_list}=  create list  Last Name
    ${specific_column_data_validation_result}=  ExcelReportUtility.compare_excel_specific_columns  ${reference_report}  ${validation_report}  ${specific_column_list}  ${reference_report_start_row}  ${validation_report_start_row}
    Log  ${specific_column_data_validation_result}
    log to console  ${specific_column_data_validation_result}
    IF  "${specific_column_data_validation_result}"!="True"
        fail  Report is not same. Please find log for details.
    END
    Log To Console  DONE