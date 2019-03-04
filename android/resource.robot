# This would serve as a global reference for all tests
# ex. All library and resources and application control keywords only
*** Settings ***
Library     AppiumLibrary    ${DEFAULT_TIMEOUT}    run_on_failure=Log Source
Library     Collections
Library     String
Library     Process
Library     DateTime
Library     FakerLibrary
Library     DebugLibrary
Library     OperatingSystem

Resource    config/test_data.robot
Resource    util/Device Utility.robot
Resource    util/Setups.robot
Resource    util/Teardowns.robot
Resource    pages/_PAGE_IMPORTS.robot
Resource    logic/_LOGIC_IMPORTS.robot

*** Variables ***
${WORKING_PATH}             ${EXECDIR}
${KIK_PACKAGE}              kik.android
${KIK_ACTIVITY}             kik.android.chat.activity.IntroActivity
${KIK_START_ACTIVITIES}     kik.android.chat.activity.IntroActivity, kik.android.chat.activity.ConversationsActivity
${DEFAULT_TIMEOUT}          15
${FAST_TIMEOUT}             3
${WORKING_FOLDER}           /
@{ACTIVE_USERS}             #DEFAULT EMPTY LIST OF APPIUM USERS
@{APPIUM_INSTANCES}         #DEFAULT EMPTY LIST OF APPIUM PROCESS INSTANCES



*** Keywords ***
First Open Application
    [Arguments]    ${user}
    Append To List      ${ACTIVE_USERS}    ${user.KEY}
    Open Application    ${user.APPIUM_SERVER}
    ...                 platformName=${user.PLATFORM}
    ...                 automationName=${user.AUTOMATION_NAME}
    ...                 udid=${user.UDID}
    ...                 deviceName=${user.KEY}
    ...                 app=${APK_TARGET}
    ...                 appPackage=${KIK_PACKAGE}
    ...                 appActivity=${KIK_ACTIVITY}
    ...                 appWaitActivity=${KIK_START_ACTIVITIES}
    ...                 alias=${user.KEY}
    ...                 newCommandTimeout=19000
    ...                 fullReset=false
    ...                 noReset=true
    ...                 androidInstallTimeout=300000

Spawn Appium Server
    [Arguments]    ${user}
    ${instance}    Start Process    appium
    ...    -p     ${user.PORT}
    ...    -bp    ${user.BOOTSTAP_PORT}
    ...    -U     ${user.UDID}
    ...    --session-override
    ...    --relaxed-security
    ...    alias=${user.KEY}
    ...    stdout=${WORKING_PATH}/appium-log-${user.KEY}.txt
    ...    shell=true
    Append To List    ${APPIUM_INSTANCES}    ${instance}
    Sleep    ${FAST_TIMEOUT}

Kill Appium
  [Documentation]  Terminates all processes created by robot used for the Appium Servers
    :FOR    ${instance}    IN    @{APPIUM_INSTANCES}
    \       Terminate Process    ${instance}  kill=True

    #Clears List
    ${APPIUM_INSTANCES}    Create List
    Set Global Variable    ${APPIUM_INSTANCES}

Quit All Applications
    :FOR    ${user}    IN    @{ACTIVE_USERS}
    \       Switch Application    ${user}
    \       Quit Application
