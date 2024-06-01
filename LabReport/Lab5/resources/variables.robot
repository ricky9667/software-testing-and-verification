*** Variables ***
${KEYSTONE_URL}    http://127.0.0.1:3000/
${ADMIN_UI_URL}    ${KEYSTONE_URL}keystone/
${CONTACT_URL}    ${KEYSTONE_URL}contact
${POST_URL}    ${ADMIN_UI_URL}posts
${COMMENT_URL}    ${ADMIN_UI_URL}post-comments
${CATEGORY_URL}    ${ADMIN_UI_URL}post-categories
${ENQUIRY_URL}    ${ADMIN_UI_URL}enquiries
${DELAY}    0
${SIGN_IN_LINK}    //*[@id="navbar-collapse"]/ul[2]/li[2]/a
${EMAIL_TEXT_BOX}    //input[@name='email']
${PASSWORD_TEXT_BOX}    //input[@name='password']
${SING_IN_BUTTON}    //*[@id="signin-view"]/div/div[1]/div/div[2]/form/button

${CREATE_BUTTON}    //h4/../../../div[3]/button[1]
${MANAGE_BUTTON}    //*[@id="react-root"]/div/main/div/div/div[2]/div/div[1]/div/div/button
${ALL_BUTTON}    //*[@id="react-root"]/div/main/div/div/div[2]/div/div/div/div[2]/div/button[1]
${DELETE_BUTTON}    //*[@id="react-root"]/div/main/div/div/div[2]/div/div/div/div[3]/button
${DELETE_ICON}    //*[@id="react-root"]/div/main/div/div/div[3]/div/div/table/tbody/tr/td[1]/button
${CONFIRM_DELETE_WIDGET}    /html/body/div[8]/div/div/div/div
${CONFIRM_DELETE_BUTTON}    /html/body/div[8]/div/div/div/div/div[2]/button[1]
${SAVE_BUTTON_IN_EDIT_PAGE}    //*[@id="react-root"]/div/main/div/div/div[1]/form/div[2]/div/div/button[1]
${ALERT_IN_EDIT_PAGE}    //*[@id="react-root"]/div/main/div/div/div[1]/form/div[1]
${BACK_BUTTON_IN_EDIT_PAGE}    //*[@id="react-root"]/div/main/div/div/div[1]/div/div[1]/a
${SEARCH_TEXT_BOX}    //*[@id="react-root"]/div/main/div/div/div[1]/div[1]/div[1]/div/input

${CREATE_POST_BUTTON}    //*[@id="react-root"]/div/main/div/div[2]/div/div[1]/div[2]/div[1]/span/a[2]
${CREATE_POST_TEXT_BOX}    //h4/../../../div[2]/div/div/input
${POST_TEXT_BOX}    /html/body/div[1]/div/main/div/div/div[1]/form/div[1]/div[1]/div/div[1]/div/div/input
${POST_TEXT_BOX_IN_EDIT_PAGE}    //input[@placeholder="Name"]

${CREATE_COMMENT_BUTTON}    //*[@id="react-root"]/div/main/div/div[2]/div/div[1]/div[2]/div[2]/span/a[2]
${AUTHOR_SELECTOR}    //h4/../../../div[2]/div[1]/div/div/div/div
${AUTHOR_SELECTION}    //h4/../../../div[2]/div[1]/div/div/div/div[2]
${POST_SELECTOR}    //h4/../../../div[2]/div[2]/div/div/div/div
${POST_SELECTION}    //h4/../../../div[2]/div[2]/div/div/div/div[2]

${CREATE_CATEGORY_BUTTON}    //*[@id="react-root"]/div/main/div/div[2]/div/div[1]/div[2]/div[3]/span/a[2]
${CREATE_CATEGORY_TEXT_BOX}    //h4/../../../div[2]/div/div/input
${CATEGORY_TEXT_BOX}    /html/body/div[1]/div/main/div/div/div[1]/form/div[1]/div[1]/div/div[1]/div/div/input

${NAME_TEXT_BOX}    /html/body/div/div[2]/div[1]/form/div[1]/div/input
${EMAIL_TEXT_BOX}    /html/body/div/div[2]/div[1]/form/div[2]/div/input
${REGARDING_SELECTOR}    /html/body/div/div[2]/div[1]/form/div[4]/div/select
${MESSAGE_TEXT_BOX}    /html/body/div/div[2]/div[1]/form/div[5]/div/textarea
${SUBMIT_BUTTON}     /html/body/div/div[2]/div[1]/form/div[6]/div/button
