import pandas as pd

#Payroll Report Comparison
def compare_excel_rows_payroll(excel_1, excel_2, skip_rows=0):
    # df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\PycharmProjects\\git\\HCM\\TestData/" + excel_1 + ".xlsx", engine='openpyxl', skiprows=skip_rows)
    df1 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads\\DEV3 24D Payroll\\DEV3_Before 24D Payroll/" + excel_1 + ".xlsx", engine='openpyxl', skiprows=skip_rows)
    df2 = pd.read_excel("C:\\Users\\senthil.n.thangaraj\\Downloads/" + excel_2 + ".xlsx", engine='openpyxl', skiprows=skip_rows)

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
    #
    # # Reset index before saving to Excel
    # differing_rows_df.reset_index(drop=True, inplace=True)
    differing_rows_df.to_excel(excel_file_path, index=False)
    print("Differing rows have been saved to '{}' in Excel format.".format(excel_file_path))

if __name__ == "__main__":
    file1 = 'MX_PAYROLL_NET_PAY_EXCEPTION_REPORT'
    file2 = 'MX_PAYROLL_NET_PAY_EXCEPTION_REPORT'
    compare_excel_rows_payroll(file1, file2)
