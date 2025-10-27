import os
import xlrd
import pandas as pd
from robot.api.deco import keyword
import getpass
from openpyxl import load_workbook
# System imports
import sys
from sys import exit

# Library to maipulate excel
import openpyxl
from openpyxl.styles import PatternFill

@keyword
def get_column_data(column_name, file_name, sheet_index=0):
    expected_column_index = 0
    expected_row_index = 0
    excel_all_data = xlrd.open_workbook(file_name)
    excelsheet0_data = excel_all_data.sheet_by_index(sheet_index)
    for row in range(excelsheet0_data.nrows):
        for column in range(excelsheet0_data.ncols):
            if excelsheet0_data.cell_value(row, column) == column_name:
                expected_column_index = column
                expected_row_index = row
                break
    column_data = excelsheet0_data.col_values(expected_column_index, expected_row_index + 1, excelsheet0_data.nrows)
    return str(column_data)


@keyword
def compare_excel_all_columns(excel_1, excel_2,excel_1_start_row=0, excel_2_start_row=0):
    status_flag = "True"
    if excel_1_start_row != 0: excel_1_start_row = excel_1_start_row - 1
    if excel_2_start_row != 0: excel_2_start_row = excel_2_start_row - 1
    excel_data_1 = pd.read_excel(os.getcwd() + "/TestData/" + excel_1+".xls", skiprows = excel_1_start_row)
    excel_data_2 = pd.read_excel(os.path.expanduser("~") + "/Downloads/" + excel_2+".xls", skiprows = excel_2_start_row)
    excel_1_column_name = list(excel_data_1.columns)
    excel_2_column_name = list(excel_data_2.columns)
    if len(excel_1_column_name) == len(excel_2_column_name):
        for column_name in excel_1_column_name:
                print("Checking column : " + str(column_name))
                excel_1_column_data = get_column_data(column_name, os.getcwd() + "/TestData/" + excel_1 + ".xls")
                excel_2_column_data = get_column_data(column_name,
                                                      os.path.expanduser("~") + "/Downloads/" + excel_2 + ".xls")
                if excel_1_column_data != excel_2_column_data:
                    status_flag = "False"
                    x = excel_1_column_data.split(",")
                    y = excel_2_column_data.split(",")
                    for i in range(len(x)):
                        if x[i] != y[i]:
                            print(x[i])
                            print("Mismatch value: Before upgrade in the column " + column_name + " value is " + x[
                                i] + " and after upgrade the value is changed to " + y[i])
                else:
                    print("Matched")
    else:
        print("Column count mismatched")
        status_flag = "False"
    return status_flag


@keyword
def compare_excel_skip_columns(excel_1, excel_2, column_list, excel_1_start_row=0, excel_2_start_row=0):
    status_flag = "True"
    if excel_1_start_row != 0: excel_1_start_row = excel_1_start_row - 1
    if excel_2_start_row != 0: excel_2_start_row = excel_2_start_row - 1
    excel_data_1 = pd.read_excel(os.getcwd() + "/TestData/" + excel_1+".xls", skiprows = excel_1_start_row)
    excel_data_2 = pd.read_excel(os.path.expanduser("~") + "/Downloads/" + excel_2+".xls", skiprows = excel_2_start_row)
    excel_1_column_name = list(excel_data_1.columns)
    excel_2_column_name = list(excel_data_2.columns)
    if len(excel_1_column_name) == len(excel_2_column_name):
        for column_name in excel_1_column_name:
            if column_name not in column_list:
                print("Checking column : "+str(column_name))
                excel_1_column_data = get_column_data(column_name, os.getcwd() + "/TestData/" + excel_1+".xls")
                excel_2_column_data = get_column_data(column_name, os.path.expanduser("~") + "/Downloads/" + excel_2+".xls")
                if excel_1_column_data != excel_2_column_data:
                    status_flag = "False"
                    x=excel_1_column_data.split(",")
                    y=excel_2_column_data.split(",")
                    for i in range(len(x)):
                        if x[i] != y[i]:
                            print(x[i])
                            print("Mismatch value: Before upgrade in the column "+column_name+" value is "+x[i]+" and after upgrade the value is changed to "+y[i])
                else:
                    print("Matched")
            else:
                print("Skipping Column : "+column_name)
    else:
        print("Column count mismatched")
        status_flag = "False"
    return status_flag


@keyword
def compare_excel_specific_columns(excel_1, excel_2, column_list, excel_1_start_row=0, excel_2_start_row=0):
    status_flag = "True"
    if excel_1_start_row != 0: excel_1_start_row = excel_1_start_row - 1
    if excel_2_start_row != 0: excel_2_start_row = excel_2_start_row - 1
    excel_data_1 = pd.read_excel(os.getcwd() + "/TestData/" + excel_1+".xls", skiprows = excel_1_start_row)
    excel_data_2 = pd.read_excel(os.path.expanduser("~") + "/Downloads/" + excel_2+".xls", skiprows = excel_2_start_row)
    excel_1_column_name = list(excel_data_1.columns)
    excel_2_column_name = list(excel_data_2.columns)
    if len(excel_1_column_name) == len(excel_2_column_name):
        for column_name in excel_1_column_name:
            if column_name in column_list:
                print("Checking column : "+str(column_name))
                excel_1_column_data = get_column_data(column_name, os.getcwd() + "/TestData/" + excel_1+".xls")
                excel_2_column_data = get_column_data(column_name, os.path.expanduser("~") + "/Downloads/" + excel_2+".xls")
                if excel_1_column_data != excel_2_column_data:
                    status_flag = "False"
                    x=excel_1_column_data.split(",")
                    y=excel_2_column_data.split(",")
                    for i in range(len(x)):
                        if x[i] != y[i]:
                            print(x[i])
                            print("Mismatch value: Before upgrade in the column "+column_name+" value is "+x[i]+" and after upgrade the value is changed to "+y[i])

                else:
                    print("Matched")
            else:
                print("Skipping Column : "+column_name)
    else:
        print("Column count mismatched")
        status_flag = "False"
    return status_flag


# @keyword
# def delete_File(file_name):
#     default_download_path = os.path.expanduser("~") + "/Downloads/" + file_name + ".xls"
#
#     if os.path.exists(default_download_path):
#         os.remove(default_download_path)
#     else:
#         print("The file does not exist")
#         #return "Absent"


@keyword
def compare_two_excels(excel_1, excel_2, excel_start_row=0):
    status_flag = True
    # Output file names
    file3 = "Compared File.xlsx"
    logFile = "Log File.txt"

    # Log file open
    f = open(logFile, "w")

    # Load excels
    wb1 = openpyxl.load_workbook(os.getcwd() + "/TestData/" + excel_1 + ".xlsx")
    wb2 = openpyxl.load_workbook(os.path.expanduser("~") + "/Downloads/" + excel_2 + ".xlsx")

    # Pattern red
    fill_pattern_red = PatternFill(patternType="solid", fgColor='FF3333')

    # Log file start
    f.write("This is log file containing all the differences found in the comparision.\n")
    f.write("First File Path : " + excel_1 + "\n")
    f.write("Second File Path : " + excel_2 + "\n")

    # number of sheets in each excel
    noOfSheets1 = len(wb1.sheetnames)
    noOfSheets2 = len(wb2.sheetnames)

    # Compare number of sheets
    if (noOfSheets1 != noOfSheets2):
        print("Number of sheets are different in both the workbook")
        f.write("\n\nNumber of sheets are different in both the workbook. \n" +
                "noOfSheets1 : " + noOfSheets1 + " noOfSheets2 : " + noOfSheets2 +
                "\nHence closing the file comarision.")
        sys.exit("noOfSheets1 : " + str(noOfSheets1) + " noOfSheets2 : " + str(noOfSheets2))

    # If number of sheet is equal in both
    for s in range(0, noOfSheets1):
        mismatchFound = 0
        sh1 = wb1.worksheets[s]
        sh2 = wb2.worksheets[s]

        sheetName = wb1.sheetnames[s]

        row1 = sh1.max_row
        row2 = sh2.max_row
        row_max = max(row1, row2)

        # f.write("\n\n----------------Starting comparision for sheet : " + sheetName + "---------------\n")
        f.write("\n\n----------------Starting Comparision---------------\n")
        # Compare number of rows
        if (row1 != row2):
            print("Number of rows are different in both the sheet for : " + sheetName + "\n")
            f.write("Number of rows are different in both the sheet for : " + sheetName + "\n")

        column1 = sh1.max_column
        column2 = sh2.max_column
        column_max = max(column1, column2)

        # Compare number of rows
        if (column1 != column2):
            print("Number of columns are different in both the sheet for : " + sheetName + "\n")
            f.write("Number of columns are different in both the sheet for :" + sheetName + "\n")

        extra_row = False
        extra_column = False

        for r in range(excel_start_row, row_max + 1):
            for c in range(1, column_max + 1):
                value1 = sh1.cell(r, c).value
                value2 = sh2.cell(r, c).value
                # Coloring extra columns and rows
                if (r > row1 or r > row2):
                    if (extra_row == False):
                        f.write("Extra row found at Row : " + str(r) + "\n")
                    sh2.cell(r, c).fill = fill_pattern_red
                    extra_row = True
                    pass

                elif (c > column1 or c > column2):
                    if (extra_column == False):
                        f.write("Extra column found at Column : " + str(c) + "\n")
                    sh2.cell(r, c).fill = fill_pattern_red
                    extra_column = True
                    pass
                # Comparing both cells value
                elif (value1 == value2):
                    pass

                else:
                    status_flag = False
                    f.write("Mismatch found at row " + str(r) + " column " + str(c) + " : \n"
                            + "\t\t Before value : " + str(value1) + "\n"
                            + "\t\t After value : " + str(value2) + "\n")

                    sh2.cell(r, c).fill = fill_pattern_red
                    mismatchFound += 1
        if (mismatchFound == 0):
            f.write("Everything matched in this sheet.\n")

    f.write("\n\n-----------------Comparision complete!--------------------\n\n")

    wb2.save(file3)

    print("Execution complete.")
    print("Please check Compared File.xlsx for output")
    print("And check Log File.txt for logs")

    f.write("Compared File Name : " + file3 + "\n")
    f.write("Log File Path : " + logFile + "\n")

    f.close()
    return status_flag
