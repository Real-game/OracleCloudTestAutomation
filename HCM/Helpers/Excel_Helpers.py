import os
import xlrd
import getpass
from SeleniumLibrary.base import keyword
from SeleniumLibrary.base import LibraryComponent

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
def delete_File(file_name):
    default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"

    if os.path.exists(default_download_path):
        os.remove(default_download_path)
    else:
        print("The file does not exist")
        #return "Absent"


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
