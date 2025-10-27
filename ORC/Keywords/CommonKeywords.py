import json
from pathlib import Path

from SeleniumLibrary.base import keyword
from robot.libraries.BuiltIn import BuiltIn
from datetime import date
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
def get_current_date_time():
    return str(date.today().strftime("%m/%d/%Y %H:%M"))


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
def check_and_increment_date_(date):
    day = date[0:2]
    x = date.startswith("0")
    print(x)
    if x == True:
        day = day[1]
        day = int(day)
        day = day + 1
    return day

@keyword
def get_current_date_dd_mm_yyyy():
    return str(date.today().strftime("%d/%m/%Y"))

@keyword
def get_current_date_dd_mmm_yyyy():
    return str(date.today().strftime("%d-%b-%Y"))

@keyword
def get_current_date_dd_mmmm_yyyy():
    return str(date.today().strftime("%d-%m-%Y"))
