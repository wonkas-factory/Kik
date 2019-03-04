*** Keywords ***
Setup Appium Servers
    [Arguments]    @{users}
    Run Process            pwd                   shell=True    alias=proc1
    ${WORKING_PATH}        Get Process Result    proc1         stdout=true
    Set Global Variable    ${WORKING_PATH}
    Kill Appium
    #Clears List
    ${ACTIVE_USERS}        Create List
    Set Global Variable    ${ACTIVE_USERS}
    :FOR    ${user}    IN    @{USERS}
    \    Run Keywords
    \    ...    Spawn Appium Server    ${user}
    \    ...    AND    First Open Application  ${user}

Setup for Chats
    Switch Application    ${Andi.KEY}
    Launch Application
    Chats Logic.Delete All Chats    ${Andi}
    Switch Application    ${Budi.KEY}
    Launch Application
    Chats Logic.Delete All Chats    ${Budi}
