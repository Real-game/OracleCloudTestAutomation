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
def getCapabilities(browserNameFromConfig,browserVersionFromConfig,platformNameFromConfig,fileName):
    if browserNameFromConfig!='':
        capabilities = {
        'browserName': browserNameFromConfig,
        'browserVersion': browserVersionFromConfig,
        'platformName': platformNameFromConfig,
        'sauce:options': {
            'name': fileName
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
