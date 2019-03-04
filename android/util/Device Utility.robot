*** Keywords ***
Capture Screenshot For Active Users  
    :FOR    ${user}    IN    @{ACTIVE_USERS}
    \       Switch Application    ${user}
    \       Capture Page Screenshot   filename=${TEST NAME}-${user}.png
