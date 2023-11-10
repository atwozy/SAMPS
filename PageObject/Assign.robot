*** Settings ***
Resource    ../Lib/library.robot

*** Keywords ***  
Variables
    ${generateEmail}=  FakerLibrary.Email
    ${generateName}=  FakerLibrary.Name
    ${generateNumber} =    Evaluate    random.randint(1, 2)
    ${generatePassword}=    FakerLibrary.Password
    ${Day}=    FakerLibrary.Day Of Month
    ${generateDay}=    Evaluate    "${Day}".lstrip("0")
    ${Month}=    FakerLibrary.Month
    ${generateMonth}=    Evaluate    "${Month}".lstrip("0")
    ${generateYear}=    FakerLibrary.Year
    ${generateCompany}=    FakerLibrary.Company
    ${generateAddress1}=    FakerLibrary.Address
    ${generateAddress2}=    FakerLibrary.Address
    ${generateState}=    FakerLibrary.State
    ${generateCity}=    FakerLibrary.City
    ${generateZipCode}=    FakerLibrary.Zipcode In State
    ${generateMobileNumber}=    FakerLibrary.Basic Phone Number
    
    Set Global Variable    ${generateEmail}
    Set Global Variable    ${generateName}
    Set Global Variable    ${generateNumber}
    Set Global Variable    ${generatePassword}
    Set Global Variable    ${generateDay}
    Set Global Variable    ${generateMonth}
    Set Global Variable    ${generateYear}
    Set Global Variable    ${generateCompany}
    Set Global Variable    ${generateAddress1}
    Set Global Variable    ${generateAddress2}
    Set Global Variable    ${generateState}
    Set Global Variable    ${generateCity}
    Set Global Variable    ${generateZipCode}
    Set Global Variable    ${generateMobileNumber}

Register User   
    #Input name and email
    Click Element    ${Login}[loginBtn]
    Element Should Be Visible    ${Login}[signupElem]
    Input Text    ${Login}[nameField]    ${generateName}
    Input Text    ${Login}[emailField]    ${generateEmail}
    Click Element    ${Login}[signupBtn]

    #Input credentials   
    Element Should Be Visible    ${Login}[accountInfo]
    Click Element    xpath=//*[@class='radio-inline'][${generateNumber}]/label 
    Input Text    ${Login}[passField]    ${generatePassword}
    Select From List By Value    ${Login}[drpDay]    ${generateDay}
    Select From List By Value    ${Login}[drpMonth]    ${generateMonth}
    Select From List By Value    ${Login}[drpYear]    ${generateYear}
    
    ${count}=    Set Variable    1
    ${elem}=    Get WebElements    ${Login}[checkbox]   
    ${length}=    Get Length    ${elem}

    WHILE    ${count} <= ${length}
        Click Element    xpath=//*[@class='checkbox'][${count}]/*[@class='checker']/span/input   
        ${count}=    Evaluate    ${count}+1
    END
    
    @{split}=    Split String    ${generateName}   ${SPACE}
    ${splitFirstName}=    Get From List    ${split}    0
    ${splitLastName}=    Get From List    ${split}    1

    Input Text    ${Login}[firstName]    ${splitFirstName}    
    Input Text    ${Login}[lastName]    ${splitLastName}
    Input Text    ${Login}[company]    ${generateCompany}
    Input Text    ${Login}[address1]    ${generateAddress1}
    Input Text    ${Login}[address2]    ${generateAddress2}
    ${countryList} =    Get List Items    id=country 
    ${countryIndex} =    Evaluate    random.randrange(0, len(${countryList}))
    ${countryValue} =    Get From List    ${countryList}    ${countryIndex}

    Select From List By Value    ${Login}[country]    ${countryValue}
        
    Input Text    ${Login}[state]    ${generateState}
    Input Text    ${Login}[city]    ${generateCity}
    Input Text    ${Login}[zipcode]    ${generateZipCode}
    Input Text    ${Login}[mobileNumber]    ${generateMobileNumber}
    Click Element    ${Login}[createBtn]
    Click Element    ${Login}[continueBtn]

    #Remove ads
    Execute Javascript    var elementsToRemove = document.querySelectorAll(".adsbygoogle");
    ...    elementsToRemove.forEach(function(element) {element.remove();});
    
    Click Element    ${Login}[LogoutBtn]

Login user with valid credentials
    Input Text    ${Login}[email]    ${generateEmail}
    Input Text    ${Login}[password]    ${generatePassword}
    Click Element    ${Login}[LoginBtn]

Logout User
    Click Element    ${Login}[LogoutBtn]

Delete User
    Element Should Be Visible    ${Login}[loginVisibility]
    Input Text    ${Login}[email]    ${generateEmail}
    Input Text    ${Login}[password]    ${generatePassword}
    Click Element    ${Login}[LoginBtn]
    Click Element    ${Login}[delete]

    #Remove ads
    Execute Javascript    var elementsToRemove = document.querySelectorAll(".adsbygoogle");
    ...    elementsToRemove.forEach(function(element) {element.remove();});

    Click Element    ${Login}[continueDeleteBtn]
    
    
    


