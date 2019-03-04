*** Settings ***
Resource          ../resource.robot
Suite Setup       Setup Appium Servers    ${Andi}  ${Budi}
Suite Teardown    Close Appium Servers
Test Setup        Setup for Chats
Test Teardown     Test Teardown
Force Tags        Chats

*** Test Cases ***
Send Text Message
    [Documentation]    Andi starts chat with Budi
    ...                Andi sends message to Budi
    ...                Budi verifies that message was received
    [Tags]    Author:willy    Sanity
    
    Switch Application        ${Andi.KEY}
    Chat Lists.Select Floating Action Button
    Chat Lists.Select Menu Item    Find People
    Find People.Search    ${Budi.KIK_USERNAME}
    Find People.Select User Name    ${Budi.KIK_USERNAME} 
    ${message}    FakerLibrary.Sentence   
    Chat Active.Send Message    ${message}
    Chat Active.Verify Sent Message    ${message}
    Chat Active.Select Back Button    

    Switch Application        ${Budi.KEY}
    Chat Lists.Verify Last Chat Message with User    ${Andi.FIRST_NAME}    ${Andi.LAST_NAME}    ${message}
    Chat Lists.Open Chat From    ${Andi.FIRST_NAME}    ${Andi.LAST_NAME}
    Chat Active.Verify Received Message    ${message}
    Chat Active.Select Back Button
    
    Chats Logic.Delete All Chats    ${Andi}
    Chats Logic.Delete All Chats    ${Budi}
