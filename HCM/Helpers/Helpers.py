import os
import json
from SeleniumLibrary.base import keyword
from SeleniumLibrary.base import LibraryComponent
from selenium.webdriver.common.by import By
from selenium.webdriver.support.wait import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.remote.webelement import WebElement
import csv
from dist import csvjson as obj
from robot.api.deco import keyword
import datetime
import pandas as pd

from robot.libraries.BuiltIn import BuiltIn

def readJson(jsonFilePath):
    with open(jsonFilePath) as f:
        jsonFile = json.load(f)
    return jsonFile

def readLogFile(filename):
    file = open(filename)
    return file.read()



@keyword
def Get_Password(user_id):
    jUsers = readJson("./TestData/Users.json")
    password = ""
    for user in jUsers['Users']:
        if user["User_ID"] == user_id:
            password = user["Password"]
    print(password)
    return str(password)


def identify_row_col(File,row_no,col_no):
    inputFile = File
    row_no=int(row_no)
    col_no=int(col_no)
    with open(inputFile) as ip:
        reader = csv.reader(ip)
        for i, row in enumerate(reader):
            if i == row_no:      # here's the row
                #print row[col_no] # here's the column
                return row[col_no]

@keyword
def generatejson(csvpath,jsonpath):
    cs = obj.CsvToJson()
    cs.csv_to_json(csvpath,jsonpath)

@keyword
def getProcessId(txt):
    x=txt.rindex("Process ")
    return txt[8:15]

@keyword
def getCapabilities(browserNameFromConfig,browserVersionFromConfig,platformNameFromConfig,resolutionFromConfig,fileName):
    if browserNameFromConfig!='':
        capabilities = {
        'browserName': browserNameFromConfig,
        'browserVersion': browserVersionFromConfig,
        'platformName': platformNameFromConfig,
        'sauce:options': {
            'name': fileName,
            'idleTimeout': '520',
            'screenResolution': resolutionFromConfig

        }
    }
    return capabilities

@keyword
def createSauceURL(username,accessKey):
    _credentials = username + ":" + accessKey
    _url = "https://" + _credentials + "@ondemand.saucelabs.com/wd/hub"
    return _url

@keyword
def getIdFromName(txt):
    x=txt.index('(')
    y=txt.index(')')
    return txt[x+1:y]

# @keyword
# def read_text_file_from_download_and_return_content(filename):
#     file = open("C:\Users\akash.parasram.dhage\Downloads"+filename+".txt")
#     return file.read()

@keyword
def dateCompare(refrence_date, input_date):
    date1 = datetime.datetime.strptime(refrence_date, "%d-%b-%Y")
    date2 = datetime.datetime.strptime(input_date, "%d-%b-%Y")
    d1 = datetime.datetime(date1.year, date1.month, date1.day)
    d2 = datetime.datetime(date2.year, date2.month, date2.day)
    if d1<d2:
        return "Future Date"
    elif d1>d2:
        return "Past Date"
    else:
        return "Same Date"

@keyword
def getCityName(txt):
    x=txt[:-11]
    x=str.title(x)
    return x

@keyword
def appendtojson(jsonpath,key,value):
    dict = readJson(jsonpath)
    dict.update({key: value})
    with open(jsonpath, "w") as writefile:
        json.dump(dict, writefile)

@keyword
def appendtocsv(csvpath, rowId, header, value):
    df = pd.read_csv(csvpath)
    df.at[(int(rowId)-1), header] = value
    df.to_csv(csvpath, index=False, header=True)

@keyword
def generatecsv(jsonpath, csvpath):
    dict = readJson(jsonpath)
    df = pd.DataFrame(dict, index=[0])
    df.to_csv(csvpath, index=False, header=True)

@keyword
def getRecordDate(txt):
    x=txt[-19:]
    return x

@keyword
def checkDate(value):
    value= datetime.datetime.strptime(value, "%d-%b-%Y %I:%M %p")
    if isinstance(value, datetime.datetime):
        x=True
        # print('Given Value is Date Time Object')
    else:
        x=False
        # print('Given Value is not Date Time Object')
    return x