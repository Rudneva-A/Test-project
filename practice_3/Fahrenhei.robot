*** Test Cases ***
Test Fahrenheit
#    ${number var}    Set Variable    ${1.8}
#    ${сelcius var}    Set Variable    ${30}
#    ${Fahrenheit var}=    Evaluate       ${number var} * ${сelcius var} + ${32}
    Fahrenheit
    


*** Keywords ***
Fahrenheit
    ${number var}    Set Variable    ${1.8}
    ${сelcius var}    Set Variable    ${30}
    ${Fahrenheit var}=    Evaluate       ${number var} * ${сelcius var} + ${32}
    Log    ${Fahrenheit var}
