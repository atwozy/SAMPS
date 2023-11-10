*** Settings ***
Resource    ../Lib/library.robot
Resource    ../PageObject/apiTest.robot
Suite Setup    Open Exercise Site

*** Test Cases ***
Login Module
    LoginModule.Register User
    
Register Module
    Assign.Variables
    Assign.Register User
    Assign.Login user with valid credentials
    Assign.Logout User
    Assign.Delete User

API Test    
    apiTest.Register Account
    apiTest.Delete Account
   