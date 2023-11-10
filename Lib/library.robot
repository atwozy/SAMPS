*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary
Library    String
Library    Collections
Library    OperatingSystem
Library    XML
Variables    ../Variable/var.yaml
Resource    ../PageObject/LoginModule.robot
Resource    ../PageObject/Assign.robot

*** Variables ***
${API_Register}        https://automationexercise.com/api/createAccount
${API_Delete}          https://automationexercise.com/api/deleteAccount
${expectedResponse}    User created!
${deletedResponse}    Account deleted!
*** Keywords ***
Open Exercise Site
    Open Browser    https://automationexercise.com/    Chrome
    Maximize Browser Window
    Wait Until Element Is Visible    ${Login}[pageVisibility]
    
    