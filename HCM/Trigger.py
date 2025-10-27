###################################################################
#                                                                 #
#         Trigger Pre-requisites and main scripts                 #
#                                                                 #
###################################################################
import robot
import sys
import os
import shutil
import time
import pandas as pd
# from pandas import ExcelWriter
# from pandas import ExcelFile

""""
    >>Add defaultPreRequisites and defaultScripName in given list without .robot extension.
    >>This is for Technical person for later development and testing purpose only.
    >>See following example for reference
        1.  e.g. pre-requisites name is Test_Pre.robot
            Then
            preRequisites = ["Test_Pre"]
        
        And Same for scriptName
        
        2.  e.g. script name is Test_script.robot
            Then
            preRequisites = ["Test_script"]
    
    *NOTE: YOU CAN ADD MULTIPLE PREREQUISITES AND ALSO MULTIPLE SCRIPTS NAME*
"""
defaultPreRequisites = [""]
defaultScripName = ["test_HR_03","PAY_TC001_Get_Accural_Balances_for_Current_Pay_Period_Before_Roll_Back"]

# masterDoc is Excel file with testModuleSheet and preRequisitesSheet.
masterDoc = 'masterSheet.xlsx'
# testModuleSheet: Add your module name as column name/heading and script name below that.
testModuleSheet = 'module_list'
# preRequisitesSheet: Add your script name as column name/heading and pre-requisites script name below that.
preRequisitesSheet = 'pre_requisites'

# output, log and report files and folder path
outputDoc = "output.xml"
outputFolder = "OutputFiles/"
logDoc = "log.html"
logFolder = "LogFiles/"
reportDoc = "report.html"
reportFolder = "ReportFiles/"

testModuleSheetData = pd.read_excel(masterDoc, testModuleSheet)
preRequisitesSheetData = pd.read_excel(masterDoc, preRequisitesSheet)


def trigger_script(script_name):
    if script_name != "":
        if os.path.exists("TestSuites/" + script_name + ".robot"):
            print(script_name)
            robot.run("TestSuites/"+script_name+".robot")
            time.sleep(3)
        else:
            print("\n<<< Following Script Does Not Exists\n\n\""
                  +script_name+
                  "\"\n\nPlease Enter Correct Name Or Check \""+masterDoc+"\" >>>\n")
        if os.path.exists("TestSuites/" + script_name + ".robot"):
            if os.path.exists(logFolder+"log_"+script_name+".html"):
                os.remove(logFolder+"log_"+script_name+".html")
            time.sleep(1)
            shutil.copyfile(logDoc, logFolder+logDoc)
            os.rename(logFolder+logDoc, logFolder+"log_"+script_name+".html")
            if os.path.exists(outputFolder+"output_"+script_name+".xml"):
                os.remove(outputFolder+"output_"+script_name+".xml")
            time.sleep(1)
            shutil.copyfile(outputDoc, outputFolder+outputDoc)
            os.rename(outputFolder+outputDoc, outputFolder+"output_"+script_name+".xml")
            if os.path.exists(reportFolder+"report_"+script_name+".html"):
                os.remove(reportFolder+"report_"+script_name+".html")
            time.sleep(1)
            shutil.copyfile(reportDoc, reportFolder+reportDoc)
            os.rename(reportFolder+reportDoc, reportFolder+"report_"+script_name+".html")


def get_script(module_name):
    script_name = []
    if module_name in testModuleSheetData.columns:
        for script in testModuleSheetData[module_name]:
            script_name.append(script)
    elif module_name == "null":
        script_name = defaultScripName
    else:
        script_name = [module_name]
    return script_name


def set_directories(dir_all):
    for directory in dir_all:
        if not os.path.exists(directory):
            os.makedirs(directory)
            print("Created: "+directory)
        else:
            print("Already Exist: "+directory)


if __name__ == "__main__":
    scripts = get_script(sys.argv[1])
    dir_list = [outputFolder, logFolder, reportFolder]
    set_directories(dir_list)
    if len(scripts) != 0:
        for execute_script in scripts:
            if execute_script in preRequisitesSheetData.columns:
                for pre_requisites in preRequisitesSheetData[execute_script]:
                    trigger_script(str(pre_requisites))
            else:
                print("Pre-Requisites not found")
            trigger_script(str(execute_script))
    else:
        print("Script not found for execution")
