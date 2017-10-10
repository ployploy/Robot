*** Settings ***
Library           Selenium2Library
resource          ./keyword.robot

Suite Setup    Open Browser    ${SERVER}   Chrome
Test Setup    Go to    ${SERVER} 
Suite Teardown   Close All Browsers


*** Test Cases ***
Nonmember Buy Product 2999 Baht Display Payment Without Installment 
    Add to cart
    Not show installment
    Checkout 
    Guest login
    Show payment page

