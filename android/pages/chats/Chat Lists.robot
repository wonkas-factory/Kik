*** Keywords ***
Long Press Chat
    [Arguments]    ${timeout}=${DEFAULT_TIMEOUT}
    Wait Until Page Contains Element    id=conversation_name    ${timeout}    
    Long Press    id=conversation_name

Select Menu Item
    [Documentation]    Delete, Mute or Chat Info, Find People, Scan Kik Code, Start a Group,
    ...                Public Groups, Discover Bots, Kin Market Place Beta  
    [Arguments]    ${item}
    Wait Until Page Contains Element    xpath=//android.widget.TextView[@text='${item}']
    Click Element    xpath=//android.widget.TextView[@text='${item}']

Select Floating Action Button
    Wait Until Page Contains Element    id=floating_action_button
    Click Element    id=floating_action_button
    
Verify Last Chat Message with User
    [Arguments]    ${first_name}    ${last_name}    ${message}
    Wait Until Page Contains Element    xpath=//*[@resource-id='${KIK_PACKAGE}:id/conversation_name'][@text='${first_name} ${last_name}']/parent::*/following-sibling::*/*[@resource-id='${KIK_PACKAGE}:id/conversation_last_msg'][@text='${message}']
    
Open Chat From
    [Arguments]    ${first_name}    ${last_name}
    Wait Until Page Contains Element    xpath=//*[@resource-id='${KIK_PACKAGE}:id/conversation_name'][@text='${first_name} ${last_name}']
    Click Element    xpath=//*[@resource-id='${KIK_PACKAGE}:id/conversation_name'][@text='${first_name} ${last_name}']
