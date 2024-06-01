*** Settings ***
Library    SeleniumLibrary    timeout=5
Resource    ../resources/utility.robot
Resource    ../resources/variables.robot
Test Setup    Run Keywords    Set Screenshot Directory    ./screenshots
              ...    AND    Open Keystone Website By Chrome
              ...    AND    Sign In As Administrator

*** Test Cases ***
Create A Post
    Create A Post    TestPostTitle

    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    1 Post sorted by name
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[2]/a    TestPostTitle

    [Teardown]    Run Keywords    Delete All Posts
                  ...    AND    Close Browser

Create Posts
    Create A Post    TestPostTitle1
    Create A Post    TestPostTitle2
    Create A Post    TestPostTitle3

    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    3 Posts sorted by name
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[2]/a    TestPostTitle1
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[2]/a    TestPostTitle2
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[2]/a    TestPostTitle3

    [Teardown]    Run Keywords    Delete All Posts
                  ...    AND    Close Browser

Delete A Post
    Create A Post    TestPostTitle

    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=${DELETE_ICON}
    Click Element    xpath=${DELETE_ICON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}
    Wait Until Element Is Not Visible    xpath=${CONFIRM_DELETE_WIDGET}
    Wait Until Element Is Not Visible    xpath=${MANAGE_BUTTON}
    Element Text Should Be    xpath=//h2    No posts found...

    [Teardown]    Run Keywords    Close Browser

Delete All Posts
    Create A Post    TestPostTitle1
    Create A Post    TestPostTitle2
    Create A Post    TestPostTitle3
    Delete All Posts

    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    No posts found...

    [Teardown]    Run Keywords    Close Browser

Search Posts
    Create A Post    TestPostTitle1
    Create A Post    TestPostTitle2
    Create A Post    TestPostTitle3

    Go To    ${POST_URL}
    Wait Until Location Is    ${POST_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Wait For Element    xpath=${SEARCH_TEXT_BOX}
    Input Text    ${SEARCH_TEXT_BOX}    2
    Wait Until Element Does Not Contain    //h2    Posts
    Element Text Should Be    xpath=//h2    1 Post sorted by name
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[2]/a    TestPostTitle2

    [Teardown]    Run Keywords    Delete All Posts
                  ...    AND    Close Browser

Create A Comment
    Create A Post    TestPostTitle
    Create A Comment    Demo User    TestPostTitle

    Go To    ${COMMENT_URL}
    Wait Until Location Is    ${COMMENT_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    1 Comment
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[3]/a    Demo User
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[4]/a    TestPostTitle

    [Teardown]    Run Keywords    Delete All Comments
                  ...    AND    Delete All Posts
                  ...    AND    Close Browser

Create Comments
    Create A Post    TestPostTitle
    Create A Comment    Demo User    TestPostTitle
    Create A Comment    Demo User    TestPostTitle
    Create A Comment    Demo User    TestPostTitle

    Go To    ${COMMENT_URL}
    Wait Until Location Is    ${COMMENT_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    3 Comments
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[3]/a    Demo User
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[3]/a    Demo User
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[3]/a    Demo User
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[4]/a    TestPostTitle
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[4]/a    TestPostTitle
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[4]/a    TestPostTitle

    [Teardown]    Run Keywords    Delete All Comments
                  ...    AND    Delete All Posts
                  ...    AND    Close Browser

Delete A Comment
    Create A Post    TestPostTitle
    Create A Comment    Demo User    TestPostTitle

    Go To    ${COMMENT_URL}
    Wait Until Location Is    ${COMMENT_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=${DELETE_ICON}
    Click Element    xpath=${DELETE_ICON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}
    Wait Until Element Is Not Visible    xpath=${CONFIRM_DELETE_WIDGET}
    Wait Until Element Is Not Visible    xpath=${MANAGE_BUTTON}
    Element Text Should Be    xpath=//h2    No comments found...

    [Teardown]    Run Keywords    Delete All Posts
                  ...    AND    Close Browser

Delete All Comments
    Create A Post    TestPostTitle
    Create A Comment    Demo User    TestPostTitle
    Create A Comment    Demo User    TestPostTitle
    Create A Comment    Demo User    TestPostTitle
    Delete All Comments

    Go To    ${COMMENT_URL}
    Wait Until Location Is    ${COMMENT_URL}
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    No comments found...

    [Teardown]    Run Keywords    Delete All Posts
                  ...    AND    Close Browser

Create A Category
    Create A Category    TestCategoryTitle

    Go To    ${CATEGORY_URL}
    Wait Until Location Is    ${CATEGORY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    1 Category sorted by name
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[2]/a    TestCategoryTitle

    [Teardown]    Run Keywords    Delete All Categories
                  ...    AND    Close Browser

Create Categories
    Create A Category    TestCategoryTitle1
    Create A Category    TestCategoryTitle2
    Create A Category    TestCategoryTitle3

    Go To    ${CATEGORY_URL}
    Wait Until Location Is    ${CATEGORY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    3 Categories sorted by name
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[2]/a    TestCategoryTitle1
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[2]/a    TestCategoryTitle2
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[2]/a    TestCategoryTitle3

    [Teardown]    Run Keywords    Delete All Categories
                  ...    AND    Close Browser

Delete A Category
    Create A Category    TestCategoryTitle

    Go To    ${CATEGORY_URL}
    Wait Until Location Is    ${CATEGORY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=${DELETE_ICON}
    Click Element    xpath=${DELETE_ICON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}
    Wait Until Element Is Not Visible    xpath=${CONFIRM_DELETE_WIDGET}
    Wait Until Element Is Not Visible    xpath=${MANAGE_BUTTON}
    Element Text Should Be    xpath=//h2    No categories found...

    [Teardown]    Run Keywords    Close Browser

Delete All Categories
    Create A Category    TestCategoryTitle1
    Create A Category    TestCategoryTitle2
    Create A Category    TestCategoryTitle3
    Delete All Categories

    Go To    ${CATEGORY_URL}
    Wait Until Location Is    ${CATEGORY_URL}
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    No categories found...

    [Teardown]    Run Keywords    Close Browser

Create An Enquiry
    Create An Enquiry    TestEnquirieName    test@email.com    Just leaving a message    TestEnquirieMessage
    
    Go To    ${ENQUIRY_URL}
    Wait Until Location Is    ${ENQUIRY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    1 Enquiry
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[2]/a    TestEnquirieName
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[3]/a    test@email.com
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[4]/div    Just leaving a message

    [Teardown]    Run Keywords    Delete All Enquiries
                  ...    AND    Close Browser

Create Enquiries
    Create An Enquiry    TestEnquirieName1    test@email.com    Just leaving a message    TestEnquirieMessage
    Create An Enquiry    TestEnquirieName2    test@email.com    Just leaving a message    TestEnquirieMessage
    Create An Enquiry    TestEnquirieName3    test@email.com    Just leaving a message    TestEnquirieMessage
    
    Go To    ${ENQUIRY_URL}
    Wait Until Location Is    ${ENQUIRY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    3 Enquiries
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[2]/a    TestEnquirieName1
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[2]/a    TestEnquirieName2
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[2]/a    TestEnquirieName3
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[3]/a    test@email.com
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[3]/a    test@email.com
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[3]/a    test@email.com
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[1]/td[4]/div    Just leaving a message
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[2]/td[4]/div    Just leaving a message
    Element Text Should Be    xpath=//*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr[3]/td[4]/div    Just leaving a message

    [Teardown]    Run Keywords    Delete All Enquiries
                  ...    AND    Close Browser

Delete An Enquiry
    Create An Enquiry    TestEnquirieName    test@email.com    Just leaving a message    TestEnquirieMessage
    
    Go To    ${ENQUIRY_URL}
    Wait Until Location Is    ${ENQUIRY_URL}
    Wait Until Element Contains    xpath=${MANAGE_BUTTON}    Manage
    Wait For Element    xpath=${DELETE_ICON}
    Click Element    xpath=${DELETE_ICON}
    Wait For Element    xpath=${CONFIRM_DELETE_WIDGET}
    Wait For Element    xpath=${CONFIRM_DELETE_BUTTON}
    Click Element    xpath=${CONFIRM_DELETE_BUTTON}
    Wait Until Element Is Not Visible    xpath=${CONFIRM_DELETE_WIDGET}
    Wait Until Element Is Not Visible    xpath=${MANAGE_BUTTON}
    Element Text Should Be    xpath=//h2    No enquiries found...

    [Teardown]    Run Keywords    Close Browser

Delete All Enquiries
    Create An Enquiry    TestEnquirieName1    test@email.com    Just leaving a message    TestEnquirieMessage
    Create An Enquiry    TestEnquirieName2    test@email.com    Just leaving a message    TestEnquirieMessage
    Create An Enquiry    TestEnquirieName3    test@email.com    Just leaving a message    TestEnquirieMessage
    Delete All Enquiries

    Go To    ${ENQUIRY_URL}
    Wait Until Location Is    ${ENQUIRY_URL}
    Wait For Element    xpath=//h2
    Element Text Should Be    xpath=//h2    No enquiries found...

    [Teardown]    Run Keywords    Close Browser
