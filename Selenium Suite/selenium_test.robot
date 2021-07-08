*** Settings ***
Library   DateTime
Library    SeleniumLibrary
Library     OperatingSystem

*** Test Cases ***
TC1 Get Datetime
    ${currentdate}      Get Current Date
    Log To Console      ${currentdate}

TC2 Print Name
    ${name}     Set Variable  {rashmi}
    Log To Console    ${name}
    Set Local Variable  ${name1}    {rashmi1}
    Log To Console    ${name1}

TC3 OpenBrowser Login
    Append To Environment Variable      Path    ${EXECDIR}${/}driver
    Open Browser        url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default      browser=gc
    Maximize Browser Window
    Set Selenium Implicit Wait    30s
    Input Text    id=authUser    admin
    Input Password    id=clearPass    pass
    Select From List By Label    name=languageChoice        English (Indian)
    Click Element    xpath=//button[@type='submit']
    Wait Until Page Contains    Flow Board      50s
    Mouse Over    xpath=//div[text()='Patient/Client']
    Click Element    xpath=//div[text()='Patients']
    Select Frame    name=fin
    Click Element    id=create_patient_btn1
    Unselect Frame
    Select Frame    name=pat
    Input Text    id=form_fname    Rashmi
    Handle Alert        action=Accept

TC4 LaunchDB4
    Open Browser        url=http://demo.openemr.io/b/openemr/interface/login/login.php?site=default      browser=gc