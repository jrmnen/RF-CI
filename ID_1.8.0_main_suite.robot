*** Settings ***
Suite Setup       
Suite Teardown    Close Browser
Library           Selenium2Library
Library           python_keyword_library
Resource          MyKeywordResources.robot

*** Comments ***
This suite is for continuous testing and should be run every morning. 
All test cases should be so robust that that they should not fail on minor performance issues.
There should be checks in every test case. Every test case should be run with every browser.
Templates and tags should be used.

This version is planned to run as Jenkins matrix project with Chrome, FF and IE running simultaneously.

*** Variables ***
${adress}         http://qa-elbasweb1/

*** Test Cases ***
Test Case 1
    [Tags]  IE
    [Setup]  Login With Admin User  ${BROWSER}
    Select FI Portfolio If Not Selected
    Open Column Group Selector
    Make All Products Visible In Market Information
    Wait Until Keyword Succeeds    20 sec    0.1 sec    Select Any Product Row
    Close Order Depth
    Verify Order Depth Closed
    Open Order Depth
    Verify Order Depth Open
    Place Max 10 Orders Until Best
    Select Integrated Blotter Today Filter
    Store My Orders Row Count
    Verify Deactivate and Activate All
    Close Integrated Blotter
    Verify Integrated Blotter Closed
    Open Integrated Blotter
    Verify Integrated Blotter Open
    Deactivate And Verify All Loop
    Activate And Verify All Loop
    Doubleclick Row
    [Teardown] Close Browser

UI Views Behave Correctly
    Login with Admin User ${BROWSER}
    Open PF selector
    Close PF selector
    Open OD
    Close OD
    Open Integrated Blotter
    Close Integrated Blotter
    Open Order Ticket In Market Information
    Close Order Ticket
    Open Order Ticket In Order Depth
    Open User Voice Window
    Close User Voice Window
    Change Timezone To GMT+1
    Chage Timezone To EEST
    [Teardown] Close Browser
