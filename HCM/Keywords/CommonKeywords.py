import json
from pathlib import Path

from SeleniumLibrary.base import keyword
from robot.libraries.BuiltIn import BuiltIn
from datetime import date
from datetime import datetime
import datetime
import clipboard


@keyword
def compare_lists(a_list: list, e_list: list):
    for item in a_list:
        if item in e_list:
            assert True
        else:
            assert False
    assert True


@keyword
def check_text_in_list(text, itemslist):
    if text in itemslist:
        BuiltIn().log_to_console(message=text + ' in given list')
    else:
        BuiltIn().log_to_console(message=text + ' not in given list')
        # assert False
        assert False, text + 'Not in given list'


@keyword
def get_xpath_of_element(path):
    path = str(path)
    if path.__contains__('xpath'):
        return path
    elif path.__contains__('name'):
        return "//input[@name='" + path.split(':', 2)[1] + "']"
    elif path.__contains__('id'):
        return "//input[@id='" + path.split(':', 2)[1] + "']"
    else:
        assert False, 'Path not supported ' + path


@keyword
def get_json(filepath: str):
    with open(Path(__file__).parent.parent.parent / Path(filepath)) as f:
        jsonFile = json.load(f)
    return jsonFile


@keyword
def get_current_date():
    return str(date.today().strftime("%m/%d/%Y"))

@keyword
def get_current_date_dd_mm_yyyy():
    return str(date.today().strftime("%d/%m/%Y"))

@keyword
def get_current_date_time():
    return str(date.today().strftime("%m/%d/%Y %H:%M"))

@keyword
def get_current_date_dd_mmm_yyyy():
    return str(date.today().strftime("%d-%b-%Y"))

@keyword
def get_current_date_dd_mmmm_yyyy():
    return str(date.today().strftime("%d-%m-%Y"))

@keyword
def get_splitted_string(text):
    return text.split("\n")

@keyword
def extract_the_index(column_header_text,column_name):
    index_num=column_header_text.index(column_name)
    return index_num

@keyword
def extract_the_occurrence(column_header_text,index_num,recurring_character):
    sub_string=column_header_text[0:index_num]
    count=sub_string.count(recurring_character)
    return count

@keyword
def extract_the_index_text(row_value,count,recurring_character):
    start = row_value.find(recurring_character)
    while start >= 0 and count > 1:
        start = row_value.find(recurring_character, start+len(recurring_character))
        count -= 1
    return start

@keyword
def extract_the_text(row_value,start_index,end_index):
    return row_value[start_index:end_index]





# @keyword
# def next_month_to_date():
#     next_month = (datetime.date.today().month + 1) % 12 or 12
#     return next_month
#
# @keyword
# def next_year_to_date():
#     next_year = (str(datetime.date.today().day) + '/' + str(datetime.date.today().month) + '/' + str(datetime.date.today().year + 1))
#     return next_year

@keyword
def get_clipboard_value():
    return clipboard.paste()

@keyword
def get_process_name(processName):
    now = datetime.datetime.now()
    dt_string=now.strftime("%d%m%y%H%M%S")
    fullProcessName=processName + dt_string
    print(fullProcessName)
    return fullProcessName

@keyword
def leap_year(year):
    if year % 400 == 0:
        return True
    if year % 100 == 0:
        return False
    if year % 4 == 0:
        return True
    return False

@keyword
def days_in_month(month, year):
    if month in {'Jan', 'Mar', 'May', 'Jul', 'Aug', 'Oct', 'Dec'}:
        return 31
    if month == 'Feb':
        if leap_year(year):
            return 29
        return 28
    return 30