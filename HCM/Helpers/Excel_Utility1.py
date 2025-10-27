import pandas as pd
# import os
#
# def get_user_name():
#     return os.getlogin()

def compare_excel_sheets(excel_1, excel_2, skip_rows=0):
    # Read all sheets from the first Excel file
    xls1 = pd.ExcelFile("C:\\Users\\senthil.n.thangaraj\\Downloads\\DEV3_Before 25C Payroll\\DEV3_Before 25C Payroll/" + excel_1 + ".xlsx")
    xls1_sheets = xls1.sheet_names

    # Read all sheets from the second Excel file
    xls2 = pd.ExcelFile("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx")
    xls2_sheets = xls2.sheet_names

    # Initialize lists to store differing rows and sheets not in other file
    all_differing_rows = []
    sheets_not_in_file1 = []
    sheets_not_in_file2 = []

    # Iterate over each sheet in the first Excel file
    for sheet1_name in xls1_sheets:
        # Check if the sheet exists in both Excel files
        if sheet1_name in xls2_sheets:
            df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads\\DEV3_Before 25C Payroll\\DEV3_Before 25C Payroll/" + excel_1 + ".xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)

        # # Iterate over each sheet in the second Excel file
        # for sheet2_name in xls2_sheets:
            df2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)

            # Drop empty rows
            df1 = df1.dropna(how='all')
            df2 = df2.dropna(how='all')

            # Handle NaN or missing values by filling them with a specific value (modify if necessary)
            df1.fillna("NA", inplace=True)
            df2.fillna("NA", inplace=True)

            # Convert DataFrames to sets for faster comparison
            set_df1 = {tuple(row) for _, row in df1.iterrows()}
            set_df2 = {tuple(row) for _, row in df2.iterrows()}

            differing_rows = []

            # Compare rows from Excel 1 with Excel 2
            for index, row1 in df1.iterrows():
                if tuple(row1) not in set_df2:
                    differing_rows.append({
                        'Excel 1 Worksheet': sheet1_name,
                        'Excel 2 Worksheet': sheet1_name,
                        'Excel 1 Row Number': index + skip_rows + 2,
                        'Data (Excel 1)': row1.values.tolist(),
                    })

            # Compare rows from Excel 2 with Excel 1
            for index, row2 in df2.iterrows():
                if tuple(row2) not in set_df1:
                    differing_rows.append({
                        'Excel 1 Worksheet': sheet1_name,
                        'Excel 2 Worksheet': sheet1_name,
                        'Excel 2 Row Number': index + skip_rows + 2,
                        'Data (Excel 2)': row2.values.tolist(),
                    })

            # Check for differences in the number of rows
            if len(df1) != len(df2):
                differing_rows.append({
                    'Difference in Rows': f"Number of rows in {excel_1}, {sheet1_name}: {len(df1)}, Number of rows in {excel_2}, {sheet1_name}: {len(df2)}"
                })

            # Add differing rows for the current sheets to the list
            all_differing_rows.extend(differing_rows)
        else:
            # Sheet exists in excel_1 but not in excel_2
            sheets_not_in_file2.append(sheet1_name)
    # Check for sheets in excel_2 but not in excel_1
    for sheet2_name in xls2_sheets:
        if sheet2_name not in xls1_sheets:
            sheets_not_in_file1.append(sheet2_name)

    # Save all differing rows and sheets not in other file in a single Excel file
    excel_file_path = "differing_rows.xlsx"
    all_differing_rows_df = pd.DataFrame(all_differing_rows)
    all_differing_rows_df.to_excel(excel_file_path, index=False)

    # Print information about sheets not in other file
    print("Sheets in '{}' but not in '{}' are: {}".format(excel_1, excel_2, sheets_not_in_file2))
    print("Sheets in '{}' but not in '{}' are: {}".format(excel_2, excel_1, sheets_not_in_file1))

    print("Differing rows have been saved to '{}' in Excel format.".format(excel_file_path))

if __name__ == "__main__":
    file1 = "MX_PAYROLL_NET_PAY_EXCEPTION_REPORT1"
    file2 = "MX_PAYROLL_NET_PAY_EXCEPTION_REPORT"
    compare_excel_sheets(file1, file2)

# def compare_excel_sheets(excel_1, excel_2, skip_rows=0):
#     # Read all sheets from the first Excel file
#     xls1 = pd.ExcelFile(f"C:\\Users\\{get_user_name()}\\PycharmProjects\\git\\HCM\\TestData/{excel_1}.xlsx")
#     xls1_sheets = xls1.sheet_names
#
#     # Read all sheets from the second Excel file
#     xls2 = pd.ExcelFile(f"C:\\Users\\{get_user_name()}\\Downloads/{excel_2}.xlsx")
#     xls2_sheets = xls2.sheet_names
#
#     # Initialize lists to store differing rows and sheets not in other file
#     all_differing_rows = []
#     sheets_not_in_file1 = []
#     sheets_not_in_file2 = []
#
#     # Iterate over each sheet in the first Excel file
#     for sheet1_name in xls1_sheets:
#         # Check if the sheet exists in both Excel files
#         if sheet1_name in xls2_sheets:
#             df1 = pd.read_excel(f"C:\\Users\\{get_user_name()}\\PycharmProjects\\git\\HCM\\TestData/{excel_1}.xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)
#
#         # # Iterate over each sheet in the second Excel file
#         # for sheet2_name in xls2_sheets:
#             df2 = pd.read_excel(f"C:\\Users\\{get_user_name()}\\Downloads/{excel_2}.xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)
#
#             # Drop empty rows
#             df1 = df1.dropna(how='all')
#             df2 = df2.dropna(how='all')
#
#             # Handle NaN or missing values by filling them with a specific value (modify if necessary)
#             df1.fillna("NA", inplace=True)
#             df2.fillna("NA", inplace=True)
#
#             # Convert DataFrames to sets for faster comparison
#             set_df1 = {tuple(row) for _, row in df1.iterrows()}
#             set_df2 = {tuple(row) for _, row in df2.iterrows()}
#
#             differing_rows = []
#
#             # Compare rows from Excel 1 with Excel 2
#             for index, row1 in df1.iterrows():
#                 if tuple(row1) not in set_df2:
#                     differing_rows.append({
#                         'Excel 1 Worksheet': sheet1_name,
#                         'Excel 2 Worksheet': sheet1_name,
#                         'Excel 1 Row Number': index + skip_rows + 2,
#                         'Data (Excel 1)': row1.values.tolist(),
#                     })
#
#             # Compare rows from Excel 2 with Excel 1
#             for index, row2 in df2.iterrows():
#                 if tuple(row2) not in set_df1:
#                     differing_rows.append({
#                         'Excel 1 Worksheet': sheet1_name,
#                         'Excel 2 Worksheet': sheet1_name,
#                         'Excel 2 Row Number': index + skip_rows + 2,
#                         'Data (Excel 2)': row2.values.tolist(),
#                     })
#
#             # Check for differences in the number of rows
#             if len(df1) != len(df2):
#                 differing_rows.append({
#                     'Difference in Rows': f"Number of rows in {excel_1}, {sheet1_name}: {len(df1)}, Number of rows in {excel_2}, {sheet1_name}: {len(df2)}"
#                 })
#
#             # Add differing rows for the current sheets to the list
#             all_differing_rows.extend(differing_rows)
#         else:
#             # Sheet exists in excel_1 but not in excel_2
#             sheets_not_in_file2.append(sheet1_name)
#     # Check for sheets in excel_2 but not in excel_1
#     for sheet2_name in xls2_sheets:
#         if sheet2_name not in xls1_sheets:
#             sheets_not_in_file1.append(sheet2_name)
#
#     # Save all differing rows and sheets not in other file in a single Excel file
#     excel_file_path = "differing_rows.xlsx"
#     all_differing_rows_df = pd.DataFrame(all_differing_rows)
#     all_differing_rows_df.to_excel(excel_file_path, index=False)
#
#     # Print information about sheets not in other file
#     print("Sheets in '{}' but not in '{}' are: {}".format(excel_1, excel_2, sheets_not_in_file2))
#     print("Sheets in '{}' but not in '{}' are: {}".format(excel_2, excel_1, sheets_not_in_file1))
#
#     print("Differing rows have been saved to '{}' in Excel format.".format(excel_file_path))
#
# if __name__ == "__main__":
#     file1 = "MX_PAYROLL_NET_PAY_EXCEPTION_REPORT1"
#     file2 = "MX_PAYROLL_NET_PAY_EXCEPTION_REPORT"
#     compare_excel_sheets(file1, file2)


