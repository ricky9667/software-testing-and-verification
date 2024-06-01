*** Settings ***
Library    SeleniumLibrary
Resource    variables.robot

*** Keywords ***
Wait For Element
    [Arguments]    ${element}
    Wait Until Page Contains Element    ${element}
    Wait Until Element Is Visible    ${element}
    Wait Until Element Is Enabled    ${element}

Open Keystone Website By Chrome
    Open Browser    ${KEYSTONE_URL}    Chrome
    Location Should Be    ${KEYSTONE_URL}
    Maximize Browser Window
    Set Selenium Speed    ${DELAY}

Sign In As Administrator
    Wait For Element    xpath=${SIGN_IN_LINK}
    Click Element    xpath=${SIGN_IN_LINK}
    Wait For Element    xpath=${EMAIL_TEXT_BOX}
    Wait For Element    xpath=${PASSWORD_TEXT_BOX}
    Input Text    xpath=${EMAIL_TEXT_BOX}    demo@keystonejs.com
    Input Text    xpath=${PASSWORD_TEXT_BOX}    demo
    Wait For Element     xpath=${SING_IN_BUTTON}
    Click Element    xpath=${SING_IN_BUTTON}
    Wait Until Location Is    ${ADMIN_UI_URL}

Create A Post
    [Arguments]    ${title}
    Go To    ${ADMIN_UI_URL}
    Wait Until Location Is    ${ADMIN_UI_URL}
    Wait For Element    xpath=${CREATE_POST_BUTTON}
    Click Element    xpath=${CREATE_POST_BUTTON}
    Wait Until Element Contains    xpath=//h4    Create a new Post
    Wait For Element    xpath=${CREATE_POST_TEXT_BOX}
    Wait For Element    xpath=${CREATE_BUTTON}
    Input Text    xpath=${CREATE_POST_TEXT_BOX}    ${title}
    Click Element    xpath=${CREATE_BUTTON}
    Wait For Element    xpath=${POST_TEXT_BOX}
    Textfield Value Should Be    xpath=${POST_TEXT_BOX}    ${title}

Delete All Posts
    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Click Element    xpath=${MANAGE_BUTTON}
    Wait Until Element Contains    xpath=${ALL_BUTTON}    All
    Click Element    xpath=${ALL_BUTTON}
    Wait For Element    xpath=${DELETE_BUTTON}
    Click Element    xpath=${DELETE_BUTTON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}

Create A Comment
    [Arguments]    ${author}    ${post}
    Go To    ${ADMIN_UI_URL}
    Wait Until Location Is    ${ADMIN_UI_URL}
    Wait For Element    xpath=${CREATE_COMMENT_BUTTON}
    Click Element    xpath=${CREATE_COMMENT_BUTTON}
    Wait Until Element Contains    xpath=//h4    Create a new Comment
    Wait For Element    xpath=${AUTHOR_SELECTOR}
    Wait For Element    xpath=${POST_SELECTOR}
    Click Element    xpath=${AUTHOR_SELECTOR}
    Wait For Element    xpath=${AUTHOR_SELECTION}
    Click Element    xpath=${AUTHOR_SELECTION}
    Click Element    xpath=${POST_SELECTOR}
    Wait For Element    xpath=${POST_SELECTION}
    Click Element    xpath=${POST_SELECTION}
    Click Element    xpath=${CREATE_BUTTON}
    Wait For Element    xpath=//h2

Delete All Comments
    Go To    ${COMMENT_URL}
    Wait Until Location Is    ${COMMENT_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Click Element    xpath=${MANAGE_BUTTON}
    Wait Until Element Contains    xpath=${ALL_BUTTON}    All
    Click Element    xpath=${ALL_BUTTON}
    Wait For Element    xpath=${DELETE_BUTTON}
    Click Element    xpath=${DELETE_BUTTON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}

Create A Category
    [Arguments]    ${title}
    Go To    ${ADMIN_UI_URL}
    Wait Until Location Is    ${ADMIN_UI_URL}
    Wait For Element    xpath=${CREATE_CATEGORY_BUTTON}
    Click Element    xpath=${CREATE_CATEGORY_BUTTON}
    Wait Until Element Contains    xpath=//h4    Create a new Category
    Wait For Element    xpath=${CREATE_CATEGORY_TEXT_BOX}
    Wait For Element    xpath=${CREATE_BUTTON}
    Input Text    xpath=${CREATE_CATEGORY_TEXT_BOX}    ${title}
    Click Element    xpath=${CREATE_BUTTON}
    Wait For Element    xpath=${CATEGORY_TEXT_BOX}
    Textfield Value Should Be    xpath=${CATEGORY_TEXT_BOX}    ${title}

Delete All Categories
    Go To    ${CATEGORY_URL}
    Wait Until Location Is    ${CATEGORY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Click Element    xpath=${MANAGE_BUTTON}
    Wait Until Element Contains    xpath=${ALL_BUTTON}    All
    Click Element    xpath=${ALL_BUTTON}
    Wait For Element    xpath=${DELETE_BUTTON}
    Click Element    xpath=${DELETE_BUTTON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}

Create An Enquiry
    [Arguments]    ${name}    ${email}    ${regarding}    ${message}
    Go To    ${CONTACT_URL}
    Wait Until Location Is    ${CONTACT_URL}
    Wait Until Element Contains    xpath=//h1    Contact
    Wait For Element    xpath=${NAME_TEXT_BOX}
    Wait For Element    xpath=${EMAIL_TEXT_BOX}
    Wait For Element    xpath=${REGARDING_SELECTOR}
    Wait For Element    xpath=${MESSAGE_TEXT_BOX}
    Wait For Element    xpath=${SUBMIT_BUTTON}
    Input Text    xpath=${NAME_TEXT_BOX}    ${name}
    Input Text    xpath=${EMAIL_TEXT_BOX}    ${email}
    Select From List By Label      xpath=${REGARDING_SELECTOR}    ${regarding}
    Input Text    xpath=${MESSAGE_TEXT_BOX}    ${message}
    Click Element    xpath=${SUBMIT_BUTTON}
    Wait Until Element Contains    xpath=//h1    Success!

Delete All Enquiries
    Go To    ${ENQUIRY_URL}
    Wait Until Location Is    ${ENQUIRY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Click Element    xpath=${MANAGE_BUTTON}
    Wait Until Element Contains    xpath=${ALL_BUTTON}    All
    Click Element    xpath=${ALL_BUTTON}
    Wait For Element    xpath=${DELETE_BUTTON}
    Click Element    xpath=${DELETE_BUTTON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}
