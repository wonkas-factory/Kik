*** Keywords ***
Send Message
    [Arguments]    ${message}
    Wait Until Page Contains Element    id=txt_new_message
    Input Text    id=txt_new_message    ${message}   
    Wait Until Page Contains Element    id=button_send_message
    Click Element    id=button_send_message  

Verify Sent Message
    [Arguments]    ${message}
    Wait Until Page Contains Element    xpath=//*[@resource-id='${KIK_PACKAGE}:id/messages_list']/*/*/android.widget.TextView[@text='${message}']
  
Verify Received Message
    [Arguments]    ${message}
    Wait Until Page Contains Element    xpath=//*[@resource-id='${KIK_PACKAGE}:id/messages_list']/*/*/*/android.widget.TextView[@text='${message}']

Select Back Button
    Wait Until Page Contains Element    id=back_button_image
    Click Element    id=back_button_image
