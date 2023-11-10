*** Settings ***
Resource    ../Lib/library.robot
Library           RequestsLibrary

*** Keywords ***  
Register Account
    ${generateName}=  FakerLibrary.Name
    ${generateEmail}=  FakerLibrary.Email
    ${generatePassword}=    FakerLibrary.Password
    ${generateTitle}=    FakerLibrary.Prefix
    ${generateDay}=    FakerLibrary.Day Of Month   
    ${generateMonth}=    FakerLibrary.Month
    ${generateYear}=    FakerLibrary.Year
    
    @{split}=    Split String    ${generateName}   ${SPACE}
    ${splitFirstName}=    Get From List    ${split}    0
    ${splitLastName}=    Get From List    ${split}    1

    ${generateCompany}=    FakerLibrary.Company
    ${generateAddress1}=    FakerLibrary.Address
    ${generateAddress2}=    FakerLibrary.Address
    ${generateCountry}=    FakerLibrary.Country
    ${generateZipCode}=    FakerLibrary.Zipcode In State
    ${generateState}=    FakerLibrary.State
    ${generateCity}=    FakerLibrary.City
    ${generateMobileNumber}=    FakerLibrary.Basic Phone Number

 
    ${userData}                Create Dictionary                
    ...        name=${generateName}    
    ...        email=${generateEmail}    
    ...        password=${generatePassword} 
    ...        title=${generateTitle}
    ...        birth_date=${generateDay}
    ...        birth_month=${generateMonth}
    ...        birth_year=${generateYear}
    ...        firstname=${splitFirstName}
    ...        lastname=${splitLastName}
    ...        company=${generateCompany}
    ...        address1=${generateAddress1}
    ...        address2=${generateAddress2}
    ...        country=${generateCountry}
    ...        zipcode=${generateZipCode}
    ...        state=${generateState}
    ...        city=${generateCity}
    ...        mobile_number=${generateMobileNumber}
    
    ${response}            POST                           ${API_Register}    data=${userData}
    Log  ${response.json()}
    Log  ${userData}
    Set Global Variable    ${generateEmail}
    Set Global Variable    ${generatePassword}
    
    #Validate
    Should Be Equal As Strings    ${response.json()['message']}    ${expectedResponse}

Delete Account
    ${deleteAccount}=    Set Variable    ${generateEmail}    ${generatePassword}
    ${delete}    Create Dictionary            email=${deleteAccount[0]}    password=${deleteAccount[1]}
    ${response}        DELETE                             ${API_Delete}    data=${delete}
    Log    ${response.json()}
    
    #Validate
    Should Be Equal As Strings    ${response.json()['message']}    ${deletedResponse}