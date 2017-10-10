*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Nonmember Buy Product 3000 Baht It Should Display Installment Options
    Select product over 1 piece
    Add to cart
    Show all payment
    Payment by installment
    Guest login
    Show payment page