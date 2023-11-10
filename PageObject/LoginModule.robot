*** Settings ***
Resource    ../Lib/library.robot
Library    String
Library    Collections
Library    XML

*** Keywords ***

    #${close_button}    Get Element    css: #dismiss-button
    #${button_visible}    Run Keyword and Return Status    Element Should Be Visible    ${close_button}
    #Run Keyword If    ${button_visible}    Click Element    ${close_button}

Register User   
    Click Element    ${Login}[loginBtn]
    Element Should Be Visible    ${Login}[signupElem]
    Input Text    ${Login}[nameField]    ${name}
    Input Text    ${Login}[emailField]    ${email}
    Click Element    ${Login}[signupBtn]   
    Element Should Be Visible    ${Login}[accountInfo]
    Click Element    ${Login}[rdBtn]
    Input Text    ${Login}[passField]    ${password}
    Select From List By Value    ${Login}[drpDay]    ${day}
    Select From List By Value    ${Login}[drpMonth]    ${month}
    Select From List By Value    ${Login}[drpYear]    ${year}
    
    ${count}=    Set Variable    1
    ${elem}=    Get WebElements    ${Login}[checkbox]   
    ${length}=    Get Length    ${elem}

    WHILE    ${count} <= ${length}
        Click Element    xpath=//*[@class='checkbox'][${count}]/*[@class='checker']/span/input   
        ${count}=    Evaluate    ${count}+1
    END
    
    @{split}=    Split String    ${name}    M.
    ${splitFirstName}=    Get From List    ${split}    0
    ${splitLastName}=    Get From List    ${split}    1

    Input Text    ${Login}[firstName]    ${splitFirstName}    
    Input Text    ${Login}[lastName]    ${splitLastName}
    Input Text    ${Login}[company]    ${company}
    Input Text    ${Login}[address1]    ${address1}
    Input Text    ${Login}[address2]    ${address2}
    Select From List By Value    ${Login}[country]    ${country}
    Input Text    ${Login}[state]    ${state}
    Input Text    ${Login}[city]    ${city}
    Input Text    ${Login}[zipcode]    ${zip}
    Input Text    ${Login}[mobileNumber]    ${number}
    Click Element    ${Login}[createBtn]
    Element Should Be Visible    ${Login}[createdMessage]
    Click Element    ${Login}[continueBtn]
    Element Should Be Visible    ${Login}[username]
    Click Element    ${Login}[delete]
    Element Should Be Visible    ${Login}[deletedMessage]
    Click Element    ${Login}[continueDeleteBtn]

Login user with valid credentials
    Click Element    ${Login}[loginBtn]
    Element Should Be Visible    ${Login}[loginVisibility]
    Input Text    ${Login}[email]    text
    Input Text    ${Login}[password]    text
    Click Element    ${Login}[LoginBtn]

    


