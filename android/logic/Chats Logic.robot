*** Settings ***
Resource              ../pages/_PAGE_IMPORTS.robot

*** Keywords ***
Delete All Chats
    [Arguments]    ${user}
    Switch Application    ${user.KEY}
    :FOR    ${i}    IN RANGE    10
    \    ${status}    Run Keyword And Return Status    Chat Lists.Long Press Chat    ${FAST_TIMEOUT}
    \    Exit For Loop If    ${status} == False
    \    Chat Lists.Select Menu Item    Delete
