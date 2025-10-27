#!/usr/bin/env python3
import os.path
import re
from pathlib import Path

def regex_search(regex_string, contents):
    search_regex = re.compile(regex_string)
    match_object = search_regex.search(contents)
    try:
        return match_object.group(1)
    except AttributeError:
        return ''

# Include header in the output file
output_file = 'robot_library.csv'
with open(output_file, 'w') as file_object:
    file_object.write("TAG,FILENAME,DOCUMENTATION,PREREQUISITE,ENVIRONMENT SPECIFIC DATA,REUSABLE DATA,DYNAMIC DATA,TEST CASE NAME\n")

# Create a list with all the Robot files to be scanned
files = []
for obj in Path.cwd().glob('*.robot'):
    files.append(obj)

# Loop in each file to extract info
for file in files:
    file_name = file
    file_name_value= os.path.basename(file_name)
    with open(file_name) as file_object:
        file_contents = file_object.read()

    line = ''
    # Module
    line += regex_search(r'\[Tags\]\s*(\w*)', file_contents)
    # File name
    line += ', ' + '"' + regex_search(r'\.\/CSV\/(.*)\.csv', file_contents) +'"'
    # Documentation columns
    line += ', ' + regex_search(r'Documentation\s*(.*)', file_contents)
    line += ', ' + regex_search(r'Prerequisi?te:\s*(.*)', file_contents)
    line += ', ' + regex_search(r'Environment Specific Data:\s*(.*)', file_contents)
    line += ', ' + regex_search(r'Reusable Data:\s*(.*)', file_contents)
    line += ', ' + regex_search(r'Dynamic Data:\s*(.*)', file_contents)
    line += ', ' + file_name_value

    # Include extract data into the output file
    with open(output_file, 'a') as file_object:
        file_object.write(line + "\n")

