import os
import json
from SeleniumLibrary.base import keyword
import csv
from dist import csvjson as obj
import pandas as pd


@keyword
def readJson(jsonFilePath):
    with open(jsonFilePath) as f:
        jsonFile = json.load(f)
    return jsonFile



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
def searchRequsition(txt,element):
    x=txt.find(element)
    if txt[x-1]=='(':
        return True
    else:
        return False

@keyword
def formCandidateName(txt):
    x=txt.split()
    return x[1]+', '+x[0]+' '+x[2]


@keyword
def formsXpathForQuestions(temp,title):
    result=temp[:20]+title+temp[20:]
    return result

@keyword
def getIdFromName(txt):
    x=txt.rindex('(')
    y=txt.rindex(')')
    return txt[x+1:y]

@keyword
def getCandidateName(txt):
    x=txt.index('(')
    return txt[0:x-1]

@keyword
def  path():
    abspath = os.path.abspath(__file__)
    x=abspath.find("Helpers")
    return abspath[:x] + "TestData"

@keyword
def formXpath(temp,value):
    index=temp.index('"')
    result=temp[:index+1]+value+temp[index+1:]
    return result

@keyword
def retainOTP(value):
    index=value.rfind(':')
    result=value[index+2:]
    list1=[]
    list1[:0]=result
    return list1


@keyword
def generatejson(csvpath,jsonpath):
    cs = obj.CsvToJson()
    cs.csv_to_json(csvpath,jsonpath)

@keyword
def generatecsv(jsonpath, csvpath):
    dict = readJson(jsonpath)
    df = pd.DataFrame(dict, index=[0])
    df.to_csv(csvpath, index=False, header=True)

@keyword
def appendtojson(jsonpath,key,value):
    dict = readJson(jsonpath)
    dict.update({key: value})
    with open(jsonpath, "w") as writefile:
        json.dump(dict, writefile)

@keyword
def  getFirstName(text):
    if text.find(',') != -1:
        return text[:text.find(",")]
    else:
       return text[:text.find(" ")]


@keyword
def getName(text):
    return text[:text.find(" ")]

@keyword
def formQuesXpath(temp,value):
    temp=temp.replace("?",value)
    return temp

@keyword
def uppertolower(value):
    return  value.lower()

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
def Get_Mail(email):
    index = email.index('@')
    return email[0:index]

@keyword
def Get_Scheduled_Process_Id(txt):
    return txt[8:15]


@keyword
def appendtocsv(csvpath, rowId, header, value):
    df = pd.read_csv(csvpath)
    df.at[(int(rowId)-1), header] = value
    df.to_csv(csvpath, index=False, header=True)

@keyword
def convertToCandidateName(firstName, lastName):
    name = lastName+", "+firstName+" ()"
    return name

@keyword
def getNameFromCandidateName(firstName, lastName):
    name = firstName+" "+lastName
    return name