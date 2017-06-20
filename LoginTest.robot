*** Settings ***
Suite Setup       Launch Browser
Test Setup        Go To Home Page
Library           Selenium2Library

*** Variables ***
${URL}            https://freshfone.freshpo.com/
${BROWSER}        FIREFOX

*** Test Cases ***
[TC-001]-Launching the browser with freshfone.freshpo.com
    [Documentation]    [Document] Verify whether Search text field is present, "New Support Ticket" and "Check ticket status" links are present, Home,Solutions,Forums tabs are present. Login,signup links are present, freshfone and image logo are present. "How can we help you today" text are present.
    [Tags]    sample
    Page Should Contain Textfield    id=support-search-input
    Page Should Contain Element    link=New support ticket
    Page Should Contain Element    link=Check ticket status
    Page Should Contain Element    link=Home
    Page Should Contain Element    link=Solutions
    Page Should Contain Element    link=Forums
    Page Should Contain Element    link=Login
    Page Should Contain Element    link=Sign up
    Page should contain image    xpath=//img[@data-type='logo']
    Page Should Contain Element    xpath=//h1[@class="ellipsis heading"]
    Page Should Contain Element    xpath=//h2[@class="heading hide-in-mobile"]
    Page Should Contain Element    xpath=//h2[@class="heading"]
    Page Should Contain Element    xpath=//div[@class="welcome"]
    Page Should Contain Element    link=Start a new topic
    Page Should Contain Element    link=freshfone Forums
    Page Should Contain Element    link=Announcements 0
    Page Should Contain Element    link=Feature Requests 1
    Page Should Contain Element    link=Tips and Tricks 0
    Page Should Contain Element    link= Report a problem 0
    Page Should Contain Element    link=testcat6
    Page Should Contain Element    link=test api forum 1
    Page Should Contain Element    link=Help Desk Software

[TC-002]-checking login link and login page
    [Documentation]    [Document] click on login link to Verify Email text field and password text field and login button are present. and Google link, Facebook link, Twitter link. sign up with us link, forgot your password? link are present in login page.
    [Tags]    sample1
    Click Element    link=Login
    Wait Until Element Is Visible    id=user_session_email
    Page Should Contain Element    id=user_session_email
    Page Should Contain Element    id=user_session_password
    Page Should Contain Button    xpath=//button[@type='submit']
    Page Should Contain Element    link=Google
    Page Should Contain Element    link=Facebook
    Page Should Contain Element    link=Twitter
    Page Should Contain Element    link=Forgot your password?
    Page Should Contain Element    link=Sign up with us

[TC-003]-Checking Login Link with invalid credentials
    [Documentation]    [Document]Enter the email address in email text field password in next text field,click on LOGIN button.
    [Tags]    login
    Click Element    link=Login
    Wait Until Element Is Visible    id=user_session_email    60 seconds
    Input Text    id=user_session_email    vickyeee361@gmail.com
    Input Password    id=user_session_password    8508309500
    Click Button    xpath=//button[@type='submit']
    ${error_msg}    Get Text From Error Message
    Should Contain    ${error_msg}    The email and password you entered does not match

[TC-004]-Checking Login without credentials
    [Documentation]    [Document]Without Checking email and password text field to click on LOGIN button.
    Click Element    link=Login
    Wait Until Element Is Visible    xpath=//button[@type='submit']    60 seconds
    Sleep    2
    Click Button    xpath=//button[@type='submit']
    ${fault}    Get Text From Error Message
    Should Contain    ${fault}    You did not provide any details for authentication.

[TC-005]-checking sign up link and sign up page
    [Documentation]    [Document]Click on Sign up link to shown"Sign up for your freshfone account , to verify the text field, emaill field ,register button and cancel button are present.
    [Tags]    critical
    Click Element    link=Sign up
    Wait Until Element Is Visible    id=user_name    20seconds
    Page Should Contain Element    id=user_name
    Page Should Contain Element    id=user_email
    Sleep    5
    Page should contain Element    xpath=//input[@type='submit']

[TC-006]-Checking Sign up Link.
    [Documentation]    [Document] Enter the name in text box field and Enter the Email in Email text box field, click on Register button.
    Click Element    link=Sign up
    Wait Until Element Is Visible    id=user_name    20seconds
    Input Text    id=user_name    VigneshwaranBaskaran
    Input Text    id=user_email    vickyeee361@gmail.com
    Click Element    xpath=//input[@type='submit']

[TC-007]-checking sign up link.
    [Documentation]    [Document]Click on Sign up link to shown"Sign up for your freshfone account "without cheking name and email text box to click on directly Register button.
    [Tags]    signup
    Click Element    link=Sign up
    Wait Until Element Is Visible    xpath=//input[@type='submit']    20seconds
    Click Element    xpath=//input[@type='submit']
    ${error1}    Get Text    id=user_name-error
    ${error2}    Get Text    id=user_email-error
    Should Be Equal    ${error1}    This field is required.
    Should be equal    ${error2}    This field is required.

[TC-008]-checking New support ticket link and New support ticket page
    [Documentation]    [Document]Click on New support ticket link to shown "Submit a ticket" To verify and checking the Email Text Field, Subject Text field, Product text box, Discription text field, +Attach a file link and Submit button.
    Click Element    link=New support ticket
    Wait Until Element Is Visible    id=helpdesk_ticket_email    20seconds
    Page Should Contain Element    id=helpdesk_ticket_email
    Page Should Contain Element    id=helpdesk_ticket_subject
    Page Should Contain Element    id=helpdesk_ticket_product_id
    #Page Should Contain Element    id=redactor_editor
    Page Should Contain Element    xpath=//a[@class='btn']
    Page Should Contain Element    id=helpdesk_ticket_submit

[TC-009]-checking New support ticket link and New support ticket page
    [Documentation]    [Document]Click on New support ticket link to shown "Submit a ticket", to enter the email in email text field, Type the subject in subject text field, choose the product in product text box and type the text in discription text field. Click on submit button.
    Click Element    link=New support ticket
    Wait Until Element Is Visible    id=helpdesk_ticket_email    20seconds
    Input Text    id=helpdesk_ticket_email    vickyeee361@gmail.com
    Input Text    id=helpdesk_ticket_subject    testing
    #Input Text    id=helpdesk_ticket_product_id    fatafone
    Click Element    id=helpdesk_ticket_submit

[TC_010]-checking "Check ticket status" link and check ticket status page
    [Documentation]    [Document]click on check ticket status to shown "You must be logged in to access this page" To Checking Remove The That Text.
    Element should not be visible    id=notice
    Click element    link=Check ticket status
    Wait until element is visible    id=notice    20seconds
    Element should be visible    id=notice
    ${alert-message}    get text    id=notice
    Should contain    ${alert-message}    You must be logged in to access this page
    Click element    xpath=//button[@data-dismiss='alert']
    Element should not be visible    id=notice

[TC_011]-checking "Check ticket status" link and check ticket status page
    [Documentation]    [Document]click on check ticket status to shown "Login to the support portal" To Verify Email Text Field, Password Text Field, Forgot your password link, Login buttton, Google, Facebook, Twitter and Sign up with us are present.
    Click element    link=Check ticket status
    Wait Until Element Is Visible    id=user_session_email    20 seconds
    Page Should Contain Element    id=user_session_email
    Page Should Contain Element    id=user_session_password
    Page Should Contain Element    id=forgot_password
    Page Should Contain Button    xpath=//button[@type='submit']
    Page Should Contain Element    link=Google
    Page Should Contain Element    link=Facebook
    Page Should Contain Element    link=Twitter
    Page Should Contain Element    link= Sign up with us

[TC_012]-checking "Check ticket status" link and check ticket status page
    [Documentation]    [Document]click on check ticket status to Enter the Email Address in Email Text Field, Enter the Password in password text field and Click on Login Button.
    Click element    link=Check ticket status
    Wait Until Element Is Visible    id=user_session_email    20 seconds
    Input Text    id=user_session_email    vickyeee361@gmail.com
    Input password    id=user_session_password    8508309500
    Click Button    xpath=//button[@type='submit']

[TC_013]-Adding a ticket
    [Documentation]    [Document]click on check ticket status to Enter the Email Address in Email Text Field, Enter the Password in password text field and Click on Login Button.
    [Tags]    ticket
    Click Element    link=New support ticket
    Wait Until Element Is Visible    id=helpdesk_ticket_email    20seconds
    Input Text    id=helpdesk_ticket_email    vickyeee361@gmail.com
    Input Text    id=helpdesk_ticket_subject    testing
    Select From List    id=helpdesk_ticket_product_id    fatafone
    Click Element    id=helpdesk_ticket_submit

*** Keywords ***
Launch Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Launch Application

Get Text From Error Message
    Wait Until Element Is Visible    id=errorExplanation    60 seconds
    Sleep    5
    ${text}    Get Text    xpath=//li[@class='']
    [Return]    ${text}

Go To Home Page
    Go To    https://freshfone.freshpo.com/support/home
