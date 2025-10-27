*** Settings ***
Library           SeleniumLibrary
Library           Mailosaur.py

*** Variables ***
${URL}                https://example.mailosaur.com/password-reset
${SERVER_ID}			7f7ddoox
# Value from https://mailosaur.com/app/project/api
${SERVER_DOMAIN}    	7f7ddoox.mailosaur.net
 # Value from https://mailosaur.com/app/project/api

*** Test Cases ***
Test Password Reset
    Request Password Reset

*** Keywords ***
Request Password Reset
    ${TEST_EMAIL_ADDRESS} =    Catenate  SEPARATOR=   must-meal@${SERVER_DOMAIN}
    ${MESSAGE}=     Mailosaur.find_email   ${SERVER_ID}    ${TEST_EMAIL_ADDRESS}
    Mailosaur.subject_should_equal    ${MESSAGE}      Confirm your identity
#    log to console    ${MESSAGE}
    ${mes} =    Mailosaur.message body    ${MESSAGE}
    log to console    ${mes}
    ${otp}=    Mailosaur.get otp from mail    ${MESSAGE}
    log to console    ${otp}

