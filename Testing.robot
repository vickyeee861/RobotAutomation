*** Settings ***
Suite Setup       Launch Browser
Library           Selenium2Library

*** Variables ***
${url}            https://facebook.com/
${Browser}        FIREFOX

*** Test Cases ***
[TC-001]-Launching the browser with facebook.com
    [Documentation]    [Document] Verify whether Facebook link are present. email (or) phone number and password text field are present, Login link are present." Forgotten account?" Link are present," Facebook helps you connect and share with the people in your life" Element are present, bottom image are present, "Create an account" Element are present, "It's free and always will be" Element are present, Firest name, Surname, Mobile number or email address, New Password Text field are present. "Birthday" Element are present, Day, Month, Year Link are present, "Why do I need to provide my date of birth?" Link are present, Female and Male Link are present, Terms, Data Policy and Cookie Use Policy Links are present, Create an account Button are present, Create a page Link are present.
    [Tags]    fb
    Page Should Contain Element    xpath=//i[@class="fb_logo img sp_PGcWgRo7fE- sx_582a4f"]
    Page Should Contain Element    id=email
    Page Should Contain Element    id=pass
    Page Should Contain Button    id=u_0_r
    Page Should Contain Element    link=Forgotten account?
    Page Should Contain Element    xpath=//div[@class="_5iyx"]
    Page Should Contain Image    xpath=//img[@class="img"]
    Page Should Contain Element    xpath=//div[@class="mbs _52lq fsl fwb fcb"]
    Page Should Contain Element    xpath=//div[@class="_52lr fsm fwn fcg"]
    Page Should Contain Textfield    id=u_0_2
    Page Should Contain Textfield    id=u_0_4
    Page Should Contain Textfield    id=u_0_7
    Page Should Contain Element    xpath=//div[@class="placeholder"]
    Page Should Contain Element    xpath=//div[@class="mtm mbs _2_68"]
    page Should Contain Element    id=day
    page Should Contain Element    id=month
    page Should Contain Element    id=year
    Page Should Contain Element    id=birthday-help
    Page Should Contain Element    id=u_0_h
    Page Should Contain Element    xpath=//label[@class="_58mt"]
    Page Should Contain Element    id=u_0_i
    Page Should Contain Element    xpath=//label[@class="_58mt"]
    Page Should Contain Element    id=terms-link
    Page Should Contain Element    id=privacy-link
    Page Should Contain Element    id=cookie-use-link
    Page Should Contain Button    id=u_0_m
    Page Should Contain Element    id=reg_pages_msg

*** Keywords ***
Launch Browser
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

Launch Application
