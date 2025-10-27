# import pandas as pd
# from openpyxl import load_workbook
# from openpyxl.styles import PatternFill
#
# def compare_excel_sheets(excel_1, excel_2, skip_rows=0):
#     # Read all sheets from the first Excel file
#     xls1 = pd.ExcelFile("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + excel_1 + ".xlsx")
#     xls1_sheets = xls1.sheet_names
#
#     # Read all sheets from the second Excel file
#     xls2 = pd.ExcelFile("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx")
#     xls2_sheets = xls2.sheet_names
#
#     # Initialize lists to store differing rows and sheets not in other file
#     all_differing_rows = []
#     sheets_not_in_file1 = []
#     sheets_not_in_file2 = []
#
#     # Function to preprocess the data
#     def preprocess_dataframe(df):
#         # Strip whitespace from strings and convert all to lowercase
#         df = df.apply(lambda col: col.map(lambda x: str(x).strip().lower() if isinstance(x, str) else x))
#         # Fill NaNs with a specific value
#         df.fillna("NA", inplace=True)
#         return df
#
#     # Iterate over each sheet in the first Excel file
#     for sheet1_name in xls1_sheets:
#         # Check if the sheet exists in both Excel files
#         if sheet1_name in xls2_sheets:
#             df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + excel_1 + ".xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)
#             df2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx", sheet_name=sheet1_name, engine='openpyxl', skiprows=skip_rows)
#
#             # Drop empty rows
#             df1 = df1.dropna(how='all')
#             df2 = df2.dropna(how='all')
#
#             # Preprocess the dataframes
#             df1 = preprocess_dataframe(df1)
#             df2 = preprocess_dataframe(df2)
#
#             # Convert DataFrames to sets for faster comparison
#             set_df1 = {tuple(row) for _, row in df1.iterrows()}
#             set_df2 = {tuple(row) for _, row in df2.iterrows()}
#
#             differing_rows = []
#
#             # Highlight mismatching cells
#             workbook = load_workbook("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx")
#             sheet = workbook[sheet1_name]
#             fill = PatternFill(start_color="FFFF00", end_color="FFFF00", fill_type="solid")
#
#             # Compare rows from Excel 1 with Excel 2
#             for index, row1 in df1.iterrows():
#                 if index >= len(df2):
#                     break
#                 for col_index, value in enumerate(row1):
#                     if value != df2.iloc[index, col_index]:
#                         cell = sheet.cell(row=index + skip_rows + 2, column=col_index + 1)
#                         cell.fill = fill
#                         differing_rows.append({
#                             'Excel 1 Worksheet': sheet1_name,
#                             'Excel 2 Worksheet': sheet1_name,
#                             'Excel 1 Row Number': index + skip_rows + 2,
#                             'Data (Excel 1)': row1.values.tolist(),
#                         })
#
#             # Compare rows from Excel 2 with Excel 1
#             for index, row2 in df2.iterrows():
#                 if index >= len(df1):
#                     break
#                 for col_index, value in enumerate(row2):
#                     if value != df1.iloc[index, col_index]:
#                         cell = sheet.cell(row=index + skip_rows + 2, column=col_index + 1)
#                         cell.fill = fill
#                         differing_rows.append({
#                             'Excel 1 Worksheet': sheet1_name,
#                             'Excel 2 Worksheet': sheet1_name,
#                             'Excel 2 Row Number': index + skip_rows + 2,
#                             'Data (Excel 2)': row2.values.tolist(),
#                         })
#
#             # Save the workbook with highlighted cells
#             workbook.save("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + "_highlighted.xlsx")
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

# //////////////////////////////////////////////////////////////////////////
import pandas as pd


# def compare_excel_reports(excel_1, excel_2, output_path):
#     """
#     Compares two Excel reports based on 'Cost Center' and 'Employee ID',
#     and outputs the differences to a new Excel file.
#
#     :param file1_path: Path to the first Excel file.
#     :param file2_path: Path to the second Excel file.
#     :param output_path: Path to save the comparison report.
#     """
#
#     # Load the Excel files
#     file1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + excel_1 + ".xlsx")
#     file2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx")
#
#     # Group the data by 'Cost Center' and 'Employee ID'
#     grouped_file1 = file1.groupby(['Cost Center', 'Employee ID'])
#     grouped_file2 = file2.groupby(['Cost Center', 'Employee ID'])
#
#     # List to store differences
#     differences = []
#
#     # Iterate through each group in the first report
#     for (cost_center, employee_id), group1 in grouped_file1:
#         # Check if the same cost center and employee ID exists in the second report
#         if (cost_center, employee_id) in grouped_file2.groups:
#             group2 = grouped_file2.get_group((cost_center, employee_id))
#
#             # Compare the rows of each group
#             if not group1.equals(group2):
#                 differences.append({
#                     'Cost Center': cost_center,
#                     'Employee ID': employee_id,
#                     'Report1 Details': group1,
#                     'Report2 Details': group2
#                 })
#         else:
#             differences.append({
#                 'Cost Center': cost_center,
#                 'Employee ID': employee_id,
#                 'Report1 Details': group1,
#                 'Report2 Details': 'Not found in Report 2'
#             })
#
#     # Iterate through each group in the second report to find missing groups from the first report
#     for (cost_center, employee_id), group2 in grouped_file2:
#         if (cost_center, employee_id) not in grouped_file1.groups:
#             differences.append({
#                 'Cost Center': cost_center,
#                 'Employee ID': employee_id,
#                 'Report1 Details': 'Not found in Report 1',
#                 'Report2 Details': group2
#             })
#
#     # Output the differences to a new Excel file
#     with pd.ExcelWriter(output_path) as writer:
#         for index, diff in enumerate(differences):
#             # Convert the group DataFrames to Excel sheets
#             if isinstance(diff['Report1 Details'], pd.DataFrame):
#                 diff['Report1 Details'].to_excel(writer, sheet_name=f"{index + 1}_Report1", index=False)
#             if isinstance(diff['Report2 Details'], pd.DataFrame):
#                 diff['Report2 Details'].to_excel(writer, sheet_name=f"{index + 1}_Report2", index=False)
#             else:
#                 # Handle missing report scenario
#                 df = pd.DataFrame([diff['Report2 Details']], columns=['Status'])
#                 df.to_excel(writer, sheet_name=f"{index + 1}_Report2_Missing", index=False)
#
#     print(f"Comparison report generated successfully as '{output_path}'")
#
# # compare_excel_reports('report1.xlsx', 'report2.xlsx', 'comparison_report.xlsx')

import pandas as pd


def extract_cost_centers_from_rows(data, cost_center_identifier):
    """
    Extracts groups of employee details under each cost center based on a row value.

    :param data: DataFrame containing the report data.
    :param cost_center_identifier: A string or condition that identifies the cost center row.
    :return: Dictionary with cost centers as keys and grouped employee details as values.
    """
    cost_center_groups = {}
    current_cost_center = None
    temp_group = []

    for index, row in data.iterrows():
        # Check if the row is a cost center row by using a condition or keyword match
        if cost_center_identifier in row.values:
            # Save the previous cost center data
            if current_cost_center and temp_group:
                cost_center_groups[current_cost_center] = pd.DataFrame(temp_group)

            # Update to the new cost center
            current_cost_center = row[row == cost_center_identifier].index[0]  # Update with the cost center name
            temp_group = []  # Reset the employee details group
        else:
            # Otherwise, this row is part of the current cost center's employee details
            if current_cost_center:
                temp_group.append(row)

    # Add the last group to the dictionary
    if current_cost_center and temp_group:
        cost_center_groups[current_cost_center] = pd.DataFrame(temp_group)

    return cost_center_groups


def compare_excel_reports(file1_path, file2_path, output_path, sheet_name1, sheet_name2, cost_center_identifier):
    """
    Compares two Excel reports based on cost centers and employee details,
    and outputs the differences to a new Excel file.

    :param file1_path: Path to the first Excel file.
    :param file2_path: Path to the second Excel file.
    :param output_path: Path to save the comparison report.
    :param sheet_name1: Sheet name of the first Excel file.
    :param sheet_name2: Sheet name of the second Excel file.
    :param cost_center_identifier: String or condition that identifies cost center rows in the files.
    """
    # Load both Excel files with the correct sheet names
    file1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + file1_path + ".xlsx",
                          sheet_name='Detail')
    file2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + file2_path + ".xlsx", sheet_name='Detail')

    # file1 = pd.read_excel(file1_path, sheet_name=sheet_name1)
    # file2 = pd.read_excel(file2_path, sheet_name=sheet_name2)

    # Extract cost center groups
    file1_groups = extract_cost_centers_from_rows(file1, cost_center_identifier)
    file2_groups = extract_cost_centers_from_rows(file2, cost_center_identifier)

    # List to store differences
    differences = []

    # Compare the cost center groups between the two files
    all_cost_centers = set(file1_groups.keys()).union(set(file2_groups.keys()))

    for cost_center in all_cost_centers:
        group1 = file1_groups.get(cost_center)
        group2 = file2_groups.get(cost_center)

        if group1 is not None and group2 is not None:
            # Both files have this cost center, compare the details
            if not group1.equals(group2):
                differences.append({
                    'Cost Center': cost_center,
                    'Report1 Details': group1,
                    'Report2 Details': group2
                })
        elif group1 is not None:
            # Cost center exists in Report 1 but not in Report 2
            differences.append({
                'Cost Center': cost_center,
                'Report1 Details': group1,
                'Report2 Details': 'Not found in Report 2'
            })
        elif group2 is not None:
            # Cost center exists in Report 2 but not in Report 1
            differences.append({
                'Cost Center': cost_center,
                'Report1 Details': 'Not found in Report 1',
                'Report2 Details': group2
            })

    # Output the differences to a new Excel file
    with pd.ExcelWriter(output_path) as writer:
        for index, diff in enumerate(differences):
            # Convert the group DataFrames to Excel sheets
            if isinstance(diff['Report1 Details'], pd.DataFrame):
                diff['Report1 Details'].to_excel(writer, sheet_name=f"{index + 1}_Report1", index=False)
            if isinstance(diff['Report2 Details'], pd.DataFrame):
                diff['Report2 Details'].to_excel(writer, sheet_name=f"{index + 1}_Report2", index=False)
            else:
                # Handle missing report scenario
                df = pd.DataFrame([diff['Report2 Details']], columns=['Status'])
                df.to_excel(writer, sheet_name=f"{index + 1}_Report2_Missing", index=False)

    print(f"Comparison report generated successfully as '{output_path}'")


# Example usage:
# compare_excel_reports(
#     'report1.xlsx',
#     'report2.xlsx',
#     'comparison_report.xlsx',
#     sheet_name1='YourSheetName1',
#     sheet_name2='YourSheetName2',
#     cost_center_identifier='Cost Center Name or Condition'
# )

if __name__ == "__main__":
    file1 = "041_PP9_DEV"
    file2 = "041_PP9_PROD"
    compare_excel_reports(file1, file2,"C:\\Users\\senthil.n.thangaraj\\Downloads\\test result.xlsx","Detail","Detail","Cost Center: ")
