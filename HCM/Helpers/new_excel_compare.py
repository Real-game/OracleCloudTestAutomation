import pandas as pd

#Core HR Report Validation
def compare_excel_rows_Core_hr(excel_1, excel_2, skip_rows=0):
    # df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + excel_1 + ".xls", skiprows=skip_rows)
    df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads\\DEV3_Before 25C CoreHR\\DEV3_Before 25C CoreHR/" + excel_1 + ".xls", skiprows=skip_rows)
    df2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xls", skiprows=skip_rows)

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
                'Excel 1 Row Number': index + skip_rows +2,
                'Data (Excel 1)': row1.values.tolist(),
            })

    # Compare rows from Excel 2 with Excel 1
    for index, row2 in df2.iterrows():
        if tuple(row2) not in set_df1:
            differing_rows.append({
                'Excel 2 Row Number': index + skip_rows +2,
                'Data (Excel 2)': row2.values.tolist(),
            })

    # Check for differences in the number of rows
    if len(df1) != len(df2):
        differing_rows.append({
            'Difference in Rows': f"Number of rows in {excel_1}: {len(df1)}, Number of rows in {excel_2}: {len(df2)}"
        })

    # Save differing rows in a single Excel file
    excel_file_path = "differing_rows.xlsx"
    differing_rows_df = pd.DataFrame(differing_rows)
    differing_rows_df.to_excel(excel_file_path, index=False)
    print("Differing rows have been saved to '{}' in Excel format.".format(excel_file_path))

if __name__ == "__main__":
    file1 = 'HR_REP-125 MX_Cultural_Census_Detailed'
    file2 = 'HR_REP-125 MX_Cultural_Census_Detailed'
    compare_excel_rows_Core_hr(file1, file2,4)

# import pandas as pd
#
# def copy_excel_data(source_excel, source_sheet, destination_excel, destination_sheet):
#     # Read data from the source Excel sheet
#     source_df = pd.read_excel(source_excel, sheet_name=source_sheet, engine='openpyxl')
#
#     # Drop rows with all NaN (empty) values
#     source_df.dropna(how='all', inplace=True)
#
#     # Read data from the destination Excel sheet (if it already exists)
#     try:
#         destination_df = pd.read_excel(destination_excel, sheet_name=destination_sheet, engine='openpyxl')
#     except FileNotFoundError:
#         # If the destination Excel file doesn't exist, create a new DataFrame
#         destination_df = pd.DataFrame()
#
#     # Copy the data from the source DataFrame to the destination DataFrame
#     destination_df = pd.concat([destination_df, source_df], axis=1)
#
#     # Save the updated data to the destination Excel file
#     destination_df.to_excel(destination_excel, sheet_name=destination_sheet, index=False)
#
#     print("Data copied from '{}' sheet in '{}' to '{}' sheet in '{}'.".format(source_sheet, source_excel, destination_sheet, destination_excel))
#
# if __name__ == "__main__":
#     source_excel = "C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\Helpers\\differing_rows.xlsx"
#     source_sheet = 'Sheet1'  # Replace with the actual sheet name
#     destination_excel = "C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\Helpers\\destination_excel.xlsx"
#     destination_sheet = 'Sheet2'  # Replace with the actual sheet name
#
#     copy_excel_data(source_excel, source_sheet, destination_excel, destination_sheet)

