*** Keywords ***
Search
    [Arguments]    ${text}
    Wait Until Page Contains Element    id=search_bar_search_field
    Input Text    id=search_bar_search_field    ${text}   

Select User Name
    [Arguments]    ${username}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@resource-id='${KIK_PACKAGE}:id/contact_username'][@text='${username}']
    Click Element    xpath=//android.widget.TextView[@resource-id='${KIK_PACKAGE}:id/contact_username'][@text='${username}']
