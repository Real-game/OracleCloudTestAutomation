import os
import xlrd
import getpass
from SeleniumLibrary.base import keyword
from SeleniumLibrary.base import LibraryComponent
import pandas as pd
from robot.api.deco import keyword

#Fetching Emp/Person Number
@keyword
def get_Employee_Number(file_name, first_col_header, required_col_header):
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
    py_xlrd = xlrd.open_workbook(default_download_path)
    py_sheet = py_xlrd.sheet_by_index(0)
    employee_col = -1
    employee_row = -1

    for i in range(py_sheet.nrows):
        if py_sheet.cell_value(i, 0).strip() == first_col_header:
            header_row = i
            break

    for i in range(py_sheet.ncols):
        if py_sheet.cell_value(header_row, i).strip() == required_col_header:
            employee_col = i
            break

    return py_sheet.cell_value(header_row + 1, employee_col).strip()


#Deleting a file fron downloads folder
@keyword
def delete_File(file_name):
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"

    if os.path.exists(default_download_path):
        os.remove(default_download_path)
    else:
        print("The file does not exist")
        #return "Absent"

#Validating presence of file in downloads folder
def validate_file_presence(file_name):
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"

    if os.path.exists(default_download_path):
        return  "Present"
    else:
        print("The file does not exist")
        return "Absent"

#Validating Report Header
def validate_report_header(file_name, report_header):
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
    py_xlrd = xlrd.open_workbook(default_download_path)
    py_sheet = py_xlrd.sheet_by_index(0)
    if py_sheet.cell_value(0, 0).strip() == report_header:
        return  "Success"
    else:
        return  py_sheet.cell_value(0, 0).strip()

#Validation
@keyword
def get_Employee_Number_perform_Validation(file_name, first_col_header, required_col_header, validation_param_header, validation_value):
    user_name = getpass.getuser()
    #default_download_path = r'C:\\Users\\' + user_name + '\\Downloads\\' + file_name + '.xls'  # windows
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
    py_xlrd = xlrd.open_workbook(default_download_path)
    py_sheet = py_xlrd.sheet_by_index(0)
    employee_col = -1
    employee_row = -1

    for i in range(py_sheet.nrows):
        if py_sheet.cell_value(i, 0).strip() == first_col_header:
            header_row = i
            break

    for i in range(py_sheet.ncols):
        if py_sheet.cell_value(header_row, i).strip() == required_col_header:
            employee_col = i
            break

    for i in range(py_sheet.ncols):
        if py_sheet.cell_value(header_row, i).strip() == validation_param_header:
            validation_col = i
            break

    validation_cell_Val = py_sheet.cell_value(header_row + 1, validation_col).strip()
    if validation_cell_Val.casefold() == validation_value.casefold():
        return True
    else:
        return False


# Trial
@keyword
def get_Employee_Number_trial(file_name, first_col_header, required_col_header):
    user_name = getpass.getuser()
    default_download_path = r'C:\\Users\\' + user_name + '\\Downloads\\' + file_name + '.xls'  # windows
    py_xlrd = xlrd.open_workbook(default_download_path)
    py_sheet = py_xlrd.sheet_by_index(0)
    employee_col = -1
    employee_row = -1
    for i in range(py_sheet.ncols):
        if py_sheet.cell_value(9, i).strip() == 'Employee Number':
            employee_col = i
            break
    # return employee_col

    for i in range(py_sheet.nrows):
        if py_sheet.cell_value(i, 0).strip() == 'Employee Number':
            employee_row = i
            break
    # return employee_row

    return py_sheet.cell_value(employee_row + 1, 0).strip()


@keyword
def read_excel_single_column(column_name, file_name, sheet_index=0):
    """
        >>Read only single column from file with ".xls" extensions only and will not support to ".xlsx"
        >>Inputs:   file_name = Name of the file which you want to open
                    column_name = Name of the column which you want to read
                    sheet_index = Index of the sheet (Default index is 0)
        >>Return:   Data of the given column name
    """
    expected_column_index = 0
    expected_row_index = 0
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
    excel_all_data = xlrd.open_workbook(default_download_path)
    excelsheet0_data = excel_all_data.sheet_by_index(sheet_index)
    for row in range(excelsheet0_data.nrows):
        for column in range(excelsheet0_data.ncols):
            if excelsheet0_data.cell_value(row, column) == column_name:
                expected_column_index = column
                expected_row_index = row
                break
    column_data = excelsheet0_data.col_values(expected_column_index, expected_row_index + 1, excelsheet0_data.nrows)
    return column_data


@keyword
def validate_single_column_data(ref_column_name, ref_column_value, validation_column_name, validation_column_value, file_name, sheet_index=0):
    """
        >>Validate single column by using reference column name and value
        >>Inputs:   ref_column_name = Name of reference column
                    ref_column_value = Reference value from reference column(e.g. Person name or number, Code, etc)
                    validation_column_name = Name of column from which you want to validate value
                    validation_column_value = Value, which you want to validate
                    file_name = Name of the file which you want to open
                    sheet_index = Index of the sheet (Default index is 0)
        >>Return:   Result of validation
    """
    flag_message = "Validation Not Started"
    ref_column_data = read_excel_single_column(ref_column_name, file_name, sheet_index)
    validation_column_data = read_excel_single_column(validation_column_name, file_name, sheet_index)
    for ref_column_index in range(len(ref_column_data)):
        if ref_column_data[ref_column_index] == ref_column_value:
            if validation_column_data[ref_column_index] == validation_column_value:
                flag_message = "Validation Successful"
                break
            else:
                flag_message = "Validation Value Not Found. Got: "+validation_column_data[ref_column_index]
                break
        else:
            flag_message = "Reference Value Not Found"
    return flag_message


@keyword
def get_Employee_Number_Search_Validation(file_name, first_col_header, required_col_header, validation_value):
    user_name = getpass.getuser()
    # default_download_path = r'C:\\Users\\' + user_name + '\\Downloads\\' + file_name + '.xls'  # windows
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
    py_xlrd = xlrd.open_workbook(default_download_path)
    py_sheet = py_xlrd.sheet_by_index(0)
    employee_col = -1
    employee_row = -1
    found = 0

    for i in range(py_sheet.nrows):
        if py_sheet.cell_value(i, 0).strip() == first_col_header:
            header_row = i
            break

    for i in range(py_sheet.ncols):
        if py_sheet.cell_value(header_row, i).strip() == required_col_header:
            employee_col = i
            break

    for i in range(header_row + 1, py_sheet.nrows):
        # py_sheet.cell_value(i, employee_col).strip()
        if py_sheet.cell_value(i, employee_col).strip() == validation_value:
            found = 1
            break

    return found



@keyword
def validate_multiple_column_data(ref_column_name, ref_column_value, validation_columns_list, validation_values_list, file_name, sheet_index=0):
    """
        >>Validate single column by using reference column name and value
        >>Inputs:   ref_column_name = Name of reference column
                    ref_column_value = Reference value from reference column(e.g. Person name or number, Code, etc)
                    validation_columns_list = Name of column from which you want to validate value
                    validation_values_list = Value, which you want to validate
                    file_name = Name of the file which you want to open
                    sheet_index = Index of the sheet (Default index is 0)
        >>Return:   Result of validation as list in sequence of column name
    """
    flag_message = ["Validation Not Started"]
    for validation_column_list_index in range(len(validation_columns_list)):
        result = validate_single_column_data(ref_column_name, ref_column_value, validation_columns_list[validation_column_list_index], validation_values_list[validation_column_list_index], file_name, sheet_index)
        if validation_column_list_index == 0:
            flag_message = [result]
        else:
            flag_message.append(result)
    return flag_message

# @keyword
# def get_column_data(column_name, file_name, sheet_index=0):
#     expected_column_index = 0
#     expected_row_index = 0
#     excel_all_data = xlrd.open_workbook(file_name)
#     excelsheet0_data = excel_all_data.sheet_by_index(sheet_index)
#     for row in range(excelsheet0_data.nrows):
#         for column in range(excelsheet0_data.ncols):
#             if excelsheet0_data.cell_value(row, column) == column_name:
#                 expected_column_index = column
#                 expected_row_index = row
#                 break
#     column_data = excelsheet0_data.col_values(expected_column_index, expected_row_index + 1, excelsheet0_data.nrows)
#     return str(column_data)


# @keyword
# def compare_excel_all_columns(excel_1, excel_2):
#     excel_data_1 = pd.read_excel(excel_1+".xls")
#     excel_data_2 = pd.read_excel(excel_2+".xls")
#     return excel_data_1.equals(excel_data_2)


# @keyword
# def compare_excel_skip_columns(excel_1, excel_2, column_list, excel_1_start_row=0, excel_2_start_row=0):
#     status_flag = "True"
#     if excel_1_start_row != 0: excel_1_start_row = excel_1_start_row - 1
#     if excel_2_start_row != 0: excel_2_start_row = excel_2_start_row - 1
#     excel_data_1 = pd.read_excel(excel_1+".xls", skiprows = excel_1_start_row)
#     excel_data_2 = pd.read_excel(excel_2+".xls", skiprows = excel_2_start_row)
#     excel_1_column_name = list(excel_data_1.columns)
#     excel_2_column_name = list(excel_data_2.columns)
#     if len(excel_1_column_name) == len(excel_2_column_name):
#         for column_name in excel_1_column_name:
#             if column_name not in column_list:
#                 print("Checking column : "+str(column_name))
#                 excel_1_column_data = get_column_data(column_name, excel_1+".xls")
#                 excel_2_column_data = get_column_data(column_name, excel_2+".xls")
#                 if excel_1_column_data != excel_2_column_data:
#                     print("Column not matched")
#                     status_flag = "False"
#                     # for i in range(len(excel_1_column_data)):
#                     #     if excel_1_column_data[i] != excel_2_column_data[i]:
#                     #         print("Mismatch value [ " + "Index : " + str(i) + " / Value1 : " + str(excel_1_column_data[i]) + " / Value2 : " + excel_2_column_data[i] + " ]")
#                 else:
#                     print("Matched")
#             else:
#                 print("Skipping Column : "+column_name)
#     else:
#         print("Column count mismatched")
#         status_flag = "False"
#     return status_flag


# @keyword
# def compare_excel_specific_columns(excel_1, excel_2, column_list, excel_1_start_row=0, excel_2_start_row=0):
#     status_flag = "True"
#     if excel_1_start_row != 0: excel_1_start_row = excel_1_start_row - 1
#     if excel_2_start_row != 0: excel_2_start_row = excel_2_start_row - 1
#     excel_data_1 = pd.read_excel(excel_1+".xls", skiprows = excel_1_start_row)
#     excel_data_2 = pd.read_excel(excel_2+".xls", skiprows = excel_2_start_row)
#     excel_1_column_name = list(excel_data_1.columns)
#     excel_2_column_name = list(excel_data_2.columns)
#     if len(excel_1_column_name) == len(excel_2_column_name):
#         for column_name in excel_1_column_name:
#             if column_name in column_list:
#                 print("Checking column : "+str(column_name))
#                 excel_1_column_data = get_column_data(column_name, excel_1+".xls")
#                 excel_2_column_data = get_column_data(column_name, excel_2+".xls")
#                 if excel_1_column_data != excel_2_column_data:
#                     print("Column not matched")
#                     status_flag = "False"
#                     # for i in range(len(excel_1_column_data)):
#                     #     if excel_1_column_data[i] != excel_2_column_data[i]:
#                     #         print("Mismatch value [ " + "Index : " + str(i) + " / Value1 : " + str(excel_1_column_data[i]) + " / Value2 : " + excel_2_column_data[i] + " ]")
#                 else:
#                     print("Matched")
#             else:
#                 print("Skipping Column : "+column_name)
#     else:
#         print("Column count mismatched")
#         status_flag = "False"
#     return status_flag


#print(compare_excel_all_columns("Report1", "Report2"))
#print(compare_excel_skip_columns("Report1", "Report2", ["Person Name", "Division"], 16, 16))
#print(compare_excel_specific_columns("Report1", "Report2", ["Person Name", "Division"], 16, 16))

# @keyword
# def compare_mine_excel_files(excel_1, excel_2, skip_rows):
#     status_flag = "True"
#     # Read the Excel files into DataFrames, skipping the specified number of rows
#     df1 = pd.read_excel(os.getcwd() + "/TestData/" + excel_1+".xlsx", skiprows=skip_rows)
#     df2 = pd.read_excel(os.path.expanduser("~") + "/Downloads/" + excel_2+".xlsx", skiprows=skip_rows)
#
#     # Check if the DataFrames are equal
#     are_equal = df1.equals(df2)
#
#     if are_equal:
#         print("The Excel files are identical.")
#     else:
#         # Find the mismatched cells by comparing the DataFrames
#         mismatched_cells = (df1 != df2)
#         status_flag = "False"
#         # Filter the DataFrame to show only the mismatched cells
#         mismatched_data = df1.where(mismatched_cells)
#
#         # Print the mismatched data
#         print("Mismatched data:")
#         print(mismatched_data)
#     return status_flag